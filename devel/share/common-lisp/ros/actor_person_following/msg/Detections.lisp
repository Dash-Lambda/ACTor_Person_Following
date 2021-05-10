; Auto-generated. Do not edit!


(cl:in-package actor_person_following-msg)


;//! \htmlinclude Detections.msg.html

(cl:defclass <Detections> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (image_header
    :reader image_header
    :initarg :image_header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (num_detects
    :reader num_detects
    :initarg :num_detects
    :type cl:integer
    :initform 0)
   (detections
    :reader detections
    :initarg :detections
    :type (cl:vector actor_person_following-msg:Detection)
   :initform (cl:make-array 0 :element-type 'actor_person_following-msg:Detection :initial-element (cl:make-instance 'actor_person_following-msg:Detection)))
   (closest
    :reader closest
    :initarg :closest
    :type cl:integer
    :initform 0)
   (close_target
    :reader close_target
    :initarg :close_target
    :type cl:integer
    :initform 0)
   (aruco_target
    :reader aruco_target
    :initarg :aruco_target
    :type cl:integer
    :initform 0)
   (color_target
    :reader color_target
    :initarg :color_target
    :type cl:integer
    :initform 0)
   (xres
    :reader xres
    :initarg :xres
    :type cl:integer
    :initform 0)
   (yres
    :reader yres
    :initarg :yres
    :type cl:integer
    :initform 0)
   (aruco_visible
    :reader aruco_visible
    :initarg :aruco_visible
    :type cl:boolean
    :initform cl:nil)
   (aruco_x
    :reader aruco_x
    :initarg :aruco_x
    :type cl:float
    :initform 0.0)
   (aruco_y
    :reader aruco_y
    :initarg :aruco_y
    :type cl:float
    :initform 0.0)
   (aruco_points
    :reader aruco_points
    :initarg :aruco_points
    :type (cl:vector perception_msgs-msg:PointInImage)
   :initform (cl:make-array 0 :element-type 'perception_msgs-msg:PointInImage :initial-element (cl:make-instance 'perception_msgs-msg:PointInImage))))
)

