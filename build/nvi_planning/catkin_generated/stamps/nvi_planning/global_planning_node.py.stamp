#!/usr/bin/env python3
import rospy
import tf
import numpy as np
import message_filters
from std_msgs.msg import String,Header
from nvi_msgs.msg import GPSTarget, Destination, Location
from nav_msgs.msg import Odometry,Path
from sensor_msgs.msg import NavSatFix,Imu
from geometry_msgs.msg import PoseStamped,Pose,Point
from global_planning.global_planner import GlobalPlanner
from global_planning.map_api import location2GPS
from global_planning.gps_transform import wgs842gcj02
from global_planning.magn_calibration import MagnGPSCalibration,MagnGPSVIOCalibration
from collections import deque
import copy
from global_planning.filter import KalmanFilterLLA
import time

    

class NVIGlobalPlanner(GlobalPlanner):
    def __init__(self, start_location='', end_location=''):
        start_point = location2GPS(start_location)
        end_point = location2GPS(end_location)
        # # back 
        # start_point = (39.983596122633195, 116.32503917559877)
        # end_point =  (39.98364116496342, 116.32680835196733)#(39.98365351337307, 116.32715032444247)
        # # go
        # start_point = (39.98365351337307, 116.32715032444247)
        # end_point = (39.983596122633195, 116.32503917559877)
        # end_point = (39.98361972849266, 116.32509490315582)

        # fellow w2e
        # start_point = (39.98146060861255, 116.32497115529087)
        # end_point = (39.98100109047767, 116.32698351488085)

        # east n2s 
        # start_point= (34.48579826, 108.44023018)
        # end_point = (34.48376959, 108.44036388)

        # est s2n
        # start_point = (34.48376959, 108.44036388)
        # end_point= (34.48579826, 108.44023018)

        super().__init__(start_point, end_point)
        self.parameter_init()
        rospy.init_node('nvi_global_planner', anonymous=True)
        # self.global_cmd_pub = rospy.Publisher("/global_planning/voice", String, queue_size=10)
        self.voice_cmd_pub = rospy.Publisher("/voice/system", String, queue_size=10)
        self.global_status_pub = rospy.Publisher("/global_planning/status", String, queue_size=10)
        self.global_target_pub = rospy.Publisher("/global_planning/target", GPSTarget, queue_size=300)
        if self.path_visulize:
            self.gloabl_path_pub = rospy.Publisher("/global_planning/path",Path,queue_size=10)
            self.gloabl_transformed_path_pub = rospy.Publisher("/global_planning/path/transformed",Path,queue_size=10)
        self.subscribe()
        rospy.spin()
    
    def parameter_init(self):
        self.DELTA_TIME = rospy.get_param("/global_planning/delta_time", default=5)
        self.TURN_DIS = rospy.get_param("/global_planning/turn_dis", default=20)
        self.RESET_DIS = rospy.get_param("/global_planning/reset_dis", default=25)
        self.POINT_BUFFER_SIZE = rospy.get_param("/global_planning/point_bufeer_size", default=100)
        self.path_visulize = rospy.get_param("/global_planning/path_visulize", default=False)
        self.MAX_PATH_LENGTH = 1000
        self.path_msg = Path()
        self.mag_gps_vio_calibrator = MagnGPSVIOCalibration(MIN_TRANSFORM_SIZE=32, MIN_DELTA_DISTANCE=1.5)
        self.lla_seq = -1
        self.target_azimuth = None
        self.kf_lla = KalmanFilterLLA()
        self.is_arrived_buffer_var = False
        self.DESTINATION_PROTECTED_DIS = 15
    
    def subscribe(self):
        self.lla_sub = rospy.Subscriber("/ublox_driver/receiver_lla", NavSatFix, self.lla_callback,queue_size=1)
        self.destination_sub = rospy.Subscriber("/global_planning/destination",Destination,self.destination_callback)
        self.reset_sub = rospy.Subscriber("/global_planning/reset",String,self.reset_callback,queue_size=10)

        self.vio_filter_sub = message_filters.Subscriber("/vins_estimator/odometry", Odometry)
        self.lla_filter_sub = message_filters.Subscriber("/ublox_driver/receiver_lla", NavSatFix)
        self.magnetometer_imu_filter_sub = message_filters.Subscriber("/head/imu", Imu)

        self.sync_gps_vio = message_filters.ApproximateTimeSynchronizer([self.lla_filter_sub,self.vio_filter_sub], 512,0.1)
        self.sync_gps_vio.registerCallback(self.sync_gps_vio_callback)
        
        self.sync_vio_imu = message_filters.ApproximateTimeSynchronizer([self.vio_filter_sub,self.magnetometer_imu_filter_sub], 256,0.01)
        self.sync_vio_imu.registerCallback(self.sync_vio_imu_callback)
        
    def unsubscribe(self):
        self.lla_sub.unregister()
        self.destination_sub.unregister()
        self.magnetometer_imu_sub.unregister()

    def lla_callback(self, msg):
        if abs(msg.header.seq - self.lla_seq) > 100:
            self.path_msg.poses.clear()
            self.mag_gps_vio_calibrator.reset()
            rospy.logwarn("lla message discontinue, reset the global planner.")
        self.lla_seq = msg.header.seq
        gcj_loc = wgs842gcj02(msg.latitude, msg.longitude)
        now_point = (gcj_loc['lat'],gcj_loc['lon'])
        # print(now_point)
        # now_point = self.kf_lla.update(now_point, msg.header.stamp.to_sec())
        if not self.is_set:
            self.set_planner(now_point,self.end_point)
            return
        self.update(now_point)
        cmd = self.get_audio_feedback()
        if cmd is not None:
            # print(cmd)
            self.voice_cmd_pub.publish(cmd)
        is_arrived, distance2end = self.is_arrived(now_point)
        # arrived proectection
        if is_arrived or (self.is_arrived_buffer_var and distance2end < self.DESTINATION_PROTECTED_DIS):
            self.global_status_pub.publish('arrived')
            self.is_arrived_buffer_var = True
        elif self.is_turn:
            self.global_status_pub.publish('turning')
        else:
            self.global_status_pub.publish('line following')
        if self.path_visulize:
            self.path_msg.header = Header(frame_id="world",stamp=msg.header.stamp)
            pose = Pose(position=(Point(self.path[-1][0],self.path[-1][1],0)))
            self.path_msg.poses.append(PoseStamped(header=Header(seq=len(self.path),frame_id="world",stamp=msg.header.stamp),pose=pose))
            if len(self.path_msg.poses) > self.MAX_PATH_LENGTH:
                self.path_msg.poses = self.path_msg.poses[-self.MAX_PATH_LENGTH:]
            self.gloabl_path_pub.publish(self.path_msg)
        if self.status >= 0:
            self.target_azimuth = self.get_target_azimuth(now_point)
            RT = self.mag_gps_vio_calibrator.get_rigid_transfrom_matrix()
            if RT is  None:
                return
            rospy.loginfo_once('Global-Local calibration is done.')
            status, sub_status = self.status, self.sub_status
            azimuth = self.target_azimuth
            azimuth = - np.deg2rad(azimuth)
            point = np.array([np.cos(azimuth),np.sin(azimuth)])
            transformed_point = np.matmul(RT[0],point) #+ RT[1] # under vio coordinate
            # distance = self.roads[status]['polylength'][sub_status]
            distance = 0
            target_msg = self.get_gps_target_msg(transformed_point,distance,status=1,header=msg.header)
            self.global_target_pub.publish(target_msg)
            if self.path_visulize:
                transformed_path_msg =  self.get_transfromed_path_msg(RT[0],RT[1])
                self.gloabl_transformed_path_pub.publish(transformed_path_msg)

    def destination_callback(self, msg):
        try:
            if msg.name != '': 
                end_point = location2GPS(msg.data)
            else:
                end_point = (msg.latitude, msg.longitude)
                start_point = (msg.start_latitude, msg.start_longitude)
            if start_point[0] == -1:
                start_point = self.start_point
            self.set_planner(start_point, end_point)
            rospy.loginfo('Set planner from '+str(start_point)+' to '+str(end_point)+'.')
        except:
            rospy.loginfo("Invalid destination location.")
    
    def reset_callback(self, msg):
        if msg.data == 'audio_feedback':
            self.reset_audio_feedback()

    def sync_gps_vio_callback(self,gps_msg,vio_msg):
        gcj_loc = wgs842gcj02(gps_msg.latitude, gps_msg.longitude)
        now_point = (gcj_loc['lat'],gcj_loc['lon'])
        vio_point = (vio_msg.pose.pose.position.x,vio_msg.pose.pose.position.y)
        if not self.mag_gps_vio_calibrator.append_gps_vio_point(now_point,vio_point):
            return
        self.mag_gps_vio_calibrator.estimate_rigid_transform()

    def sync_vio_imu_callback(self,vio_msg,imu_msg):
        if self.mag_gps_vio_calibrator.get_rigid_transfrom_matrix() is not None:
            return
        (r, p, y) = tf.transformations.euler_from_quaternion([imu_msg.orientation.x, imu_msg.orientation.y, imu_msg.orientation.z, imu_msg.orientation.w])
        (r, p, y) =  [np.rad2deg(e) for e in (r,p,y)]
        # Coordinate System Trans normal
        #     0            0
        #  90   -90 TO -90   90
        #   +-180        +-180
        global_orientation_direction = -y
        self.update_direction(global_orientation_direction)
        vio_orientation = self.quaternion2cartesian(vio_msg.pose.pose.orientation)
        status = self.status
        sub_status = self.sub_status
        if status >= 0 and self.target_azimuth is not None:
            azimuth = self.target_azimuth
            # clock direction, 0 is the tarhet direction
            # azimuth = self.roads[status]['polyazimuth'][sub_status]
            dazimuth = self.get_dazimuth(azimuth, global_orientation_direction)
            taret_direction = self.point2d_rotation(vio_orientation,np.deg2rad(-dazimuth))
            distance = self.roads[status]['polylength'][sub_status]
            target_msg = self.get_gps_target_msg(taret_direction,distance,status=0,header=vio_msg.header)
            self.global_target_pub.publish(target_msg)
        
    @staticmethod
    def quaternion2cartesian(quaternion):
        '''
        return the yaw in cartesian system. (x, y)
        '''
        # x right, y forward, z up.
        (p, r, y) = tf.transformations.euler_from_quaternion([quaternion.x, quaternion.y, quaternion.z, quaternion.w])
        direction  = (-np.sin(y),np.cos(y))
        return direction
    
    @staticmethod
    def quaternion2euler(quaternion):
        '''
        return the eule angles of orientation quaternion.
        '''
        return tf.transformations.euler_from_quaternion([quaternion.x, quaternion.y, quaternion.z, quaternion.w])
    
    @staticmethod
    def vector2angle(vector1,vector2):
        '''
        return the angle of v2 relative to v2. clock angle (-90 0 90) in degree . 
        '''
        vector1,vector2  = np.array(vector1),np.array(vector2)
        vector1 /= np.linalg.norm(vector1)
        vector2 /= np.linalg.norm(vector2)
        theta = np.arctan2(np.cross(vector1,vector2,),np.dot(vector1,vector2))
        return np.degrees(theta)

    @staticmethod
    def point2d_rotation(point,theta):
        '''
        point: (x, y); theta: rad
        '''
        x, y = point
        x_ = x * np.cos(theta) + y * np.sin(theta)
        y_ = - x*np.sin(theta) + y * np.cos(theta)
        return (x_,y_) 

    def get_transfromed_path_msg(self,R,T):
        assert len(T)==2, "The transformed points are 2 dimensions."
        transfromed_path_msg = copy.deepcopy(self.path_msg)
        for pose_stamped  in transfromed_path_msg.poses:
            point = np.array([pose_stamped.pose.position.x,pose_stamped.pose.position.y])
            transformed_point = np.matmul(R,point)+T
            pose_stamped.pose.position.x,pose_stamped.pose.position.y = transformed_point[0],transformed_point[1]
        return transfromed_path_msg
    
    def get_gps_target_msg(self,direction, distance, status=0,header=Header()):
        '''
        status: 0-magnetometer-vio-direction, 1-gps-vio-direction
        '''
        target_msg = GPSTarget()
        target_msg.direction.x, target_msg.direction.y =  direction
        target_msg.header.stamp = header.stamp
        target_msg.distance = distance
        target_msg.status = status
        return target_msg
            

def automatic_guide(msg):
    src = msg.source
    des = msg.destination
    planner = NVIGlobalPlanner(src, des)
    return planner
    

if __name__ == '__main__':
    # nvi_global_planner = NVIGlobalPlanner(
   #      start_location="搜狐新媒体大厦", end_location="北京市海淀区中关村小学北门")
    # nvi_global_planner = NVIGlobalPlanner(
    # start_location="北京理工大学", end_location="北京市海淀区中关村小学北门")
    rospy.init_node('gp')
    auto = rospy.Subscriber('location_info', Location, automatic_guide)


        
        


