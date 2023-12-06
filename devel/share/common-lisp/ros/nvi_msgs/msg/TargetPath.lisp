; Auto-generated. Do not edit!


(cl:in-package nvi_msgs-msg)


;//! \htmlinclude TargetPath.msg.html

(cl:defclass <TargetPath> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (data
    :reader data
    :initarg :data
    :type (cl:vector nvi_msgs-msg:TargetWaypoint)
   :initform (cl:make-array 0 :element-type 'nvi_msgs-msg:TargetWaypoint :initial-element (cl:make-instance 'nvi_msgs-msg:TargetWaypoint))))
)

(cl:defclass TargetPath (<TargetPath>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <TargetPath>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'TargetPath)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name nvi_msgs-msg:<TargetPath> is deprecated: use nvi_msgs-msg:TargetPath instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <TargetPath>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader nvi_msgs-msg:header-val is deprecated.  Use nvi_msgs-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'data-val :lambda-list '(m))
(cl:defmethod data-val ((m <TargetPath>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader nvi_msgs-msg:data-val is deprecated.  Use nvi_msgs-msg:data instead.")
  (data m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <TargetPath>) ostream)
  "Serializes a message object of type '<TargetPath>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'data))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'data))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <TargetPath>) istream)
  "Deserializes a message object of type '<TargetPath>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'data) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'data)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'nvi_msgs-msg:TargetWaypoint))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<TargetPath>)))
  "Returns string type for a message object of type '<TargetPath>"
  "nvi_msgs/TargetPath")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'TargetPath)))
  "Returns string type for a message object of type 'TargetPath"
  "nvi_msgs/TargetPath")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<TargetPath>)))
  "Returns md5sum for a message object of type '<TargetPath>"
  "044f4777a7989371ef1302e9d98a28a7")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'TargetPath)))
  "Returns md5sum for a message object of type 'TargetPath"
  "044f4777a7989371ef1302e9d98a28a7")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<TargetPath>)))
  "Returns full string definition for message of type '<TargetPath>"
  (cl:format cl:nil "Header header~%TargetWaypoint[] data~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: nvi_msgs/TargetWaypoint~%float32 x~%float32 y~%float32 z ~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'TargetPath)))
  "Returns full string definition for message of type 'TargetPath"
  (cl:format cl:nil "Header header~%TargetWaypoint[] data~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: nvi_msgs/TargetWaypoint~%float32 x~%float32 y~%float32 z ~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <TargetPath>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'data) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <TargetPath>))
  "Converts a ROS message object to a list"
  (cl:list 'TargetPath
    (cl:cons ':header (header msg))
    (cl:cons ':data (data msg))
))
