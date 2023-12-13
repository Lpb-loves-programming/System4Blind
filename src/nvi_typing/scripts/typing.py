#!/usr/bin/env python
import rospy
from std_msgs.msg import String,Empty
import json
import os

class Typing:
    def __init__(self) -> None:
        rospy.init_node('typing')
        self.status = True
        self.heartbeat_pub = rospy.Publisher("/speech/heartbeat", Empty, queue_size=10)
        self.publisher = rospy.Publisher('typing', String, queue_size=100)
    def spin(self) -> None:
        while not rospy.is_shutdown():
            text = input()
            self.heartbeat_pub.publish(Empty())
            self.publisher.publish(text)
            

if __name__ == '__main__':
    chatnode = Typing()
    chatnode.spin()
