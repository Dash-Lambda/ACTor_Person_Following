;; Auto-generated. Do not edit!


(when (boundp 'actor_person_following::Pose_Points)
  (if (not (find-package "ACTOR_PERSON_FOLLOWING"))
    (make-package "ACTOR_PERSON_FOLLOWING"))
  (shadow 'Pose_Points (find-package "ACTOR_PERSON_FOLLOWING")))
(unless (find-package "ACTOR_PERSON_FOLLOWING::POSE_POINTS")
  (make-package "ACTOR_PERSON_FOLLOWING::POSE_POINTS"))

(in-package "ROS")
;;//! \htmlinclude Pose_Points.msg.html


(defclass actor_person_following::Pose_Points
  :super ros::object
  :slots (_points ))

(defmethod actor_person_following::Pose_Points
  (:init
   (&key
    ((:points __points) ())
    )
   (send-super :init)
   (setq _points __points)
   self)
  (:points
   (&rest __points)
   (if (keywordp (car __points))
       (send* _points __points)
     (progn
       (if __points (setq _points (car __points)))
       _points)))
  (:serialization-length
   ()
   (+
    ;; actor_person_following/Pose_Point[] _points
    (apply #'+ (send-all _points :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; actor_person_following/Pose_Point[] _points
     (write-long (length _points) s)
     (dolist (elem _points)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; actor_person_following/Pose_Point[] _points
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _points (let (r) (dotimes (i n) (push (instance actor_person_following::Pose_Point :init) r)) r))
     (dolist (elem- _points)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(setf (get actor_person_following::Pose_Points :md5sum-) "08d73549e8366bc185d5053c1785ddc0")
(setf (get actor_person_following::Pose_Points :datatype-) "actor_person_following/Pose_Points")
(setf (get actor_person_following::Pose_Points :definition-)
      "actor_person_following/Pose_Point[] points

================================================================================
MSG: actor_person_following/Pose_Point
float64 x
float64 y
int32 frame_x
int32 frame_y

")



(provide :actor_person_following/Pose_Points "08d73549e8366bc185d5053c1785ddc0")


