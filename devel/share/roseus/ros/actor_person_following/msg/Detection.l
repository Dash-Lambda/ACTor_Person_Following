;; Auto-generated. Do not edit!


(when (boundp 'actor_person_following::Detection)
  (if (not (find-package "ACTOR_PERSON_FOLLOWING"))
    (make-package "ACTOR_PERSON_FOLLOWING"))
  (shadow 'Detection (find-package "ACTOR_PERSON_FOLLOWING")))
(unless (find-package "ACTOR_PERSON_FOLLOWING::DETECTION")
  (make-package "ACTOR_PERSON_FOLLOWING::DETECTION"))

(in-package "ROS")
;;//! \htmlinclude Detection.msg.html
(if (not (find-package "DARKNET_ROS_MSGS"))
  (ros::roseus-add-msgs "darknet_ros_msgs"))


(defclass actor_person_following::Detection
  :super ros::object
  :slots (_width _height _center _close_overlap _aruco_overlap _close_dist _aruco_dist _aruco_strength _r _g _b _gesture _pose_points _box _lidar_point ))

(defmethod actor_person_following::Detection
  (:init
   (&key
    ((:width __width) 0.0)
    ((:height __height) 0.0)
    ((:center __center) 0.0)
    ((:close_overlap __close_overlap) 0.0)
    ((:aruco_overlap __aruco_overlap) 0.0)
    ((:close_dist __close_dist) 0.0)
    ((:aruco_dist __aruco_dist) 0.0)
    ((:aruco_strength __aruco_strength) 0.0)
    ((:r __r) 0.0)
    ((:g __g) 0.0)
    ((:b __b) 0.0)
    ((:gesture __gesture) "")
    ((:pose_points __pose_points) (instance actor_person_following::Pose_Points :init))
    ((:box __box) (instance darknet_ros_msgs::BoundingBox :init))
    ((:lidar_point __lidar_point) (instance actor_person_following::Lidar_Point :init))
    )
   (send-super :init)
   (setq _width (float __width))
   (setq _height (float __height))
   (setq _center (float __center))
   (setq _close_overlap (float __close_overlap))
   (setq _aruco_overlap (float __aruco_overlap))
   (setq _close_dist (float __close_dist))
   (setq _aruco_dist (float __aruco_dist))
   (setq _aruco_strength (float __aruco_strength))
   (setq _r (float __r))
   (setq _g (float __g))
   (setq _b (float __b))
   (setq _gesture (string __gesture))
   (setq _pose_points __pose_points)
   (setq _box __box)
   (setq _lidar_point __lidar_point)
   self)
  (:width
   (&optional __width)
   (if __width (setq _width __width)) _width)
  (:height
   (&optional __height)
   (if __height (setq _height __height)) _height)
  (:center
   (&optional __center)
   (if __center (setq _center __center)) _center)
  (:close_overlap
   (&optional __close_overlap)
   (if __close_overlap (setq _close_overlap __close_overlap)) _close_overlap)
  (:aruco_overlap
   (&optional __aruco_overlap)
   (if __aruco_overlap (setq _aruco_overlap __aruco_overlap)) _aruco_overlap)
  (:close_dist
   (&optional __close_dist)
   (if __close_dist (setq _close_dist __close_dist)) _close_dist)
  (:aruco_dist
   (&optional __aruco_dist)
   (if __aruco_dist (setq _aruco_dist __aruco_dist)) _aruco_dist)
  (:aruco_strength
   (&optional __aruco_strength)
   (if __aruco_strength (setq _aruco_strength __aruco_strength)) _aruco_strength)
  (:r
   (&optional __r)
   (if __r (setq _r __r)) _r)
  (:g
   (&optional __g)
   (if __g (setq _g __g)) _g)
  (:b
   (&optional __b)
   (if __b (setq _b __b)) _b)
  (:gesture
   (&optional __gesture)
   (if __gesture (setq _gesture __gesture)) _gesture)
  (:pose_points
   (&rest __pose_points)
   (if (keywordp (car __pose_points))
       (send* _pose_points __pose_points)
     (progn
       (if __pose_points (setq _pose_points (car __pose_points)))
       _pose_points)))
  (:box
   (&rest __box)
   (if (keywordp (car __box))
       (send* _box __box)
     (progn
       (if __box (setq _box (car __box)))
       _box)))
  (:lidar_point
   (&rest __lidar_point)
   (if (keywordp (car __lidar_point))
       (send* _lidar_point __lidar_point)
     (progn
       (if __lidar_point (setq _lidar_point (car __lidar_point)))
       _lidar_point)))
  (:serialization-length
   ()
   (+
    ;; float64 _width
    8
    ;; float64 _height
    8
    ;; float64 _center
    8
    ;; float64 _close_overlap
    8
    ;; float64 _aruco_overlap
    8
    ;; float64 _close_dist
    8
    ;; float64 _aruco_dist
    8
    ;; float64 _aruco_strength
    8
    ;; float32 _r
    4
    ;; float32 _g
    4
    ;; float32 _b
    4
    ;; string _gesture
    4 (length _gesture)
    ;; actor_person_following/Pose_Points _pose_points
    (send _pose_points :serialization-length)
    ;; darknet_ros_msgs/BoundingBox _box
    (send _box :serialization-length)
    ;; actor_person_following/Lidar_Point _lidar_point
    (send _lidar_point :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64 _width
       (sys::poke _width (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _height
       (sys::poke _height (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _center
       (sys::poke _center (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _close_overlap
       (sys::poke _close_overlap (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _aruco_overlap
       (sys::poke _aruco_overlap (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _close_dist
       (sys::poke _close_dist (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _aruco_dist
       (sys::poke _aruco_dist (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _aruco_strength
       (sys::poke _aruco_strength (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float32 _r
       (sys::poke _r (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _g
       (sys::poke _g (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _b
       (sys::poke _b (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; string _gesture
       (write-long (length _gesture) s) (princ _gesture s)
     ;; actor_person_following/Pose_Points _pose_points
       (send _pose_points :serialize s)
     ;; darknet_ros_msgs/BoundingBox _box
       (send _box :serialize s)
     ;; actor_person_following/Lidar_Point _lidar_point
       (send _lidar_point :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64 _width
     (setq _width (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _height
     (setq _height (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _center
     (setq _center (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _close_overlap
     (setq _close_overlap (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _aruco_overlap
     (setq _aruco_overlap (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _close_dist
     (setq _close_dist (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _aruco_dist
     (setq _aruco_dist (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _aruco_strength
     (setq _aruco_strength (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float32 _r
     (setq _r (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _g
     (setq _g (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _b
     (setq _b (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; string _gesture
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _gesture (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; actor_person_following/Pose_Points _pose_points
     (send _pose_points :deserialize buf ptr-) (incf ptr- (send _pose_points :serialization-length))
   ;; darknet_ros_msgs/BoundingBox _box
     (send _box :deserialize buf ptr-) (incf ptr- (send _box :serialization-length))
   ;; actor_person_following/Lidar_Point _lidar_point
     (send _lidar_point :deserialize buf ptr-) (incf ptr- (send _lidar_point :serialization-length))
   ;;
   self)
  )

(setf (get actor_person_following::Detection :md5sum-) "83582f4681826792410c545e6580f1c0")
(setf (get actor_person_following::Detection :datatype-) "actor_person_following/Detection")
(setf (get actor_person_following::Detection :definition-)
      "float64 width
float64 height
float64 center

float64 close_overlap
float64 aruco_overlap

float64 close_dist
float64 aruco_dist

float64 aruco_strength

float32 r
float32 g
float32 b

string gesture
actor_person_following/Pose_Points pose_points

darknet_ros_msgs/BoundingBox box
actor_person_following/Lidar_Point lidar_point

================================================================================
MSG: actor_person_following/Pose_Points
actor_person_following/Pose_Point[] points

================================================================================
MSG: actor_person_following/Pose_Point
float64 x
float64 y
int32 frame_x
int32 frame_y

================================================================================
MSG: darknet_ros_msgs/BoundingBox
float64 probability
int64 xmin
int64 ymin
int64 xmax
int64 ymax
int16 id
string Class

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



(provide :actor_person_following/Detection "83582f4681826792410c545e6580f1c0")


