import rospy
from std_msgs.msg import String
import sys


if __name__=='__main__':
    rospy.init_node('client')

    if len(sys.argv) > 1:
        question_msg = String()
        question_msg.data = sys.argv[1]
        ask_pub = rospy.Publisher('chat', String)
        rospy.sleep(0.1)
        ask_pub.publish(question_msg)
    else:
        rospy.logwarn('Please input the message')
    
    rospy.sleep(0.1)






