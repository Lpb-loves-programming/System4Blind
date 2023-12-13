#!/usr/bin/env python3
import rospy
import actionlib
from nvi_msgs.msg import TaskControlAction,TaskControlGoal
import time

class ModuleClient:
    def __init__(self,module_name):
        '''
        status: 0 stop, 1 ready, 2 running, 3 timeout, 4 error
        '''
        self.module_name = module_name
        self.module_status =  0
        self.client = actionlib.SimpleActionClient(
            self.module_name +"_module", TaskControlAction)
        rospy.loginfo('The  %s module is waiting for service ...' %self.module_name)
        self.client.wait_for_server()
        rospy.loginfo('The  %s module received service.' %self.module_name)
        self.module_timestamp = rospy.Time.now()
        
    def send_goal(self):
        goal = TaskControlGoal(task_name=self.module_name)
        self.client.send_goal(goal, self.doneCallback,
                              self.activeCallback, self.feedbackCallback)
        self.module_status = 2
    
    def cancel_goal(self):
        self.client.cancel_goal()
        self.module_status = 0

    def reboot(self):
        self.client.wait_for_server()
        rospy.loginfo('The  %s module received service.' % self.module_name)
        self.module_timestamp = rospy.Time.now()

    def check_timestamp(self):
        '''
        return False if timeout.
        '''
        if rospy.Time.now() - self.module_timestamp > rospy.Duration(10):
            rospy.loginfo('The service for %s module timout.' %
                          self.module_name)
            if self.module_status !=0:
                self.module_status = 3
            return False
        return True
        
    def doneCallback(self, state, result):
        if result is None:
            rospy.loginfo('The  %s module is shutdown.' %
                          self.module_name)
            self.module_status = 0
            return
        if result.is_finished:
            rospy.loginfo('The task for  %s module is finished.'%self.module_name)
            self.module_status = 0
        else:
            rospy.loginfo('The task for  %s module end without finished.' %
                          self.module_name)
            self.module_status = 4

    def activeCallback(self):
        self.module_status = 1
        rospy.loginfo('The service for %s module activated.'%self.module_name)

    def feedbackCallback(self, feedback):
        if feedback.running_status == 0:
            self.module_timestamp = rospy.Time.now()
            self.module_status = 2
            rospy.loginfo('renew time to %f .' %
                          self.module_timestamp.to_sec())
        else:
            rospy.loginfo('Warning: %s module error code %d .' %
                          (self.module_name,feedback.running_status))

class NVIManagement:
    def __init__(self):
        rospy.init_node('nvi_management', anonymous=True)
        self.camera_cilent = ModuleClient("ActionTest")
        self.camera_cilent.send_goal()
        rate = rospy.Rate(1)
        while not rospy.is_shutdown():
            self.camera_cilent.check_timestamp()
            if self.camera_cilent.module_status !=2:
                rospy.loginfo("module code %d."%self.camera_cilent.module_status)
            if self.camera_cilent.module_status in [0,3]:
                self.camera_cilent.reboot()
                self.camera_cilent.send_goal()
            rate.sleep()



        # self.client = actionlib.SimpleActionClient("ActionTest", TaskControlAction)
        # self.action_time_stamp = rospy.Time.now()
        # rospy.loginfo('waiting for server ...')
        # self.client.wait_for_server()
        # goal = TaskControlGoal(task_name='test_action1')
        # self.client.send_goal(goal, self.doneCallback,self.activeCallback,self.feedbackCallback)
        # time.sleep(10)
        # self.client.cancel_goal()
        # print("canceled")
        

        rospy.spin()
    
    # def doneCallback(self,state,result):
    #     print('state:',state)
    #     print('result:', result)

    #     if result.is_finished:
    #         rospy.loginfo('task finished.')
    #     else:
    #         rospy.loginfo('task end without finished.')


    # def activeCallback(self):
    #     rospy.loginfo('service activated.')

    # def feedbackCallback(self,feedback):
    #     if feedback.running_status == 0:
    #         self.action_time_stamp = rospy.Time.now()
    #         rospy.loginfo('renew time to %f .'%self.action_time_stamp.to_sec())
    #     else:
    #         rospy.loginfo('warning: task error code %d .' %
    #                       feedback.running_status)
    



if __name__ == '__main__':
    nvi_management = NVIManagement()
