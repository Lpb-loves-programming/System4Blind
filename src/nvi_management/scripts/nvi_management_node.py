#!/usr/bin/env python3
import rospy
from std_msgs.msg import String
import time
import json
import sys
import os
import psutil
CURRENT_DIR = os.path.dirname(os.path.abspath(__file__))
PAR_DIR = os.path.dirname(CURRENT_DIR)
sys.path.append(CURRENT_DIR)

class Msg():
    def __init__(self,msg_:str,package_:str,type_:str,name_zh_:str):
        self.msg = msg_
        self.package = package_
        self.type = type_
        self.name_zh = name_zh_
    
class KeyMsgTable():
    def __init__(self) -> None:
        self.key_msg_list = []
        self.sensor_msg_list = []
        self.function_msg_list = []


    def parse_json(self,filepath):
        with open(filepath, encoding='utf-8') as file:
            json_file = json.load(file)
            sensor_msgs =  json_file["sensor"]
            function_msgs =  json_file["function"]
            for msgs in sensor_msgs:
                msg = Msg(msgs["msg"],msgs["msg_package"],msgs["msg_type"],msgs["msg_name_zh"])
                self.sensor_msg_list.append(msg)
            for msgs in function_msgs:
                msg = Msg(msgs["msg"],msgs["msg_package"],msgs["msg_type"],msgs["msg_name_zh"])
                self.function_msg_list.append(msg)
            self.key_msg_list = self.sensor_msg_list+self.function_msg_list


class NVIManagement:
    def __init__(self):
        rospy.init_node('nvi_management', anonymous=True)
        
        self.system_pub = rospy.Publisher("/management/command",String,queue_size=10)
        self.voice_pub = rospy.Publisher("/voice/system", String, queue_size=10)  

        self.speech_command_sub =  rospy.Subscriber("speech/command",String,self.command_callback,queue_size=10)

        key_msg_path = rospy.get_param("/nvi_management/key_msg_path", default=PAR_DIR+"/config/key_msg.json")
        self.key_msg_table = KeyMsgTable()
        self.key_msg_table.parse_json(key_msg_path)
        self.status_check(self.key_msg_table.key_msg_list,pub=self.voice_pub)

        
        rate = rospy.Rate(10)
        while not rospy.is_shutdown():
            self.status_check(self.key_msg_table.key_msg_list,except_pub=self.voice_pub)
            rate.sleep()
    
    def status_check(self,msg_lsit ,pub=None,except_pub=None, CHECK_RATE=1, MAX_CHECK_NUM=5):
        if pub is not None:
            rospy.loginfo("Start checking system status.")
        SYSTEM_OK = True 
        for msg in msg_lsit:
            self.STATUS_OK = False
            exec("from "+msg.package+" import "+msg.type)
            exec("sub = rospy.Subscriber(msg.msg, "+msg.type+", self.status_callback,queue_size=1)")            
            status_check_rate = rospy.Rate(CHECK_RATE)
            status_check_num = MAX_CHECK_NUM
            while not self.STATUS_OK and not rospy.is_shutdown() and status_check_num>0:
                status_check_num -= 1 
                status_check_rate.sleep()
            exec("sub.unregister()")
            if status_check_num <=0:
                system_loginfo = msg.name_zh + "工作异常"
                SYSTEM_OK = False
                if except_pub is not None:
                    except_pub.publish(system_loginfo)
                    rospy.loginfo(system_loginfo)
            else:
                system_loginfo = msg.name_zh + "工作正常"
            if pub is not None:
                rospy.loginfo(system_loginfo)
                pub.publish(system_loginfo)
        if except_pub is not None:
            self.battery_check(except_pub,20)
        if pub is not None:
            rospy.loginfo("Finish checking system status.")
        control_command = {} 
        control_command["to"] = "nvi_interaction"
        control_command["system_ok"] = SYSTEM_OK
        control_command = json.dumps(control_command)
        self.system_pub.publish(control_command)
    
    @staticmethod
    def battery_check(pub,threshold=20):
        battery = psutil.sensors_battery()
        if battery is None:
            return
        if not battery.power_plugged and battery.percent < threshold:
            rospy.logwarn("Battery low.")
            pub.publish("系统电池电量低请充电")

    def status_callback(self,msg):
        self.STATUS_OK = True
    
    def command_callback(self,msg):
        command = msg.data
        control_command = {} 
        # for 0207 debug
        if command == "start_system" or command == "start_local_planning":
            control_command["to"]="local_planning"
            control_command["work"]= True
            control_command = json.dumps(control_command)
        elif command == "close_system" or command == "close_local_planning":
            control_command["to"]="local_planning"
            control_command["work"]= False
            control_command = json.dumps(control_command)
        else:
            rospy.logwarn("Invalid speech command.")
        if control_command:
            self.system_pub.publish(control_command)

if __name__ == '__main__':
    nvi_management = NVIManagement()
