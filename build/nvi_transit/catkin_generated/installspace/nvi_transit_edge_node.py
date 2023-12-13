import rospy
import time 
import message_filters
from transit.json_socket import JsonSocket
from transit.ros_msgs_transit import json2msg, msg2json
from sensor_msgs.msg import Image, CompressedImage
# ROS MESSAGE BEGIN
from std_msgs.msg import Empty, String
from nav_msgs.msg import OccupancyGrid, Odometry
from tf2_msgs.msg import TFMessage
from nvi_msgs.msg import GPSTarget, HeaderString, ObjectArray, TargetPath
# ROS MESSAGE END


class NVITransitEdge:
    def __init__(self):
        rospy.init_node('nvi_transit_edge', anonymous=True)
        self.parameter_init()
        self.publish_init()
        self.subscribe()
        self.spin()
    
    def spin(self):
        self.connect()
        while not rospy.is_shutdown():
            if not self.is_connect:
                continue
            time_now = time.perf_counter()
            if time_now - self.heartbeat_last_send > self.heartbeat_send_interval:
                self.client.send_json(msg2json(Empty(),'Empty'))
                self.heartbeat_last_send = time_now
            msg_json  = self.client.recv_json()
            if not msg_json:
                self.is_connect = False
                self.connect()
            else:
                msg = json2msg(msg_json)
                self._PUBLISH_IDS[msg_json['type']].publish(msg)
            
    def parameter_init(self):
        self.server_ip = rospy.get_param('/nvi_transit_edge/server_ip','127.0.0.1')
        self.server_port = rospy.get_param('/nvi_transit_edge/server_port',8080)
        self.image_send_rate = rospy.get_param('/nvi_transit_edge/rgbd_rate',2)
        self.heartbeat_send_rate = rospy.get_param('/nvi_transit_edge/heartbeat_rate',1)
        self.image_send_interval = 1.0/self.image_send_rate
        self.heartbeat_send_interval = 1.0/self.heartbeat_send_rate
        self.image_last_send = time.perf_counter()
        self.heartbeat_last_send = time.perf_counter()
        self.is_connect = False

    def publish_init(self):
        self.server_heartbeat_pub = rospy.Publisher("/transit_server/heartbeat", Empty, queue_size=10)
        # PUBLISHER HANDLE BEGIN
        self.semantic_heartbeat_pub = rospy.Publisher('/semantic_map/heartbeat', Empty, queue_size=10)
        self.voice_system_pub = rospy.Publisher('/voice/system', String, queue_size=10)
        self.target_path_pub = rospy.Publisher('/local_planning/target_path', TargetPath, queue_size=10)
        self.pr_map_pub = rospy.Publisher('/prmap_full', OccupancyGrid, queue_size=10)
        self.cost_map_pub = rospy.Publisher('/local_planning/cost_map', OccupancyGrid, queue_size=10)
        self.objects_pub = rospy.Publisher('/local_planning/objects', ObjectArray, queue_size=100)
        self.ocr_pub = rospy.Publisher('/ocr', HeaderString, queue_size=100)
        self._PUBLISH_IDS_GENERATED = {'semantic_heartbeat':self.semantic_heartbeat_pub, 'voice_system':self.voice_system_pub, 'target_path':self.target_path_pub, 'pr_map':self.pr_map_pub, 'cost_map':self.cost_map_pub, 'objects':self.objects_pub, 'ocr':self.ocr_pub}
        # PUBLISHER HANDLE END
        self._PUBLISH_IDS = {'Empty':self.server_heartbeat_pub}
        self._PUBLISH_IDS.update(self._PUBLISH_IDS_GENERATED)

    def subscribe(self):
        self.rgb_sub_filter = message_filters.Subscriber("/image/rgb",CompressedImage)
        self.dpeth_sub_filter = message_filters.Subscriber("/image/depth",Image)
        self.sync_rgb_depth = message_filters.ApproximateTimeSynchronizer([self.rgb_sub_filter,self.dpeth_sub_filter], 16,0.05)
        self.sync_rgb_depth.registerCallback(self.sync_rgb_depth_callback)
        # SUBSCRIBER HANDLE BEGIN
        self.speech_heartbeat_sub = rospy.Subscriber('/speech/heatbeat', Empty, self.any_callback('speech_heartbeat'), queue_size=10)
        self.vio_sub = rospy.Subscriber('/vins_estimator/odometry', Odometry, self.any_callback('vio'), queue_size=100)
        self.speech_command_sub = rospy.Subscriber('/speech/command', String, self.any_callback('speech_command'), queue_size=100)
        self.tf_sub = rospy.Subscriber('/tf', TFMessage, self.any_callback('tf'), queue_size=100)
        self.tf_static_sub = rospy.Subscriber('/tf_static', TFMessage, self.any_callback('tf_static'), queue_size=100)
        self.global_target_sub = rospy.Subscriber('/global_planning/target', GPSTarget, self.any_callback('global_target'), queue_size=100)
        self.global_status_sub = rospy.Subscriber('/global_planning/status', String, self.any_callback('global_status'), queue_size=100)
        # SUBSCRIBER HANDLE END

    def unsubscribe(self):
        self.rgb_sub_filter.unregister()
        self.dpeth_sub_filter.unregister()
        # SUBSCRIBER CANCELLATION HANDLE BEGIN
        self.speech_heartbeat_sub.unregister()
        self.vio_sub.unregister()
        self.speech_command_sub.unregister()
        self.tf_sub.unregister()
        self.tf_static_sub.unregister()
        self.global_target_sub.unregister()
        self.global_status_sub.unregister()
        # SUBSCRIBER CANCELLATION HANDLE END

    def sync_rgb_depth_callback(self,rgb_msg,depth_msg):
        time_now = time.perf_counter()
        if time_now- self.image_last_send < self.image_send_interval:
            return
        self.image_last_send = time_now
        rgb_msg_json = msg2json(rgb_msg,'CompressedImage')
        depth_msg_json = msg2json(depth_msg,'Image')
        if self.is_connect:
            self.client.send_json(rgb_msg_json)
            self.client.send_json(depth_msg_json)
    
    def any_callback(self,msg_id:str):
        def callback(msg):
            msg_json = msg2json(msg,msg_id)
            if self.is_connect:
                self.client.send_json(msg_json) 
        return callback

    def connect(self):
        self.client = JsonSocket()
        rospy.loginfo('Trying to connect to '+self.server_ip+':'+str(self.server_port))
        connect_rate = rospy.Rate(0.5) 
        while not self.is_connect and not rospy.is_shutdown():
            try:
                self.client.connect((self.server_ip, self.server_port))
            except:
                rospy.loginfo('Failed to connect to '+self.server_ip+':'+str(self.server_port))
            else:
                self.is_connect = True
                rospy.loginfo('Connect to '+self.server_ip+':'+str(self.server_port))
            connect_rate.sleep()

    def rset_server(self,server_ip,server_port):
        self.server_ip = server_ip
        self.server_port = server_port
        self.connect()
        

if __name__ == "__main__":
    nvi_transit_edge = NVITransitEdge()
