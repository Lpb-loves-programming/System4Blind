; Auto-generated. Do not edit!


(cl:in-package nvi_msgs-msg)


;//! \htmlinclude HeaderFloat32.msg.html

(cl:defclass <HeaderFloat32> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (data
    :reader data
    :initarg :data
    :type cl:float
    :initform 0.0))
)

(cl:defclass HeaderFloat32 (<HeaderFloat32>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <HeaderFloat32>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'HeaderFloat32)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name nvi_msgs-msg:<HeaderFloat32> is deprecated: use nvi_msgs-msg:HeaderFloat32 instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <HeaderFloat32>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader nvi_msgs-msg:header-val is deprecated.  Use nvi_msgs-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'data-val :lambda-list '(m))
(cl:defmethod data-val ((m <HeaderFloat32>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader nvi_msgs-msg:data-val is deprecated.  Use nvi_msgs-msg:data instead.")
  (data m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <HeaderFloat32>) ostream)
  "Serializes a message object of type '<HeaderFloat32>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'data))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <HeaderFloat32>) istream)
  "Deserializes a message object of type '<HeaderFloat32>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'data) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<HeaderFloat32>)))
  "Returns string type for a message object of type '<HeaderFloat32>"
  "nvi_msgs/HeaderFloat32")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'HeaderFloat32)))
  "Returns string type for a message object of type 'HeaderFloat32"
  "nvi_msgs/HeaderFloat32")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<HeaderFloat32>)))
  "Returns md5sum for a message object of type '<HeaderFloat32>"
  "ef848af8cf12f6df11682cc76fba477b")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'HeaderFloat32)))
  "Returns md5sum for a message object of type 'HeaderFloat32"
  "ef848af8cf12f6df11682cc76fba477b")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<HeaderFloat32>)))
  "Returns full string definition for message of type '<HeaderFloat32>"
  (cl:format cl:nil "Header header~%float32 data~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'HeaderFloat32)))
  "Returns full string definition for message of type 'HeaderFloat32"
  (cl:format cl:nil "Header header~%float32 data~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <HeaderFloat32>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <HeaderFloat32>))
  "Converts a ROS message object to a list"
  (cl:list 'HeaderFloat32
    (cl:cons ':header (header msg))
    (cl:cons ':data (data msg))
))
