;; Auto-generated. Do not edit!


(when (boundp 'actor_person_following::Lidar_Point)
  (if (not (find-package "ACTOR_PERSON_FOLLOWING"))
    (make-package "ACTOR_PERSON_FOLLOWING"))
  (shadow 'Lidar_Point (find-package "ACTOR_PERSON_FOLLOWING")))
(unless (find-package "ACTOR_PERSON_FOLLOWING::LIDAR_POINT")
  (make-package "ACTOR_PERSON_FOLLOWING::LIDAR_POINT"))

(in-package "ROS")
;;//! \htmlinclude Lidar_Point.msg.html


(defclass actor_person_following::Lidar_Point
  :super ros::object
  :slots (_x _y _z _distance _pitch _yaw _frame_x _frame_y ))

(defmethod actor_person_following::Lidar_Point
  (:init
   (&key
    ((:x __x) 0.0)
    ((:y __y) 0.0)
    ((:z __z) 0.0)
    ((:distance __distance) 0.0)
    ((:pitch __pitch) 0.0)
    ((:yaw __yaw) 0.0)
    ((:frame_x __frame_x) 0.0)
    ((:frame_y __frame_y) 0.0)
    )
   (send-super :init)
   (setq _x (float __x))
   (setq _y (float __y))
   (setq _z (float __z))
   (setq _distance (float __distance))
   (setq _pitch (float __pitch))
   (setq _yaw (float __yaw))
   (setq _frame_x (float __frame_x))
   (setq _frame_y (float __frame_y))
   self)
  (:x
   (&optional __x)
   (if __x (setq _x __x)) _x)
  (:y
   (&optional __y)
   (if __y (setq _y __y)) _y)
  (:z
   (&optional __z)
   (if __z (setq _z __z)) _z)
  (:distance
   (&optional __distance)
   (if __distance (setq _distance __distance)) _distance)
  (:pitch
   (&optional __pitch)
   (if __pitch (setq _pitch __pitch)) _pitch)
  (:yaw
   (&optional __yaw)
   (if __yaw (setq _yaw __yaw)) _yaw)
  (:frame_x
   (&optional __frame_x)
   (if __frame_x (setq _frame_x __frame_x)) _frame_x)
  (:frame_y
   (&optional __frame_y)
   (if __frame_y (setq _frame_y __frame_y)) _frame_y)
  (:serialization-length
   ()
   (+
    ;; float64 _x
    8
    ;; float64 _y
    8
    ;; float64 _z
    8
    ;; float64 _distance
    8
    ;; float64 _pitch
    8
    ;; float64 _yaw
    8
    ;; float64 _frame_x
    8
    ;; float64 _frame_y
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64 _x
       (sys::poke _x (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _y
       (sys::poke _y (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _z
       (sys::poke _z (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _distance
       (sys::poke _distance (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _pitch
       (sys::poke _pitch (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _yaw
       (sys::poke _yaw (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _frame_x
       (sys::poke _frame_x (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _frame_y
       (sys::poke _frame_y (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64 _x
     (setq _x (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _y
     (setq _y (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _z
     (setq _z (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _distance
     (setq _distance (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _pitch
     (setq _pitch (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _yaw
     (setq _yaw (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _frame_x
     (setq _frame_x (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _frame_y
     (setq _frame_y (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(setf (get actor_person_following::Lidar_Point :md5sum-) "5ef9fa9be200f6b495d5f703b43a50f7")
(setf (get actor_person_following::Lidar_Point :datatype-) "actor_person_following/Lidar_Point")
(setf (get actor_person_following::Lidar_Point :definition-)
      "float64 x
float64 y
float64 z

float64 distance
float64 pitch
float64 yaw

float64 frame_x
float64 frame_y

")



(provide :actor_person_following/Lidar_Point "5ef9fa9be200f6b495d5f703b43a50f7")


