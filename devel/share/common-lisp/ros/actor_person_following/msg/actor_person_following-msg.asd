
(cl:in-package :asdf)

(defsystem "actor_person_following-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :darknet_ros_msgs-msg
               :perception_msgs-msg
               :std_msgs-msg
)
  :components ((:file "_package")
    (:file "Detection" :depends-on ("_package_Detection"))
    (:file "_package_Detection" :depends-on ("_package"))
    (:file "Detections" :depends-on ("_package_Detections"))
    (:file "_package_Detections" :depends-on ("_package"))
  ))