;; Auto-generated. Do not edit!


(when (boundp 'nvi_msgs::TargetPath)
  (if (not (find-package "NVI_MSGS"))
    (make-package "NVI_MSGS"))
  (shadow 'TargetPath (find-package "NVI_MSGS")))
(unless (find-package "NVI_MSGS::TARGETPATH")
  (make-package "NVI_MSGS::TARGETPATH"))

(in-package "ROS")
;;//! \htmlinclude TargetPath.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass nvi_msgs::TargetPath
  :super ros::object
  :slots (_header _data ))

(defmethod nvi_msgs::TargetPath
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:data __data) ())
    )
   (send-super :init)
   (setq _header __header)
   (setq _data __data)
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:data
   (&rest __data)
   (if (keywordp (car __data))
       (send* _data __data)
     (progn
       (if __data (setq _data (car __data)))
       _data)))
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; nvi_msgs/TargetWaypoint[] _data
    (apply #'+ (send-all _data :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; nvi_msgs/TargetWaypoint[] _data
     (write-long (length _data) s)
     (dolist (elem _data)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; nvi_msgs/TargetWaypoint[] _data
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _data (let (r) (dotimes (i n) (push (instance nvi_msgs::TargetWaypoint :init) r)) r))
     (dolist (elem- _data)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(setf (get nvi_msgs::TargetPath :md5sum-) "044f4777a7989371ef1302e9d98a28a7")
(setf (get nvi_msgs::TargetPath :datatype-) "nvi_msgs/TargetPath")
(setf (get nvi_msgs::TargetPath :definition-)
      "Header header
TargetWaypoint[] data
================================================================================
MSG: std_msgs/Header
# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
string frame_id

================================================================================
MSG: nvi_msgs/TargetWaypoint
float32 x
float32 y
float32 z 
")



(provide :nvi_msgs/TargetPath "044f4777a7989371ef1302e9d98a28a7")


