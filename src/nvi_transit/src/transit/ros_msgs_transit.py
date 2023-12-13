import base64
import zlib
from io import BytesIO 
from std_msgs.msg import Header, Empty
from sensor_msgs.msg import Image, CompressedImage
# ROS MESSAGE BEGIN
from std_msgs.msg import Empty, String
from nav_msgs.msg import OccupancyGrid, Odometry
from tf2_msgs.msg import TFMessage
from nvi_msgs.msg import GPSTarget, HeaderString, ObjectArray, TargetPath
# ROS MESSAGE END

# MESSAGE ID BEGIN
_ROS_MESSAGE_IDS_GENERATED = {'speech_heartbeat':Empty, 'vio':Odometry, 'speech_command':String, 'tf':TFMessage, 'tf_static':TFMessage, 'global_target':GPSTarget, 'global_status':String, 'semantic_heartbeat':Empty, 'voice_system':String, 'target_path':TargetPath, 'pr_map':OccupancyGrid, 'cost_map':OccupancyGrid, 'objects':ObjectArray, 'ocr':HeaderString}
# MESSAGE ID END
_ROS_MESSAGE_IDS = {'Empty':Empty, 'Image':Image, 'CompressedImage':CompressedImage}
_ROS_MESSAGE_IDS.update(_ROS_MESSAGE_IDS_GENERATED)

def Header2Json(msg:Header) -> dict:
    return {'seq':msg.seq,'stamp':{'secs':msg.stamp.secs,'nsecs':msg.stamp.nsecs},'frame_id':msg.frame_id}

def Json2Header(msg_json:dict) -> Header:
    header = Header(seq=msg_json['seq'],frame_id=msg_json['frame_id'])
    header.stamp.secs, header.stamp.nsecs = msg_json['stamp']['secs'],msg_json['stamp']['nsecs']
    return header

def CompressedImage2Json(msg:CompressedImage) -> dict:
    return {'header':Header2Json(msg.header),'format':msg.format,'data':msg.data}

def Json2CompressedImage(msg_json:dict) -> CompressedImage:
    return CompressedImage(header=Json2Header(msg_json['header']))

def msg2json(msg,msg_type:str) -> dict:
    buffer = BytesIO()
    msg.serialize(buffer)
    msg_base64 = base64.b64encode(zlib.compress(buffer.getvalue())).decode('utf8')
    return {'type':msg_type,'data':msg_base64}

def json2msg(msg_json:dict):
    if msg_json['type'] not in _ROS_MESSAGE_IDS:
        raise ValueError('Unsupported Message Type.')
    msg = _ROS_MESSAGE_IDS[msg_json['type']]()
    msg.deserialize(zlib.decompress(base64.b64decode(msg_json['data'])))
    return msg
