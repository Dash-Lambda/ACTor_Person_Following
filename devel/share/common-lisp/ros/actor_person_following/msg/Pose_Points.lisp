; Auto-generated. Do not edit!


(cl:in-package actor_person_following-msg)


;//! \htmlinclude Pose_Points.msg.html

(cl:defclass <Pose_Points> (roslisp-msg-protocol:ros-message)
  ((points
    :reader points
    :initarg :points
    :type (cl:vector actor_person_following-msg:Pose_Point)
   :initform (cl:make-array 0 :element-type 'actor_person_following-msg:Pose_Point :initial-element (cl:make-instance 'actor_person_following-msg:Pose_Point))))
)

(cl:defclass Pose_Points (<Pose_Points>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Pose_Points>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Pose_Points)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name actor_person_following-msg:<Pose_Points> is deprecated: use actor_person_following-msg:Pose_Points instead.")))

(cl:ensure-generic-function 'points-val :lambda-list '(m))
(cl:defmethod points-val ((m <Pose_Points>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader actor_person_following-msg:points-val is deprecated.  Use actor_person_following-msg:points instead.")
  (points m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Pose_Points>) ostream)
  "Serializes a message object of type '<Pose_Points>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'points))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'points))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Pose_Points>) istream)
  "Deserializes a message object of type '<Pose_Points>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'points) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'points)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'actor_person_following-msg:Pose_Point))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Pose_Points>)))
  "Returns string type for a message object of type '<Pose_Points>"
  "actor_person_following/Pose_Points")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Pose_Points)))
  "Returns string type for a message object of type 'Pose_Points"
  "actor_person_following/Pose_Points")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Pose_Points>)))
  "Returns md5sum for a message object of type '<Pose_Points>"
  "08d73549e8366bc185d5053c1785ddc0")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Pose_Points)))
  "Returns md5sum for a message object of type 'Pose_Points"
  "08d73549e8366bc185d5053c1785ddc0")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Pose_Points>)))
  "Returns full string definition for message of type '<Pose_Points>"
  (cl:format cl:nil "actor_person_following/Pose_Point[] points~%~%================================================================================~%MSG: actor_person_following/Pose_Point~%float64 x~%float64 y~%int32 frame_x~%int32 frame_y~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Pose_Points)))
  "Returns full string definition for message of type 'Pose_Points"
  (cl:format cl:nil "actor_person_following/Pose_Point[] points~%~%================================================================================~%MSG: actor_person_following/Pose_Point~%float64 x~%float64 y~%int32 frame_x~%int32 frame_y~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Pose_Points>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'points) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Pose_Points>))
  "Converts a ROS message object to a list"
  (cl:list 'Pose_Points
    (cl:cons ':points (points msg))
))