(cl:defclass Detections (<Detections>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Detections>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Detections)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name actor_person_following-msg:<Detections> is deprecated: use actor_person_following-msg:Detections instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <Detections>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader actor_person_following-msg:header-val is deprecated.  Use actor_person_following-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'image_header-val :lambda-list '(m))
(cl:defmethod image_header-val ((m <Detections>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader actor_person_following-msg:image_header-val is deprecated.  Use actor_person_following-msg:image_header instead.")
  (image_header m))

(cl:ensure-generic-function 'num_detects-val :lambda-list '(m))
(cl:defmethod num_detects-val ((m <Detections>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader actor_person_following-msg:num_detects-val is deprecated.  Use actor_person_following-msg:num_detects instead.")
  (num_detects m))

(cl:ensure-generic-function 'detections-val :lambda-list '(m))
(cl:defmethod detections-val ((m <Detections>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader actor_person_following-msg:detections-val is deprecated.  Use actor_person_following-msg:detections instead.")
  (detections m))

(cl:ensure-generic-function 'closest-val :lambda-list '(m))
(cl:defmethod closest-val ((m <Detections>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader actor_person_following-msg:closest-val is deprecated.  Use actor_person_following-msg:closest instead.")
  (closest m))

(cl:ensure-generic-function 'close_target-val :lambda-list '(m))
(cl:defmethod close_target-val ((m <Detections>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader actor_person_following-msg:close_target-val is deprecated.  Use actor_person_following-msg:close_target instead.")
  (close_target m))

(cl:ensure-generic-function 'aruco_target-val :lambda-list '(m))
(cl:defmethod aruco_target-val ((m <Detections>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader actor_person_following-msg:aruco_target-val is deprecated.  Use actor_person_following-msg:aruco_target instead.")
  (aruco_target m))

(cl:ensure-generic-function 'color_target-val :lambda-list '(m))
(cl:defmethod color_target-val ((m <Detections>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader actor_person_following-msg:color_target-val is deprecated.  Use actor_person_following-msg:color_target instead.")
  (color_target m))

(cl:ensure-generic-function 'xres-val :lambda-list '(m))
(cl:defmethod xres-val ((m <Detections>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader actor_person_following-msg:xres-val is deprecated.  Use actor_person_following-msg:xres instead.")
  (xres m))

(cl:ensure-generic-function 'yres-val :lambda-list '(m))
(cl:defmethod yres-val ((m <Detections>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader actor_person_following-msg:yres-val is deprecated.  Use actor_person_following-msg:yres instead.")
  (yres m))

(cl:ensure-generic-function 'aruco_visible-val :lambda-list '(m))
(cl:defmethod aruco_visible-val ((m <Detections>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader actor_person_following-msg:aruco_visible-val is deprecated.  Use actor_person_following-msg:aruco_visible instead.")
  (aruco_visible m))

(cl:ensure-generic-function 'aruco_x-val :lambda-list '(m))
(cl:defmethod aruco_x-val ((m <Detections>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader actor_person_following-msg:aruco_x-val is deprecated.  Use actor_person_following-msg:aruco_x instead.")
  (aruco_x m))

(cl:ensure-generic-function 'aruco_y-val :lambda-list '(m))
(cl:defmethod aruco_y-val ((m <Detections>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader actor_person_following-msg:aruco_y-val is deprecated.  Use actor_person_following-msg:aruco_y instead.")
  (aruco_y m))

(cl:ensure-generic-function 'aruco_points-val :lambda-list '(m))
(cl:defmethod aruco_points-val ((m <Detections>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader actor_person_following-msg:aruco_points-val is deprecated.  Use actor_person_following-msg:aruco_points instead.")
  (aruco_points m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Detections>) ostream)
  "Serializes a message object of type '<Detections>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'image_header) ostream)
  (cl:let* ((signed (cl:slot-value msg 'num_detects)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'detections))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'detections))
  (cl:let* ((signed (cl:slot-value msg 'closest)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'close_target)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'aruco_target)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'color_target)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'xres)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'yres)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'aruco_visible) 1 0)) ostream)
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'aruco_x))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'aruco_y))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'aruco_points))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'aruco_points))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Detections>) istream)
  "Deserializes a message object of type '<Detections>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'image_header) istream)
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'num_detects) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'detections) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'detections)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'actor_person_following-msg:Detection))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'closest) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'close_target) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'aruco_target) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'color_target) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'xres) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'yres) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:setf (cl:slot-value msg 'aruco_visible) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'aruco_x) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'aruco_y) (roslisp-utils:decode-double-float-bits bits)))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'aruco_points) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'aruco_points)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'perception_msgs-msg:PointInImage))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Detections>)))
  "Returns string type for a message object of type '<Detections>"
  "actor_person_following/Detections")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Detections)))
  "Returns string type for a message object of type 'Detections"
  "actor_person_following/Detections")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Detections>)))
  "Returns md5sum for a message object of type '<Detections>"
  "60fd021630dd3b6e37263ed4dd63f0e0")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Detections)))
  "Returns md5sum for a message object of type 'Detections"
  "60fd021630dd3b6e37263ed4dd63f0e0")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Detections>)))
  "Returns full string definition for message of type '<Detections>"
  (cl:format cl:nil "Header header~%Header image_header~%int32 num_detects~%Detection[] detections~%~%int32 closest~%int32 close_target~%int32 aruco_target~%int32 color_target~%~%int32 xres~%int32 yres~%~%bool aruco_visible~%float64 aruco_x~%float64 aruco_y~%perception_msgs/PointInImage[] aruco_points~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%================================================================================~%MSG: actor_person_following/Detection~%float64 width~%float64 height~%float64 center~%~%float64 close_overlap~%float64 aruco_overlap~%~%float64 close_dist~%float64 aruco_dist~%~%float64 aruco_strength~%~%float32 r~%float32 g~%float32 b~%~%darknet_ros_msgs/BoundingBox box~%~%================================================================================~%MSG: darknet_ros_msgs/BoundingBox~%float64 probability~%int64 xmin~%int64 ymin~%int64 xmax~%int64 ymax~%int16 id~%string Class~%~%================================================================================~%MSG: perception_msgs/PointInImage~%# x coordinate of the point in the image~%float32 x~%# y coordinate of the poitn in the image~%float32 y~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Detections)))
  "Returns full string definition for message of type 'Detections"
  (cl:format cl:nil "Header header~%Header image_header~%int32 num_detects~%Detection[] detections~%~%int32 closest~%int32 close_target~%int32 aruco_target~%int32 color_target~%~%int32 xres~%int32 yres~%~%bool aruco_visible~%float64 aruco_x~%float64 aruco_y~%perception_msgs/PointInImage[] aruco_points~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%================================================================================~%MSG: actor_person_following/Detection~%float64 width~%float64 height~%float64 center~%~%float64 close_overlap~%float64 aruco_overlap~%~%float64 close_dist~%float64 aruco_dist~%~%float64 aruco_strength~%~%float32 r~%float32 g~%float32 b~%~%darknet_ros_msgs/BoundingBox box~%~%================================================================================~%MSG: darknet_ros_msgs/BoundingBox~%float64 probability~%int64 xmin~%int64 ymin~%int64 xmax~%int64 ymax~%int16 id~%string Class~%~%================================================================================~%MSG: perception_msgs/PointInImage~%# x coordinate of the point in the image~%float32 x~%# y coordinate of the poitn in the image~%float32 y~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Detections>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'image_header))
     4
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'detections) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
     4
     4
     4
     4
     4
     4
     1
     8
     8
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'aruco_points) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Detections>))
  "Converts a ROS message object to a list"
  (cl:list 'Detections
    (cl:cons ':header (header msg))
    (cl:cons ':image_header (image_header msg))
    (cl:cons ':num_detects (num_detects msg))
    (cl:cons ':detections (detections msg))
    (cl:cons ':closest (closest msg))
    (cl:cons ':close_target (close_target msg))
    (cl:cons ':aruco_target (aruco_target msg))
    (cl:cons ':color_target (color_target msg))
    (cl:cons ':xres (xres msg))
    (cl:cons ':yres (yres msg))
    (cl:cons ':aruco_visible (aruco_visible msg))
    (cl:cons ':aruco_x (aruco_x msg))
    (cl:cons ':aruco_y (aruco_y msg))
    (cl:cons ':aruco_points (aruco_points msg))
))
