#!/usr/bin/env python
import rospy
from std_msgs.msg import String,Empty
# from src.asrt_sdk_ros import asrt_speech
from collections import deque
import pypinyin
import json
import os
import dashscope
from dashscope.audio.asr import (Recognition, RecognitionCallback, RecognitionResult)
import pyaudio
dashscope.api_key = 'sk-b02cc0da8146405cb030864f21e568e4'

# class SpeechDeque():
#     def __init__(self,maxlen=2) -> None:
#         self.buffer = deque(maxlen=maxlen)
    
#     def append(self,str):
#         self.buffer.append(str)
    
#     def is_detected(self,str):
#         res = ''.join(self.buffer)
#         return str in res

#     def buffer2str(self):
#         return ''.join(self.buffer)

#     def clear_buffer(self):
#         self.buffer.clear()


# class CmdTable():
#     def __init__(self) -> None:
#         self.cmd_zh_check_table = dict()
#         self.cmd_pinyin_check_table = dict()
#         self.cmd_zh_list = []
#         self.cmd_pinyin_list = []

#     @staticmethod
#     def zh2pinyin(str):
#         res = pypinyin.pinyin(str,style=pypinyin.NORMAL)
#         res = [e[0] for e in res]
#         return ''.join(res)

#     def parse_json(self,filepath):
#         with open(filepath, encoding='utf-8') as file:
#             json_file = json.load(file)
#             for cmds in json_file:
#                 self.cmd_zh_list.append(cmds['cmd_zh'])
#                 cmd_pinyin = self.zh2pinyin(cmds['cmd_zh'])
#                 self.cmd_pinyin_list.append(cmd_pinyin)
#                 self.cmd_pinyin_check_table[cmd_pinyin]=cmds['cmd']
#                 self.cmd_zh_check_table[cmds['cmd_zh']]=cmds['cmd']

    
#     def check_pinyin_cmd(self,str):
#         for cmd in self.cmd_pinyin_list:
#             if cmd in str:
#                 return self.cmd_pinyin_check_table[cmd]
#         return None
    
#     def check_zh_cmd(self,str):
#         for cmd in self.cmd_zh_list:
#             if cmd in str:
#                 return self.cmd_zh_check_table[cmd]
#         return None

# class NVISpeech():
#     def __init__(self) -> None:
#         rospy.init_node('nvi_speech', anonymous=True)
#         self.pub_cmd = rospy.Publisher(
#             "/speech/command", String, queue_size=10)
#         self.voice_pub = rospy.Publisher(
#             "/voice/system", String, queue_size=10)
#         self.heartbeat_pub = rospy.Publisher("/speech/heartbeat", Empty, queue_size=10)    
#         self.asrt_speech  =ASRTSpeech(duration=4)
#         self.asrt_speech.open_audio()
#         self.buffer = SpeechDeque(maxlen=2)
#         self.cmd_table =CmdTable()
#         self.cmd_table.parse_json(os.path.dirname(os.path.dirname(os.path.abspath(__file__)))+"/config/speech_cmd_config.json")


#     def spin(self):
#         ress = []
#         while not rospy.is_shutdown():
#             self.heartbeat_pub.publish(Empty())
#             wave_data = self.asrt_speech.read_wave()
#             res,res_pinyin  = self.asrt_speech.recognize_speech(wave_data)
#             res_pinyin = [e[:-1] for e in res_pinyin]
#             res_pinyin = ''.join(res_pinyin)
#             self.buffer.append(res_pinyin)
#             cmd = self.cmd_table.check_pinyin_cmd(self.buffer.buffer2str())
#             # print('I heard:',self.buffer.buffer2str())
#             if cmd is not None:
#                  self.pub_cmd.publish(cmd)
#                  self.buffer.clear_buffer()
#                  self.voice_pub.publish("正在"+res)
#                  print('send cmd',cmd)
            

#         self.asrt_speech.close_audio()


class Callback(RecognitionCallback):
    def __init__(self) -> None:
        super().__init__()
        self.mic = None
        self.stream = None
        self.counter = 0
        self.msg_list = []

    def on_open(self) -> None:
        self.mic = pyaudio.PyAudio()
        self.stream = self.mic.open(
            format = pyaudio.paInt16,
            channels=1,
            rate=16000,
            input=True
        )
        print('RecognitionCallback open.')
    
    def on_close(self) -> None:
        print('RecognitionCallback close.')
        self.stream.stop_stream()

    def on_event(self, result: RecognitionResult) -> None:
        if result.get_sentence()['end_time'] is not None:
            text = result.get_sentence()['text']
            self.msg_list.append(text)
            self.counter += 1


class ChatNode:
    def __init__(self) -> None:
        rospy.init_node('nvi_speech', anonymous=True)
        self.pub_cmd = rospy.Publisher(
            "/speech/command", String, queue_size=10)
        self.voice_pub = rospy.Publisher(
            "/voice/system", String, queue_size=10)
        self.heartbeat_pub = rospy.Publisher("/speech/heartbeat", Empty, queue_size=10) 
        self.callback = Callback()
        self.recognition = Recognition(model='paraformer-realtime-v1',
                            format='pcm',
                            sample_rate=16000,
                            callback=self.callback)
        
    def spin(self) -> None:
        self.recognition.start()
        counter = self.callback.counter
        while not rospy.is_shutdown():
            self.heartbeat_pub.publish(Empty())
            if self.callback.stream:
                data = self.callback.stream.read(3200, exception_on_overflow=False)
                self.recognition.send_audio_frame(data)
                if counter != self.callback.counter:
                    counter = self.callback.counter
                    text = self.callback.msg_list[counter-1]
                    print(text)
                    self.pub_cmd.publish(text)
                    self.voice_pub.publish(text)
            else:
                break

        self.recognition.stop()
    

if __name__ == '__main__':
    chatnode = ChatNode()
    chatnode.spin()
