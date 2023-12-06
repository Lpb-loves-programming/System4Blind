from openai import OpenAI
import json
import pyttsx3
import rospy
from std_msgs.msg import String,Empty


client = OpenAI(
  api_key="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",
  base_url="https://api.openai-proxy.com/v1"
)
template = """
You are an assistant who can arrange tasks for a blind navigator. Currently, you have APIs for different applications. You are expected to take in instructions in Chinese and output the invocation sequence of these APIs. You have APIs below:
    [
    dict(name='UpDownStairs::recognition', description='The function is used to tell the user if the stairs are up or down and how far away they are from the user', parameter=[], result_name='info')
    ]
When generating invocation sequence, you should use the psedo-code-like format below. Each line represent a statement, and it either a execution of a function. I will give you some instances below to show how to generate pseudo codes to represent the invocation sequence:
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
                    {"role": "assistant", "content": "info = UpDownStairs::recognition&&&{}\nreturn info"},
                    {"role": "user", "content": "我前面的楼梯长什么样子"},
                    {"role": "assistant", "content":"info = UpDownStairs::recognition&&&{}\nreturn info"},
                    {"role": "user", "content": self.instruction}
                ]
            )
            text = response.choices[0].message.content
            text = text.split('\n')
            for item in text:
                engine = pyttsx3.init()  # 创建engine并初始化
                engine.setProperty('voice', 'zh')
                engine.say(item)  # 开始朗读
                engine.runAndWait()  # 等待语音播报完毕
                # if '&&&' in item:
                #     var_name = item.split(' = ')[0].strip()
                #     c_name = item.split('::')[0].split('= ')[-1]
                #     f_name = item.split('::')[-1].split('&&&')[0].strip()
                #     params = item.split('&&&')[-1]
                #     try:
                #         params = eval(params)
                #         for name, value in params.items():
                #             for var in self.var_table:
                #                 if value == var.name:
                #                     params[name] = var.value
                #                     break
                #         class_obj = globals()[c_name]
                #         instance = class_obj()
                #         func = getattr(instance, f_name)
                #         status, result = func(**params)
                #         print(result)
                #         variable = Variable(var_name, result)
                #         self.var_table.append(variable)
                #     except Exception as e:
                #         print(repr(e))
                # elif 'return' in item:
                #     try:
                #         return_param = item.split('return ')[-1]
                #         for var in self.var_table:
                #             if return_param == var.name:
                #                 print('调用链测试成功')
                #                 break
                #     except Exception as e:
                #         print(repr(e))
            self.var_table = []


class Task_Arranger:
    def __init__(self) -> None:
        rospy.init_node('task_arranger')
        self.status = False
        self.detector = rospy.Subscriber("/speech/heartbeat", Empty, self.detect)
        self.receiver = rospy.Subscriber("/speech/command", String, self.on_receive)

    def detect(self, msg) -> None:
        if type(msg) == type(Empty()):
            self.status = True

    def on_receive(self, msg) -> None:
        if self.status:
            instruct = msg.data
            Tool(instruct)


if __name__ == '__main__':
    task_arranger = Task_Arranger()
    rospy.spin()
