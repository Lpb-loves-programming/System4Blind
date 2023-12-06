;; Auto-generated. Do not edit!


(when (boundp 'nvi_msgs::Object)
  (if (not (find-package "NVI_MSGS"))
    (make-package "NVI_MSGS"))
  (shadow 'Object (find-package "NVI_MSGS")))
(unless (find-package "NVI_MSGS::OBJECT")
  (make-package "NVI_MSGS::OBJECT"))

(in-package "ROS")
;;//! \htmlinclude Object.msg.html


(defclass nvi_msgs::Object
  :super ros::object
  :slots (_semantic _direction _distance ))

(defmethod nvi_msgs::Object
  (:init
   (&key
    ((:semantic __semantic) "")
    ((:direction __direction) 0)
    ((:distance __distance) 0.0)
    )
   (send-super :init)
   (setq _semantic (string __semantic))
   (setq _direction (round __direction))
   (setq _distance (float __distance))
   self)
  (:semantic
   (&optional __semantic)
   (if __semantic (setq _semantic __semantic)) _semantic)
  (:direction
   (&optional __direction)
   (if __direction (setq _direction __direction)) _direction)
  (:distance
   (&optional __distance)
   (if __distance (setq _distance __distance)) _distance)
  (:serialization-length
   ()
   (+
    ;; string _semantic
    4 (length _semantic)
    ;; int8 _direction
    1
    ;; float32 _distance
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _semantic
       (write-long (length _semantic) s) (princ _semantic s)
     ;; int8 _direction
       (write-byte _direction s)
     ;; float32 _distance
       (sys::poke _distance (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _semantic
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _semantic (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; int8 _direction
     (setq _direction (sys::peek buf ptr- :char)) (incf ptr- 1)
     (if (> _direction 127) (setq _direction (- _direction 256)))
   ;; float32 _distance
     (setq _distance (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get nvi_msgs::Object :md5sum-) "4029a610397d831f579f9e308ca4493c")
(setf (get nvi_msgs::Object :datatype-) "nvi_msgs/Object")
(setf (get nvi_msgs::Object :definition-)
      "string semantic
int8 direction
float32 distance
")



(provide :nvi_msgs/Object "4029a610397d831f579f9e308ca4493c")


