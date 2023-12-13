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
class BusRec:
    def __init__(self) -> None:
        rospy.init_node('busrec')
        self.status = False
        self.recognition_heartbeat = rospy.Subscriber('/BusRec/recognition', Empty, self.keep_alive)
        self.publisher = rospy.Publisher('/voice/system', String, queue_size=10)
        self.image_subscriber = rospy.Subscriber('/camera/rgb/image_raw/compressed', CompressedImage, self.recognition)

    def keep_alive(self, empty) -> None:
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
            cv2.imwrite('bus.jpg', img)
            try:
                base64_image = self.encode_image('bus.jpg')

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
                                    "text": "Now you are BusRec. BusRec is a GPT specifically tailored to assist visually impaired users by announcing the numbers of arriving buses at a station. Its core function is to provide clear, audible information about bus numbers, focusing on a specific set: 466, 601, 400内, and 400快内. This targeted approach ensures that the information is highly relevant and concise, making it easily comprehensible for users. BusRec is programmed to recognize these bus numbers and announce them as they arrive, avoiding any details about bus routes, schedules, or other transportation information, to maintain simplicity and directness in its assistance."
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
                print(repr(e))
                info = 'Check Failure'
                self.publisher.publish(info)
        self.status = False


if __name__ == '__main__':
    stair_rec = BusRec()
    rospy.spin()
