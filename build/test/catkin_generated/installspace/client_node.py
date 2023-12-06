#!/usr/bin/env python3
import rospy
from std_msgs.msg import String
import sys


def action(msg):
    print(msg.data)
    return


if __name__=='__main__':
    rospy.init_node('client')

    # if len(sys.argv) > 1:
    #     question_msg = String()
    #     question_msg.data = sys.argv[1]
    #     ask_pub = rospy.Publisher('chat', String)
    #     rospy.sleep(0.1)
    #     ask_pub.publish(question_msg)
    # else:
    #     rospy.logwarn('Please input the message')
    while not rospy.is_shutdown():
        # temp = input()
        # question_msg = String()
        # question_msg.data = temp
        # ask_pub = rospy.Publisher('chat', String)
        # ask_pub.publish(question_msg)
        answer = rospy.Subscriber('chat', String, action)
    rospy.sleep(0.1)






