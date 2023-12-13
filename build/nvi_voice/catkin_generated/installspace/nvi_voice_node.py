#!/usr/bin/env python3
from std_msgs.msg import String
import rospy
import pyttsx3
import time


class NVIVoice:
    def __init__(self):
        rospy.init_node('nvi_voice', anonymous=True)

        self.DELTA_TIME = rospy.get_param("/voice/delta_time", default=3)
        self.language = rospy.get_param("/voice/language", default='en')

        if self.language == 'en':
            rospy.Subscriber("/voice/nvi_voice_topic", String, self.ttsCallback)
        elif self.language == 'zh':
            rospy.Subscriber("/voice/nvi_voice_topic", String, self.ttsCallbackZH)

        self.last_time = time.perf_counter()

        rospy.spin()

    def ttsCallback(self, text):
        rospy.loginfo(rospy.get_caller_id()+"I heard %s", text.data)
        words = text.data.split('|')
        if len(words) < 3:
            rospy.loginfo("The number of thewords should be 3.")
            return
        mode, action, description = words[0], words[1], words[2]
        engine = pyttsx3.init()
        engine.setProperty('rate', 150)  # voicerate
        engine.setProperty('volume', 1.0)  # voicevolume0~1
        engine.setProperty('voice', 'en')
        if mode == 'H':
            engine.say(action)
        else:
            if time.perf_counter() - self.last_time < self.DELTA_TIME:
                return
            self.last_time = time.perf_counter()
            if mode == 'M':
                engine.say("detected "+words[2]+" ahead, please"+action)
            elif mode == 'L':
                engine.say(description)
            else:
                rospy.loginfo("Illegalmode%s.", mode)
        engine.runAndWait()
        engine.stop()

    def ttsCallbackZH(self, text):
        rospy.loginfo(rospy.get_caller_id()+"I heard %s", text.data)
        words = text.data.split('|')
        if len(words) < 3:
            rospy.loginfo("The number of thewords should be3.")
            return
        mode, action, description = words[0], words[1], words[2]
        engine = pyttsx3.init()
        engine.setProperty('rate', 200)  # voicerate
        engine.setProperty('volume', 1.0)  # voicevolume0~1
        engine.setProperty('voice', 'zh')
        if mode == 'H':
            engine.say(action)
        else:
            if time.perf_counter() - self.last_time < self.DELTA_TIME:
                return
            self.last_time = time.perf_counter()
            if mode == 'M':
                engine.say("前方检测到 "+words[2]+", 请"+action)
            elif mode == 'L':
                engine.say(description)
            else:
                rospy.loginfo("Illegalmode%s.", mode)
        engine.runAndWait()
        engine.stop()


if __name__ == '__main__':
    nvi_voice = NVIVoice()
