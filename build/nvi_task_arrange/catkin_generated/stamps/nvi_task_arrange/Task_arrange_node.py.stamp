#!/usr/bin/env python
from openai import OpenAI
import json
import pyttsx3
import rospy
from std_msgs.msg import String,Empty


client = OpenAI(
  api_key="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",
  base_url="https://service-2092aoga-1323072165.hk.tencentapigw.com/v1"
)
template = """
You are an assistant who can arrange tasks for a blind navigator. Currently, you have APIs for different applications. You are expected to take in instructions in Chinese and output the invocation sequence of these APIs. You have APIs below:
    [
    dict(name='UpDownStairs::recognition', description='The function is used to tell the user if the stairs are up or down and how far away they are from the user'),
    dict(name='BusRec::recognition', description='The function is used to tell the user what the number of the bus in front of him or her'),
    dict(name='TrafficLight::status', description='The function is used to tell the user what status of the traffic light in front of him or her')
    ]
When generating invocation sequence, you should figure out the API most suitable to the user's instruction. I will give you some instances below to show you how to generate a suitable invocation code:
"""


class Variable:
    def __init__(self, name='default', value=None):
        self.name = name
        self.value = value


class Tool:
    def __init__(self, user_instruction):
        self.status = True
        self.var_table = []
        self.instruction = user_instruction
        if self.status:
            if self.instruction == 'exit':
                self.status = False
            response = client.chat.completions.create(
                model="gpt-3.5-turbo",
                messages=[
                    {"role": "system", "content": template},
                    {"role": "user", "content": "请给我描述一下我面前的楼梯"},
                    {"role": "assistant", "content": "UpDownStairs::recognition"},
                    {"role": "user", "content": "请告诉我面前红绿灯的状态"},
                    {"role": "assistant", "content": "TrafficLight::status"},
                    {"role": "user", "content": "请告诉我我面前到公交车是几路车"},
                    {"role": "assistant", "content": "BusRec::recognition"},
                    {"role": "user", "content": self.instruction}
                ]
            )
            text = response.choices[0].message.content
            text = text.split('\n')
            print(text)
            self.text = text
            # for item in text:
            #     engine = pyttsx3.init()  # 创建engine并初始化
            #     engine.setProperty('voice', 'zh')
            #     # engine.say(item)  # 开始朗读
            #     # engine.runAndWait()  # 等待语音播报完毕
            #     if '&&&' in item:
            #         var_name = item.split(' = ')[0].strip()
            #         c_name = item.split('::')[0].split('= ')[-1]
            #         f_name = item.split('::')[-1].strip()
            #         try:
            #             topic_name =  c_name + '/' + f_name

            #         except Exception as e:
            #             print(repr(e))
            #     elif 'return' in item:
            #         try:
            #             return_param = item.split('return ')[-1]
            #             for var in self.var_table:
            #                 if return_param == var.name:
            #                     print('调用链测试成功')
            #                     break
            #         except Exception as e:
            #             print(repr(e))
            # self.var_table = []


class Task_Arranger:
    def __init__(self) -> None:
        rospy.init_node('task_arranger')
        self.status = False
        self.detector = rospy.Subscriber("/speech/heartbeat", Empty, self.detect)
        self.det = rospy.Subscriber('typing', String, self.on_receive)
        self.receiver = rospy.Subscriber("/speech/command", String, self.on_receive)

    def detect(self, msg) -> None:
        if type(msg) == type(Empty()):
            self.status = True

    def on_receive(self, msg) -> None:
        if self.status:
            instruct = msg.data
            print(msg.data)
            tool = Tool(instruct)
            self.text = tool.text
            for item in self.text:
                if '::' in item:
                    c_name = item.split('::')[0].split('= ')[-1]
                    f_name = item.split('::')[-1].strip()
                    topic_name =  '/' + c_name + '/' + f_name
                    print(topic_name)
                    pub = rospy.Publisher(topic_name, Empty)
                    empty = Empty()
                    pub.publish(empty)


if __name__ == '__main__':
    task_arranger = Task_Arranger()
    rospy.spin()
