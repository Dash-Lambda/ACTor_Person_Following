; Auto-generated. Do not edit!


(cl:in-package actor_person_following-msg)


;//! \htmlinclude Pose_Point.msg.html

(cl:defclass <Pose_Point> (roslisp-msg-protocol:ros-message)
  ((x
    :reader x
    :initarg :x
    :type cl:float
    :initform 0.0)
   (y
    :reader y
    :initarg :y
    :type cl:float
    :initform 0.0)
   (frame_x
    :reader frame_x
    :initarg :frame_x
    :type cl:integer
    :initform 0)
   (frame_y
    :reader frame_y
    :initarg :frame_y
    :type cl:integer
    :initform 0))
)

(cl:defclass Pose_Point (<Pose_Point>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Pose_Point>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Pose_Point)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name actor_person_following-msg:<Pose_Point> is deprecated: use actor_person_following-msg:Pose_Point instead.")))

(cl:ensure-generic-function 'x-val :lambda-list '(m))
(cl:defmethod x-val ((m <Pose_Point>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader actor_person_following-msg:x-val is deprecated.  Use actor_person_following-msg:x instead.")
  (x m))

(cl:ensure-generic-function 'y-val :lambda-list '(m))
(cl:defmethod y-val ((m <Pose_Point>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader actor_person_following-msg:y-val is deprecated.  Use actor_person_following-msg:y instead.")
  (y m))

(cl:ensure-generic-function 'frame_x-val :lambda-list '(m))
(cl:defmethod frame_x-val ((m <Pose_Point>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader actor_person_following-msg:frame_x-val is deprecated.  Use actor_person_following-msg:frame_x instead.")
  (frame_x m))

(cl:ensure-generic-function 'frame_y-val :lambda-list '(m))
(cl:defmethod frame_y-val ((m <Pose_Point>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader actor_person_following-msg:frame_y-val is deprecated.  Use actor_person_following-msg:frame_y instead.")
  (frame_y m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Pose_Point>) ostream)
  "Serializes a message object of type '<Pose_Point>"
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'x))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'y))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let* ((signed (cl:slot-value msg 'frame_x)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'frame_y)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Pose_Point>) istream)
  "Deserializes a message object of type '<Pose_Point>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'x) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'y) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'frame_x) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'frame_y) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Pose_Point>)))
  "Returns string type for a message object of type '<Pose_Point>"
  "actor_person_following/Pose_Point")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Pose_Point)))
  "Returns string type for a message object of type 'Pose_Point"
  "actor_person_following/Pose_Point")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Pose_Point>)))
  "Returns md5sum for a message object of type '<Pose_Point>"
  "dfd463ee421cc1e9e1267153d3d5f543")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Pose_Point)))
  "Returns md5sum for a message object of type 'Pose_Point"
  "dfd463ee421cc1e9e1267153d3d5f543")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Pose_Point>)))
  "Returns full string definition for message of type '<Pose_Point>"
  (cl:format cl:nil "float64 x~%float64 y~%int32 frame_x~%int32 frame_y~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Pose_Point)))
  "Returns full string definition for message of type 'Pose_Point"
  (cl:format cl:nil "float64 x~%float64 y~%int32 frame_x~%int32 frame_y~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Pose_Point>))
  (cl:+ 0
     8
     8
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Pose_Point>))
  "Converts a ROS message object to a list"
  (cl:list 'Pose_Point
    (cl:cons ':x (x msg))
    (cl:cons ':y (y msg))
    (cl:cons ':frame_x (frame_x msg))
    (cl:cons ':frame_y (frame_y msg))
))
