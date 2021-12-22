;; Auto-generated. Do not edit!


(when (boundp 'actor_person_following::Pose_Point)
  (if (not (find-package "ACTOR_PERSON_FOLLOWING"))
    (make-package "ACTOR_PERSON_FOLLOWING"))
  (shadow 'Pose_Point (find-package "ACTOR_PERSON_FOLLOWING")))
(unless (find-package "ACTOR_PERSON_FOLLOWING::POSE_POINT")
  (make-package "ACTOR_PERSON_FOLLOWING::POSE_POINT"))

(in-package "ROS")
;;//! \htmlinclude Pose_Point.msg.html


(defclass actor_person_following::Pose_Point
  :super ros::object
  :slots (_x _y _frame_x _frame_y ))

(defmethod actor_person_following::Pose_Point
  (:init
   (&key
    ((:x __x) 0.0)
    ((:y __y) 0.0)
    ((:frame_x __frame_x) 0)
    ((:frame_y __frame_y) 0)
    )
   (send-super :init)
   (setq _x (float __x))
   (setq _y (float __y))
   (setq _frame_x (round __frame_x))
   (setq _frame_y (round __frame_y))
   self)
  (:x
   (&optional __x)
   (if __x (setq _x __x)) _x)
  (:y
   (&optional __y)
   (if __y (setq _y __y)) _y)
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
    ;; int32 _frame_x
    4
    ;; int32 _frame_y
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64 _x
       (sys::poke _x (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _y
       (sys::poke _y (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; int32 _frame_x
       (write-long _frame_x s)
     ;; int32 _frame_y
       (write-long _frame_y s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64 _x
     (setq _x (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _y
     (setq _y (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; int32 _frame_x
     (setq _frame_x (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _frame_y
     (setq _frame_y (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get actor_person_following::Pose_Point :md5sum-) "dfd463ee421cc1e9e1267153d3d5f543")
(setf (get actor_person_following::Pose_Point :datatype-) "actor_person_following/Pose_Point")
(setf (get actor_person_following::Pose_Point :definition-)
      "float64 x
float64 y
int32 frame_x
int32 frame_y

")



(provide :actor_person_following/Pose_Point "dfd463ee421cc1e9e1267153d3d5f543")


