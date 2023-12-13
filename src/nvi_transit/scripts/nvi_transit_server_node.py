import time
import rospy
from transit.json_socket import JsonSocket
from transit.ros_msgs_transit import json2msg, msg2json
from sensor_msgs.msg import Image, CompressedImage
# ROS MESSAGE BEGIN
from std_msgs.msg import Empty, String
from nav_msgs.msg import OccupancyGrid, Odometry
from tf2_msgs.msg import TFMessage
from nvi_msgs.msg import GPSTarget, HeaderString, ObjectArray, TargetPath
# ROS MESSAGE END

class NVITransitServer:
    def __init__(self):
        rospy.init_node('nvi_transit_server', anonymous=True)
        self.parameter_init()
        self.publish_init()
        self.subscribe()
        self.server = JsonSocket()
        self.server.bind((self.server_ip,self.server_port))
        self.server.listen(1)
        self.spin()
    
    def spin(self):
        self.accept()
        while not rospy.is_shutdown():
            if not self.is_connect:
                continue
            time_now = time.perf_counter()
            if time_now - self.heartbeat_last_send > self.heartbeat_send_interval:
                self.connection.send_json(msg2json(Empty(),'Empty'))
                self.heartbeat_last_send = time_now
            msg_json  = self.connection.recv_json()
            if not msg_json:
                self.is_connect = False
                self.accept()
            else:
                msg = json2msg(msg_json)
                self._PUBLISH_IDS[msg_json['type']].publish(msg)
            
    def parameter_init(self):
        self.server_ip = rospy.get_param('/nvi_transit_server/server_ip','')
        self.server_port = rospy.get_param('/nvi_transit_server/server_port',8080)
        self.heartbeat_send_rate = rospy.get_param('/nvi_transit_server/heartbeat_rate',1)
        self.heartbeat_send_interval = 1.0/self.heartbeat_send_rate
        self.heartbeat_last_send = time.perf_counter()
        self.is_connect = False

    def publish_init(self):
        self.rgb_pub = rospy.Publisher("/image/rgb", CompressedImage, queue_size=10)
        self.depth_pub = rospy.Publisher("/image/depth", Image, queue_size=10)
        self.edge_heartbeat_pub = rospy.Publisher("/transit_edge/heartbeat", Empty, queue_size=10)
        # PUBLISHER HANDLE BEGIN
        self.speech_heartbeat_pub = rospy.Publisher('/speech/heatbeat', Empty, queue_size=10)
        self.vio_pub = rospy.Publisher('/vins_estimator/odometry', Odometry, queue_size=100)
        self.speech_command_pub = rospy.Publisher('/speech/command', String, queue_size=100)
        self.tf_pub = rospy.Publisher('/tf', TFMessage, queue_size=100)
        self.tf_static_pub = rospy.Publisher('/tf_static', TFMessage, queue_size=100)
        self.global_target_pub = rospy.Publisher('/global_planning/target', GPSTarget, queue_size=100)
        self.global_status_pub = rospy.Publisher('/global_planning/status', String, queue_size=100)
        self._PUBLISH_IDS_GENERATED = {'speech_heartbeat':self.speech_heartbeat_pub, 'vio':self.vio_pub, 'speech_command':self.speech_command_pub, 'tf':self.tf_pub, 'tf_static':self.tf_static_pub, 'global_target':self.global_target_pub, 'global_status':self.global_status_pub}
        # PUBLISHER HANDLE END
        self._PUBLISH_IDS = {'Empty':self.edge_heartbeat_pub,'Image': self.depth_pub, 'CompressedImage':self.rgb_pub}
        self._PUBLISH_IDS.update(self._PUBLISH_IDS_GENERATED)


    def subscribe(self):
        # SUBSCRIBER HANDLE BEGIN
        self.semantic_heartbeat_sub = rospy.Subscriber('/semantic_map/heartbeat', Empty, self.any_callback('semantic_heartbeat'), queue_size=10)
        self.voice_system_sub = rospy.Subscriber('/voice/system', String, self.any_callback('voice_system'), queue_size=10)
        self.target_path_sub = rospy.Subscriber('/local_planning/target_path', TargetPath, self.any_callback('target_path'), queue_size=10)
        self.pr_map_sub = rospy.Subscriber('/prmap_full', OccupancyGrid, self.any_callback('pr_map'), queue_size=10)
        self.cost_map_sub = rospy.Subscriber('/local_planning/cost_map', OccupancyGrid, self.any_callback('cost_map'), queue_size=10)
        self.objects_sub = rospy.Subscriber('/local_planning/objects', ObjectArray, self.any_callback('objects'), queue_size=100)
        self.ocr_sub = rospy.Subscriber('/ocr', HeaderString, self.any_callback('ocr'), queue_size=100)
        # SUBSCRIBER HANDLE END

    def unsubscribe(self):
        # SUBSCRIBER CANCELLATION HANDLE BEGIN
        self.semantic_heartbeat_sub.unregister()
        self.voice_system_sub.unregister()
        self.target_path_sub.unregister()
        self.pr_map_sub.unregister()
        self.cost_map_sub.unregister()
        self.objects_sub.unregister()
        self.ocr_sub.unregister()
        # SUBSCRIBER CANCELLATION HANDLE END

    def any_callback(self,msg_id:str):
        def callback(msg):
            msg_json = msg2json(msg,msg_id)
            if self.is_connect:
                self.connection.send_json(msg_json) 
        return callback

    def accept(self):
        rospy.loginfo('Waiting for connection')
        self.connection, self.client_address = self.server.accept()
        rospy.loginfo('Connect to '+str(self.client_address[0])+':'+str(self.client_address[1]))
        self.is_connect = True

    def rset_server(self,server_ip,server_port):
        self.server_ip = server_ip
        self.server_port = server_port
        self.connect()
        

if __name__ == "__main__":
    nvi_transit_edge = NVITransitServer()