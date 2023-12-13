#!/usr/bin/env python
import rospy
from std_msgs.msg import String, Empty
from sensor_msgs.msg import Image, CompressedImage
import cv2
from cv_bridge import CvBridge, CvBridgeError
import base64
import requests
from openai import OpenAI


api_key = "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"
class UpDownStairs:
    def __init__(self) -> None:
        rospy.init_node('updownstairs')
        self.status = False
        self.recognition_heartbeat = rospy.Subscriber('/UpDownStairs/recognition', Empty, self.keep_alive)
        self.publisher = rospy.Publisher('/voice/system', String, queue_size=10)
        self.image_subscriber = rospy.Subscriber('/camera/rgb/image_raw/compressed', CompressedImage, self.recognition)

    def keep_alive(self, empty) -> None:
        print(333333333333333333333)
        self.status = True

    @staticmethod
    def encode_image(image_path):
        with open(image_path, "rb") as image_file:
            return base64.b64encode(image_file.read()).decode('utf-8')

    def recognition(self, compressed_img) -> None:
        if self.status:
            self.status = False
            self.bridge = CvBridge()
            img = self.bridge.compressed_imgmsg_to_cv2(compressed_img)
            cv2.imwrite('stairs.jpg', img)
            try:
                base64_image = self.encode_image('stairs.jpg')

                headers = {
                    "Content-Type": "application/json",
                    "Authorization": f"Bearer {api_key}"
                }

                payload = {
                    "model": "gpt-4-vision-preview",
                    "messages": [
                        {
                            "role": "user",
                            "content": [
                                {
                                    "type": "text",
                                    "text": "Now you are UpDownStairs. UpDownStairs is designed to assist users by providing concise information about the presence and location of stairs in urban areas. It specializes in identifying whether there are stairs ahead, their direction (up or down), and an estimated distance to the stairs, such as 'upstairs, 3m' or 'downstairs, 5m.' The responses should be brief and to the point, focusing solely on the direction and distance of the stairs without additional details. This GPT is particularly helpful for individuals with mobility challenges, ensuring they have the necessary information to navigate urban environments more easily."
                                },
                                {
                                    "type": "image_url",
                                    "image_url": {
                                        "url": f"data:image/jpeg;base64,{base64_image}"
                                    }
                                }
                            ]
                        }
                    ],
                    "max_tokens": 300
                }
                response = requests.post("https://service-2092aoga-1323072165.hk.tencentapigw.com/v1/chat/completions", headers=headers, json=payload)
                info = response.json()
                info = info['choices'][0]['message']['content']
                print(info)
                self.publisher.publish(info)
            except Exception as e:
                info = 'Check Failure'
                print(repr(e))
                self.publisher.publish(info)
        self.status = False


if __name__ == '__main__':
    stair_rec = UpDownStairs()
    rospy.spin()
