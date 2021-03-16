;; Auto-generated. Do not edit!


(when (boundp 'actor_person_following::Detections)
  (if (not (find-package "ACTOR_PERSON_FOLLOWING"))
    (make-package "ACTOR_PERSON_FOLLOWING"))
  (shadow 'Detections (find-package "ACTOR_PERSON_FOLLOWING")))
(unless (find-package "ACTOR_PERSON_FOLLOWING::DETECTIONS")
  (make-package "ACTOR_PERSON_FOLLOWING::DETECTIONS"))

(in-package "ROS")
;;//! \htmlinclude Detections.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass actor_person_following::Detections
  :super ros::object
  :slots (_header _num_detects _closest _detections _xres _yres ))

(defmethod actor_person_following::Detections
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:num_detects __num_detects) 0)
    ((:closest __closest) 0)
    ((:detections __detections) (let (r) (dotimes (i 0) (push (instance actor_person_following::Detection :init) r)) r))
    ((:xres __xres) 0)
    ((:yres __yres) 0)
    )
   (send-super :init)
   (setq _header __header)
   (setq _num_detects (round __num_detects))
   (setq _closest (round __closest))
   (setq _detections __detections)
   (setq _xres (round __xres))
   (setq _yres (round __yres))
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:num_detects
   (&optional __num_detects)
   (if __num_detects (setq _num_detects __num_detects)) _num_detects)
  (:closest
   (&optional __closest)
   (if __closest (setq _closest __closest)) _closest)
  (:detections
   (&rest __detections)
   (if (keywordp (car __detections))
       (send* _detections __detections)
     (progn
       (if __detections (setq _detections (car __detections)))
       _detections)))
  (:xres
   (&optional __xres)
   (if __xres (setq _xres __xres)) _xres)
  (:yres
   (&optional __yres)
   (if __yres (setq _yres __yres)) _yres)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; int32 _num_detects
    4
    ;; int32 _closest
    4
    ;; actor_person_following/Detection[] _detections
    (apply #'+ (send-all _detections :serialization-length)) 4
    ;; int32 _xres
    4
    ;; int32 _yres
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; int32 _num_detects
       (write-long _num_detects s)
     ;; int32 _closest
       (write-long _closest s)
     ;; actor_person_following/Detection[] _detections
     (write-long (length _detections) s)
     (dolist (elem _detections)
       (send elem :serialize s)
       )
     ;; int32 _xres
       (write-long _xres s)
     ;; int32 _yres
       (write-long _yres s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; int32 _num_detects
     (setq _num_detects (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _closest
     (setq _closest (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; actor_person_following/Detection[] _detections
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _detections (let (r) (dotimes (i n) (push (instance actor_person_following::Detection :init) r)) r))
     (dolist (elem- _detections)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;; int32 _xres
     (setq _xres (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _yres
     (setq _yres (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get actor_person_following::Detections :md5sum-) "0650002a922808155cc9f3d500ee9e38")
(setf (get actor_person_following::Detections :datatype-) "actor_person_following/Detections")
(setf (get actor_person_following::Detections :definition-)
      "Header header
int32 num_detects
int32 closest
Detection[] detections

int32 xres
int32 yres

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
# 0: no frame
# 1: global frame
string frame_id

================================================================================
MSG: actor_person_following/Detection
float64 width
float64 height
float64 center

float32 r
float32 g
float32 b


")



(provide :actor_person_following/Detections "0650002a922808155cc9f3d500ee9e38")


