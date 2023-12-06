;; Auto-generated. Do not edit!


(when (boundp 'nvi_msgs::Destination)
  (if (not (find-package "NVI_MSGS"))
    (make-package "NVI_MSGS"))
  (shadow 'Destination (find-package "NVI_MSGS")))
(unless (find-package "NVI_MSGS::DESTINATION")
  (make-package "NVI_MSGS::DESTINATION"))

(in-package "ROS")
;;//! \htmlinclude Destination.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass nvi_msgs::Destination
  :super ros::object
  :slots (_header _name _latitude _longitude _start_latitude _start_longitude ))

(defmethod nvi_msgs::Destination
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:name __name) "")
    ((:latitude __latitude) 0.0)
    ((:longitude __longitude) 0.0)
    ((:start_latitude __start_latitude) 0.0)
    ((:start_longitude __start_longitude) 0.0)
    )
   (send-super :init)
   (setq _header __header)
   (setq _name (string __name))
   (setq _latitude (float __latitude))
   (setq _longitude (float __longitude))
   (setq _start_latitude (float __start_latitude))
   (setq _start_longitude (float __start_longitude))
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:name
   (&optional __name)
   (if __name (setq _name __name)) _name)
  (:latitude
   (&optional __latitude)
   (if __latitude (setq _latitude __latitude)) _latitude)
  (:longitude
   (&optional __longitude)
   (if __longitude (setq _longitude __longitude)) _longitude)
  (:start_latitude
   (&optional __start_latitude)
   (if __start_latitude (setq _start_latitude __start_latitude)) _start_latitude)
  (:start_longitude
   (&optional __start_longitude)
   (if __start_longitude (setq _start_longitude __start_longitude)) _start_longitude)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; string _name
    4 (length _name)
    ;; float32 _latitude
    4
    ;; float32 _longitude
    4
    ;; float32 _start_latitude
    4
    ;; float32 _start_longitude
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; string _name
       (write-long (length _name) s) (princ _name s)
     ;; float32 _latitude
       (sys::poke _latitude (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _longitude
       (sys::poke _longitude (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _start_latitude
       (sys::poke _start_latitude (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _start_longitude
       (sys::poke _start_longitude (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; string _name
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _name (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; float32 _latitude
     (setq _latitude (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _longitude
     (setq _longitude (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _start_latitude
     (setq _start_latitude (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _start_longitude
     (setq _start_longitude (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get nvi_msgs::Destination :md5sum-) "9957a16a6d36235ddf7370da61eab599")
(setf (get nvi_msgs::Destination :datatype-) "nvi_msgs/Destination")
(setf (get nvi_msgs::Destination :definition-)
      "Header header
string name
float32 latitude
float32 longitude
float32 start_latitude
float32 start_longitude
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

")



(provide :nvi_msgs/Destination "9957a16a6d36235ddf7370da61eab599")


