;; Auto-generated. Do not edit!


(when (boundp 'actor_person_following::Detections)
  (if (not (find-package "ACTOR_PERSON_FOLLOWING"))
    (make-package "ACTOR_PERSON_FOLLOWING"))
  (shadow 'Detections (find-package "ACTOR_PERSON_FOLLOWING")))
(unless (find-package "ACTOR_PERSON_FOLLOWING::DETECTIONS")
  (make-package "ACTOR_PERSON_FOLLOWING::DETECTIONS"))

(in-package "ROS")
;;//! \htmlinclude Detections.msg.html
(if (not (find-package "PERCEPTION_MSGS"))
  (ros::roseus-add-msgs "perception_msgs"))
(if (not (find-package "SENSOR_MSGS"))
  (ros::roseus-add-msgs "sensor_msgs"))
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass actor_person_following::Detections
  :super ros::object
  :slots (_header _image_header _image _num_detects _detections _closest _close_target _aruco_target _color_target _xres _yres _aruco_visible _aruco_x _aruco_y _aruco_points _start _stop ))

(defmethod actor_person_following::Detections
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:image_header __image_header) (instance std_msgs::Header :init))
    ((:image __image) (instance sensor_msgs::Image :init))
    ((:num_detects __num_detects) 0)
    ((:detections __detections) ())
    ((:closest __closest) 0)
    ((:close_target __close_target) 0)
    ((:aruco_target __aruco_target) 0)
    ((:color_target __color_target) 0)
    ((:xres __xres) 0)
    ((:yres __yres) 0)
    ((:aruco_visible __aruco_visible) nil)
    ((:aruco_x __aruco_x) 0.0)
    ((:aruco_y __aruco_y) 0.0)
    ((:aruco_points __aruco_points) ())
    ((:start __start) nil)
    ((:stop __stop) nil)
    )
   (send-super :init)
   (setq _header __header)
   (setq _image_header __image_header)
   (setq _image __image)
   (setq _num_detects (round __num_detects))
   (setq _detections __detections)
   (setq _closest (round __closest))
   (setq _close_target (round __close_target))
   (setq _aruco_target (round __aruco_target))
   (setq _color_target (round __color_target))
   (setq _xres (round __xres))
   (setq _yres (round __yres))
   (setq _aruco_visible __aruco_visible)
   (setq _aruco_x (float __aruco_x))
   (setq _aruco_y (float __aruco_y))
   (setq _aruco_points __aruco_points)
   (setq _start __start)
   (setq _stop __stop)
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:image_header
   (&rest __image_header)
   (if (keywordp (car __image_header))
       (send* _image_header __image_header)
     (progn
       (if __image_header (setq _image_header (car __image_header)))
       _image_header)))
  (:image
   (&rest __image)
   (if (keywordp (car __image))
       (send* _image __image)
     (progn
       (if __image (setq _image (car __image)))
       _image)))
  (:num_detects
   (&optional __num_detects)
   (if __num_detects (setq _num_detects __num_detects)) _num_detects)
  (:detections
   (&rest __detections)
   (if (keywordp (car __detections))
       (send* _detections __detections)
     (progn
       (if __detections (setq _detections (car __detections)))
       _detections)))
  (:closest
   (&optional __closest)
   (if __closest (setq _closest __closest)) _closest)
  (:close_target
   (&optional __close_target)
   (if __close_target (setq _close_target __close_target)) _close_target)
  (:aruco_target
   (&optional __aruco_target)
   (if __aruco_target (setq _aruco_target __aruco_target)) _aruco_target)
  (:color_target
   (&optional __color_target)
   (if __color_target (setq _color_target __color_target)) _color_target)
  (:xres
   (&optional __xres)
   (if __xres (setq _xres __xres)) _xres)
  (:yres
   (&optional __yres)
   (if __yres (setq _yres __yres)) _yres)
  (:aruco_visible
   (&optional (__aruco_visible :null))
   (if (not (eq __aruco_visible :null)) (setq _aruco_visible __aruco_visible)) _aruco_visible)
  (:aruco_x
   (&optional __aruco_x)
   (if __aruco_x (setq _aruco_x __aruco_x)) _aruco_x)
  (:aruco_y
   (&optional __aruco_y)
   (if __aruco_y (setq _aruco_y __aruco_y)) _aruco_y)
  (:aruco_points
   (&rest __aruco_points)
   (if (keywordp (car __aruco_points))
       (send* _aruco_points __aruco_points)
     (progn
       (if __aruco_points (setq _aruco_points (car __aruco_points)))
       _aruco_points)))
  (:start
   (&optional (__start :null))
   (if (not (eq __start :null)) (setq _start __start)) _start)
  (:stop
   (&optional (__stop :null))
   (if (not (eq __stop :null)) (setq _stop __stop)) _stop)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; std_msgs/Header _image_header
    (send _image_header :serialization-length)
    ;; sensor_msgs/Image _image
    (send _image :serialization-length)
    ;; int32 _num_detects
    4
    ;; actor_person_following/Detection[] _detections
    (apply #'+ (send-all _detections :serialization-length)) 4
    ;; int32 _closest
    4
    ;; int32 _close_target
    4
    ;; int32 _aruco_target
    4
    ;; int32 _color_target
    4
    ;; int32 _xres
    4
    ;; int32 _yres
    4
    ;; bool _aruco_visible
    1
    ;; float64 _aruco_x
    8
    ;; float64 _aruco_y
    8
    ;; perception_msgs/PointInImage[] _aruco_points
    (apply #'+ (send-all _aruco_points :serialization-length)) 4
    ;; bool _start
    1
    ;; bool _stop
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; std_msgs/Header _image_header
       (send _image_header :serialize s)
     ;; sensor_msgs/Image _image
       (send _image :serialize s)
     ;; int32 _num_detects
       (write-long _num_detects s)
     ;; actor_person_following/Detection[] _detections
     (write-long (length _detections) s)
     (dolist (elem _detections)
       (send elem :serialize s)
       )
     ;; int32 _closest
       (write-long _closest s)
     ;; int32 _close_target
       (write-long _close_target s)
     ;; int32 _aruco_target
       (write-long _aruco_target s)
     ;; int32 _color_target
       (write-long _color_target s)
     ;; int32 _xres
       (write-long _xres s)
     ;; int32 _yres
       (write-long _yres s)
     ;; bool _aruco_visible
       (if _aruco_visible (write-byte -1 s) (write-byte 0 s))
     ;; float64 _aruco_x
       (sys::poke _aruco_x (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _aruco_y
       (sys::poke _aruco_y (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; perception_msgs/PointInImage[] _aruco_points
     (write-long (length _aruco_points) s)
     (dolist (elem _aruco_points)
       (send elem :serialize s)
       )
     ;; bool _start
       (if _start (write-byte -1 s) (write-byte 0 s))
     ;; bool _stop
       (if _stop (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; std_msgs/Header _image_header
     (send _image_header :deserialize buf ptr-) (incf ptr- (send _image_header :serialization-length))
   ;; sensor_msgs/Image _image
     (send _image :deserialize buf ptr-) (incf ptr- (send _image :serialization-length))
   ;; int32 _num_detects
     (setq _num_detects (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; actor_person_following/Detection[] _detections
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _detections (let (r) (dotimes (i n) (push (instance actor_person_following::Detection :init) r)) r))
     (dolist (elem- _detections)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;; int32 _closest
     (setq _closest (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _close_target
     (setq _close_target (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _aruco_target
     (setq _aruco_target (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _color_target
     (setq _color_target (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _xres
     (setq _xres (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _yres
     (setq _yres (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; bool _aruco_visible
     (setq _aruco_visible (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; float64 _aruco_x
     (setq _aruco_x (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _aruco_y
     (setq _aruco_y (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; perception_msgs/PointInImage[] _aruco_points
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _aruco_points (let (r) (dotimes (i n) (push (instance perception_msgs::PointInImage :init) r)) r))
     (dolist (elem- _aruco_points)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;; bool _start
     (setq _start (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; bool _stop
     (setq _stop (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(setf (get actor_person_following::Detections :md5sum-) "89334e354050dfb15aacf14eca62859b")
(setf (get actor_person_following::Detections :datatype-) "actor_person_following/Detections")
(setf (get actor_person_following::Detections :definition-)
      "Header header
Header image_header
sensor_msgs/Image image
int32 num_detects
Detection[] detections

int32 closest
int32 close_target
int32 aruco_target
int32 color_target

int32 xres
int32 yres

bool aruco_visible
float64 aruco_x
float64 aruco_y
perception_msgs/PointInImage[] aruco_points

bool start
bool stop

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
MSG: sensor_msgs/Image
# This message contains an uncompressed image
# (0, 0) is at top-left corner of image
#

Header header        # Header timestamp should be acquisition time of image
                     # Header frame_id should be optical frame of camera
                     # origin of frame should be optical center of camera
                     # +x should point to the right in the image
                     # +y should point down in the image
                     # +z should point into to plane of the image
                     # If the frame_id here and the frame_id of the CameraInfo
                     # message associated with the image conflict
                     # the behavior is undefined

uint32 height         # image height, that is, number of rows
uint32 width          # image width, that is, number of columns

# The legal values for encoding are in file src/image_encodings.cpp
# If you want to standardize a new string format, join
# ros-users@lists.sourceforge.net and send an email proposing a new encoding.

string encoding       # Encoding of pixels -- channel meaning, ordering, size
                      # taken from the list of strings in include/sensor_msgs/image_encodings.h

uint8 is_bigendian    # is this data bigendian?
uint32 step           # Full row length in bytes
uint8[] data          # actual matrix data, size is (step * rows)

================================================================================
MSG: actor_person_following/Detection
float64 width
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

================================================================================
MSG: perception_msgs/PointInImage
# x coordinate of the point in the image
float32 x
# y coordinate of the poitn in the image
float32 y

")



(provide :actor_person_following/Detections "89334e354050dfb15aacf14eca62859b")


