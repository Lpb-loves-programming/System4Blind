#!/usr/bin/env python3
import openai
import json
import rospy
from nvi_msgs.msg import Location
from std_msgs.msg import String
openai.api_base = "http://api.visfmod.com/v1"
openai.api_key = "fk-juhaokun/BbK7dvZ4niH8FSCi"


template = """
我现在有一些底层模块，可以完成一些任务，我们将这些任务称之为原子任务。现在我想构建一个辅助视觉障碍者决策的导盲系统，你的任务是生成底层模块调用序列，序列的每一条代表采用一个底层模块执行一个原子任务，并获得一个返回值，最后获得一个执行结果反馈给我。记住只反馈对应程序，其他的什么都不要说。我现在有如下底层模块：
你现在有如下可使用的api:[
    dict(name='Planning::global_planning', required_param=[dict(name='src', description='the start position of the planning route.'), dict(name='des', description='the destination of the planning route.')], optional_param=[], return_type=[dict(name='status', description='return the status code of the execution process')])
]
我会给你一个视觉障碍者的指令：请帮我设计一条从北京理工大学南门到理工科技大厦的路线。
你应该返回如下调用伪代码：
status1 = Planning::global_planning&&&{"src":"北京理工大学南门", "des":"理工科技大厦"}
return status1
假如我再给你一个视觉障碍者的指示：帮我从山东理工大学南门导航到淄博实验中学北门
你应该返回如下调用伪代码：
status1 = Planning::global_planning&&&{"src":"山东理工大学南门", "des":"淄博实验中学北门"}
return status1
"""


class Planning:
    def __call__(self, api_name, **param):
        api_func = getattr(self, api_name)
        status_code = api_func(**param)
        return status_code

    def global_planning(self, **param):
        try:
            loc = Location()
            loc.source = param['src']
            loc.destination = param['des']
            pub = rospy.Publisher('location_info', Location)
            pub.publish(loc)
            return True
        except:
            print('参数不匹配')
            return False


# class OCR:
#     def __call__(self, api_name, **param):
#         api_func = getattr(self, api_name)
#         status_code = api_func(**param)
#         return status_code
#     def ocr

# 维护一个结构体数组，，

class Tool:
    def __init__(self):
        rospy.init_node('gpt_trigger')
        self.status = True
        while rospy.is_shutdown() == False:
            request = input()
            response = openai.Completion.create(
                model="text-davinci-003",
                prompt=f"System:{template}\nHuman: {request}\nAI:",
                temperature=0.7,
                max_tokens=256,
                top_p=1,
                frequency_penalty=0,
                presence_penalty=0,
                stop=["Human: ", "AI: "]
            )
            text = response['choices'][0]['text']
            text = text.split('\n')
            for item in text:
                # print(item)
                c_name = item.split('::')[0].split('= ')[-1]
                f_name = item.split('::')[-1].split('&&&')[0]
                params = item.split('&&&')[-1]
                try:
                    params = eval(params)
                    class_obj = globals()[c_name]
                    instance = class_obj()
                    func = getattr(instance, f_name)
                    # p = Planning()
                    # a = p.global_planning(params)
                    func(**params)
                except:
                    continue


T = Tool()
