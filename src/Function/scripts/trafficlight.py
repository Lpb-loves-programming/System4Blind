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
class TrafficLight:
    def __init__(self) -> None:
        rospy.init_node('trafficlight')
        self.status = False
        self.recognition_heartbeat = rospy.Subscriber('/TrafficLight/status', Empty, self.keep_alive)
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
            cv2.imwrite('light.jpg', img)
            try:
                base64_image = self.encode_image('light.jpg')

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
                                    "text": "Now you are TrafficLight. TrafficLight is a GPT dedicated to providing status updates on pedestrian traffic lights. Its primary role is to inform users if the light is 'green' or 'red,' and when a countdown is present, to include the time left like 'green, 15s left' or 'red, 24s left.' In situations where specific details are not provided, TrafficLight is designed to make assumptions based on typical pedestrian traffic light patterns. It does not ask for clarifications but rather uses standard patterns to infer the most likely scenario. This GPT strictly confines itself to the realm of pedestrian traffic lights, avoiding any engagement with topics outside this narrow focus, such as vehicle traffic lights, legal advice, or personal opinions."
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
    stair_rec = TrafficLight()
    rospy.spin()
