;; Auto-generated. Do not edit!


(when (boundp 'actor_person_following::Lidar_Points)
  (if (not (find-package "ACTOR_PERSON_FOLLOWING"))
    (make-package "ACTOR_PERSON_FOLLOWING"))
  (shadow 'Lidar_Points (find-package "ACTOR_PERSON_FOLLOWING")))
(unless (find-package "ACTOR_PERSON_FOLLOWING::LIDAR_POINTS")
  (make-package "ACTOR_PERSON_FOLLOWING::LIDAR_POINTS"))

(in-package "ROS")
;;//! \htmlinclude Lidar_Points.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass actor_person_following::Lidar_Points
  :super ros::object
  :slots (_header _points _max_distance _xmin _xmax _ymin _ymax _zmin _zmax ))

(defmethod actor_person_following::Lidar_Points
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:points __points) ())
    ((:max_distance __max_distance) 0.0)
    ((:xmin __xmin) 0.0)
    ((:xmax __xmax) 0.0)
    ((:ymin __ymin) 0.0)
    ((:ymax __ymax) 0.0)
    ((:zmin __zmin) 0.0)
    ((:zmax __zmax) 0.0)
    )
   (send-super :init)
   (setq _header __header)
   (setq _points __points)
   (setq _max_distance (float __max_distance))
   (setq _xmin (float __xmin))
   (setq _xmax (float __xmax))
   (setq _ymin (float __ymin))
   (setq _ymax (float __ymax))
   (setq _zmin (float __zmin))
   (setq _zmax (float __zmax))
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:points
   (&rest __points)
   (if (keywordp (car __points))
       (send* _points __points)
     (progn
       (if __points (setq _points (car __points)))
       _points)))
  (:max_distance
   (&optional __max_distance)
   (if __max_distance (setq _max_distance __max_distance)) _max_distance)
  (:xmin
   (&optional __xmin)
   (if __xmin (setq _xmin __xmin)) _xmin)
  (:xmax
   (&optional __xmax)
   (if __xmax (setq _xmax __xmax)) _xmax)
  (:ymin
   (&optional __ymin)
   (if __ymin (setq _ymin __ymin)) _ymin)
  (:ymax
   (&optional __ymax)
   (if __ymax (setq _ymax __ymax)) _ymax)
  (:zmin
   (&optional __zmin)
   (if __zmin (setq _zmin __zmin)) _zmin)
  (:zmax
   (&optional __zmax)
   (if __zmax (setq _zmax __zmax)) _zmax)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; actor_person_following/Lidar_Point[] _points
    (apply #'+ (send-all _points :serialization-length)) 4
    ;; float64 _max_distance
    8
    ;; float64 _xmin
    8
    ;; float64 _xmax
    8
    ;; float64 _ymin
    8
    ;; float64 _ymax
    8
    ;; float64 _zmin
    8
    ;; float64 _zmax
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; actor_person_following/Lidar_Point[] _points
     (write-long (length _points) s)
     (dolist (elem _points)
       (send elem :serialize s)
       )
     ;; float64 _max_distance
       (sys::poke _max_distance (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _xmin
       (sys::poke _xmin (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _xmax
       (sys::poke _xmax (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _ymin
       (sys::poke _ymin (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _ymax
       (sys::poke _ymax (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _zmin
       (sys::poke _zmin (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _zmax
       (sys::poke _zmax (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; actor_person_following/Lidar_Point[] _points
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _points (let (r) (dotimes (i n) (push (instance actor_person_following::Lidar_Point :init) r)) r))
     (dolist (elem- _points)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;; float64 _max_distance
     (setq _max_distance (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _xmin
     (setq _xmin (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _xmax
     (setq _xmax (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _ymin
     (setq _ymin (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _ymax
     (setq _ymax (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _zmin
     (setq _zmin (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _zmax
     (setq _zmax (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(setf (get actor_person_following::Lidar_Points :md5sum-) "07597cb25cd3fee3a74bcea7ddf36338")
(setf (get actor_person_following::Lidar_Points :datatype-) "actor_person_following/Lidar_Points")
(setf (get actor_person_following::Lidar_Points :definition-)
      "Header header
Lidar_Point[] points

float64 max_distance
float64 xmin
float64 xmax
float64 ymin
float64 ymax
float64 zmin
float64 zmax

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
MSG: actor_person_following/Lidar_Point
float64 x
float64 y
float64 z

float64 distance
float64 pitch
float64 yaw

float64 frame_x
float64 frame_y

")



(provide :actor_person_following/Lidar_Points "07597cb25cd3fee3a74bcea7ddf36338")


