#!/usr/bin/env python3
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
        self.status = False
        self.recognition_heartbeat = rospy.Subscriber('/UpDownStairs/recognition', Empty, self.keep_alive)
        self.publisher = rospy.Publisher('/voice/system', String)
        self.image_subscriber = rospy.Subscriber('/camera/rgb/image_raw/compressed', CompressedImage, self.recognition)

    def keep_alive(self, empty) -> None:
        self.status = True

    @staticmethod
    def encode_image(image_path):
        with open(image_path, "rb") as image_file:
            return base64.b64encode(image_file.read()).decode('utf-8')

    def recognition(self, compressed_img) -> None:
        if self.status:
            self.bridge = CvBridge()
            img = self.bridge.compressed_imgmsg_to_cv2(compressed_img)
            cv2.imwrite('./src/UpDownStairs/image/stairs.jpg', img)
            try:
                base64_image = self.encode_image('./src/UpDownStairs/image/stairs.jpg')

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
                response = requests.post("https://api.openai.com/v1/chat/completions", headers=headers, json=payload)
                info = response.json()
                info = info['choices'][0]['message']['content']
                self.publisher.publish(info)
            except Exception as e:
                info = '查询失败'
                self.publisher.publish(info)
        self.status = False


if __name__ == '__main__':
    stair_rec = UpDownStairs()
    rospy.spin()
