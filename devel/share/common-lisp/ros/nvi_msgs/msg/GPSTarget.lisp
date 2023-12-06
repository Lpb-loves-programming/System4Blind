; Auto-generated. Do not edit!


(cl:in-package nvi_msgs-msg)


;//! \htmlinclude GPSTarget.msg.html

(cl:defclass <GPSTarget> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (status
    :reader status
    :initarg :status
    :type cl:fixnum
    :initform 0)
   (direction
    :reader direction
    :initarg :direction
    :type geometry_msgs-msg:Point
    :initform (cl:make-instance 'geometry_msgs-msg:Point))
   (distance
    :reader distance
    :initarg :distance
    :type cl:float
    :initform 0.0))
)

(cl:defclass GPSTarget (<GPSTarget>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <GPSTarget>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'GPSTarget)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name nvi_msgs-msg:<GPSTarget> is deprecated: use nvi_msgs-msg:GPSTarget instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <GPSTarget>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader nvi_msgs-msg:header-val is deprecated.  Use nvi_msgs-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'status-val :lambda-list '(m))
(cl:defmethod status-val ((m <GPSTarget>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader nvi_msgs-msg:status-val is deprecated.  Use nvi_msgs-msg:status instead.")
  (status m))

(cl:ensure-generic-function 'direction-val :lambda-list '(m))
(cl:defmethod direction-val ((m <GPSTarget>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader nvi_msgs-msg:direction-val is deprecated.  Use nvi_msgs-msg:direction instead.")
  (direction m))

(cl:ensure-generic-function 'distance-val :lambda-list '(m))
(cl:defmethod distance-val ((m <GPSTarget>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader nvi_msgs-msg:distance-val is deprecated.  Use nvi_msgs-msg:distance instead.")
  (distance m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <GPSTarget>) ostream)
  "Serializes a message object of type '<GPSTarget>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:let* ((signed (cl:slot-value msg 'status)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    )
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'direction) ostream)
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'distance))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <GPSTarget>) istream)
  "Deserializes a message object of type '<GPSTarget>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'status) (cl:if (cl:< unsigned 128) unsigned (cl:- unsigned 256))))
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'direction) istream)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'distance) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<GPSTarget>)))
  "Returns string type for a message object of type '<GPSTarget>"
  "nvi_msgs/GPSTarget")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GPSTarget)))
  "Returns string type for a message object of type 'GPSTarget"
  "nvi_msgs/GPSTarget")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<GPSTarget>)))
  "Returns md5sum for a message object of type '<GPSTarget>"
  "acf0cdadcfb95c9af35e46b027089605")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'GPSTarget)))
  "Returns md5sum for a message object of type 'GPSTarget"
  "acf0cdadcfb95c9af35e46b027089605")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<GPSTarget>)))
  "Returns full string definition for message of type '<GPSTarget>"
  (cl:format cl:nil "Header header~%int8 status~%geometry_msgs/Point direction # target under vio coordinate  ~%# float32 direction_x ~%# float32 direction_y # target under vio coordinate~%float32 distance # target~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'GPSTarget)))
  "Returns full string definition for message of type 'GPSTarget"
  (cl:format cl:nil "Header header~%int8 status~%geometry_msgs/Point direction # target under vio coordinate  ~%# float32 direction_x ~%# float32 direction_y # target under vio coordinate~%float32 distance # target~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <GPSTarget>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     1
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'direction))
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <GPSTarget>))
  "Converts a ROS message object to a list"
  (cl:list 'GPSTarget
    (cl:cons ':header (header msg))
    (cl:cons ':status (status msg))
    (cl:cons ':direction (direction msg))
    (cl:cons ':distance (distance msg))
))
