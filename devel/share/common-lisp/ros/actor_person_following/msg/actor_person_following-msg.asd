
(cl:in-package :asdf)

(defsystem "actor_person_following-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :darknet_ros_msgs-msg
               :perception_msgs-msg
               :sensor_msgs-msg
               :std_msgs-msg
)
  :components ((:file "_package")
    (:file "Detection" :depends-on ("_package_Detection"))
    (:file "_package_Detection" :depends-on ("_package"))
    (:file "Detections" :depends-on ("_package_Detections"))
    (:file "_package_Detections" :depends-on ("_package"))
    (:file "Lidar_Point" :depends-on ("_package_Lidar_Point"))
    (:file "_package_Lidar_Point" :depends-on ("_package"))
    (:file "Lidar_Points" :depends-on ("_package_Lidar_Points"))
    (:file "_package_Lidar_Points" :depends-on ("_package"))
    (:file "Pose_Point" :depends-on ("_package_Pose_Point"))
    (:file "_package_Pose_Point" :depends-on ("_package"))
    (:file "Pose_Points" :depends-on ("_package_Pose_Points"))
    (:file "_package_Pose_Points" :depends-on ("_package"))
  ))