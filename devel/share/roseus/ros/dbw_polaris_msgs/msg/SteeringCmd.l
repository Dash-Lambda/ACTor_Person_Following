;; Auto-generated. Do not edit!


(when (boundp 'dbw_polaris_msgs::SteeringCmd)
  (if (not (find-package "DBW_POLARIS_MSGS"))
    (make-package "DBW_POLARIS_MSGS"))
  (shadow 'SteeringCmd (find-package "DBW_POLARIS_MSGS")))
(unless (find-package "DBW_POLARIS_MSGS::STEERINGCMD")
  (make-package "DBW_POLARIS_MSGS::STEERINGCMD"))

(in-package "ROS")
;;//! \htmlinclude SteeringCmd.msg.html


(intern "*CMD_ANGLE*" (find-package "DBW_POLARIS_MSGS::STEERINGCMD"))
(shadow '*CMD_ANGLE* (find-package "DBW_POLARIS_MSGS::STEERINGCMD"))
(defconstant dbw_polaris_msgs::SteeringCmd::*CMD_ANGLE* 0)
(intern "*CMD_TORQUE*" (find-package "DBW_POLARIS_MSGS::STEERINGCMD"))
(shadow '*CMD_TORQUE* (find-package "DBW_POLARIS_MSGS::STEERINGCMD"))
(defconstant dbw_polaris_msgs::SteeringCmd::*CMD_TORQUE* 1)
(intern "*ANGLE_MAX*" (find-package "DBW_POLARIS_MSGS::STEERINGCMD"))
(shadow '*ANGLE_MAX* (find-package "DBW_POLARIS_MSGS::STEERINGCMD"))
(defconstant dbw_polaris_msgs::SteeringCmd::*ANGLE_MAX* 8.4)
(intern "*VELOCITY_MAX*" (find-package "DBW_POLARIS_MSGS::STEERINGCMD"))
(shadow '*VELOCITY_MAX* (find-package "DBW_POLARIS_MSGS::STEERINGCMD"))
(defconstant dbw_polaris_msgs::SteeringCmd::*VELOCITY_MAX* 17.5)
(intern "*TORQUE_MAX*" (find-package "DBW_POLARIS_MSGS::STEERINGCMD"))
(shadow '*TORQUE_MAX* (find-package "DBW_POLARIS_MSGS::STEERINGCMD"))
(defconstant dbw_polaris_msgs::SteeringCmd::*TORQUE_MAX* 60.0)
(defclass dbw_polaris_msgs::SteeringCmd
  :super ros::object
  :slots (_steering_wheel_angle_cmd _steering_wheel_angle_velocity _steering_wheel_torque_cmd _cmd_type _enable _clear _ignore _calibrate _quiet _count ))

(defmethod dbw_polaris_msgs::SteeringCmd
  (:init
   (&key
    ((:steering_wheel_angle_cmd __steering_wheel_angle_cmd) 0.0)
    ((:steering_wheel_angle_velocity __steering_wheel_angle_velocity) 0.0)
    ((:steering_wheel_torque_cmd __steering_wheel_torque_cmd) 0.0)
    ((:cmd_type __cmd_type) 0)
    ((:enable __enable) nil)
    ((:clear __clear) nil)
    ((:ignore __ignore) nil)
    ((:calibrate __calibrate) nil)
    ((:quiet __quiet) nil)
    ((:count __count) 0)
    )
   (send-super :init)
   (setq _steering_wheel_angle_cmd (float __steering_wheel_angle_cmd))
   (setq _steering_wheel_angle_velocity (float __steering_wheel_angle_velocity))
   (setq _steering_wheel_torque_cmd (float __steering_wheel_torque_cmd))
   (setq _cmd_type (round __cmd_type))
   (setq _enable __enable)
   (setq _clear __clear)
   (setq _ignore __ignore)
   (setq _calibrate __calibrate)
   (setq _quiet __quiet)
   (setq _count (round __count))
   self)
  (:steering_wheel_angle_cmd
   (&optional __steering_wheel_angle_cmd)
   (if __steering_wheel_angle_cmd (setq _steering_wheel_angle_cmd __steering_wheel_angle_cmd)) _steering_wheel_angle_cmd)
  (:steering_wheel_angle_velocity
   (&optional __steering_wheel_angle_velocity)
   (if __steering_wheel_angle_velocity (setq _steering_wheel_angle_velocity __steering_wheel_angle_velocity)) _steering_wheel_angle_velocity)
  (:steering_wheel_torque_cmd
   (&optional __steering_wheel_torque_cmd)
   (if __steering_wheel_torque_cmd (setq _steering_wheel_torque_cmd __steering_wheel_torque_cmd)) _steering_wheel_torque_cmd)
  (:cmd_type
   (&optional __cmd_type)
   (if __cmd_type (setq _cmd_type __cmd_type)) _cmd_type)
  (:enable
   (&optional __enable)
   (if __enable (setq _enable __enable)) _enable)
  (:clear
   (&optional __clear)
   (if __clear (setq _clear __clear)) _clear)
  (:ignore
   (&optional __ignore)
   (if __ignore (setq _ignore __ignore)) _ignore)
  (:calibrate
   (&optional __calibrate)
   (if __calibrate (setq _calibrate __calibrate)) _calibrate)
  (:quiet
   (&optional __quiet)
   (if __quiet (setq _quiet __quiet)) _quiet)
  (:count
   (&optional __count)
   (if __count (setq _count __count)) _count)
  (:serialization-length
   ()
   (+
    ;; float32 _steering_wheel_angle_cmd
    4
    ;; float32 _steering_wheel_angle_velocity
    4
    ;; float32 _steering_wheel_torque_cmd
    4
    ;; uint8 _cmd_type
    1
    ;; bool _enable
    1
    ;; bool _clear
    1
    ;; bool _ignore
    1
    ;; bool _calibrate
    1
    ;; bool _quiet
    1
    ;; uint8 _count
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32 _steering_wheel_angle_cmd
       (sys::poke _steering_wheel_angle_cmd (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _steering_wheel_angle_velocity
       (sys::poke _steering_wheel_angle_velocity (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _steering_wheel_torque_cmd
       (sys::poke _steering_wheel_torque_cmd (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; uint8 _cmd_type
       (write-byte _cmd_type s)
     ;; bool _enable
       (if _enable (write-byte -1 s) (write-byte 0 s))
     ;; bool _clear
       (if _clear (write-byte -1 s) (write-byte 0 s))
     ;; bool _ignore
       (if _ignore (write-byte -1 s) (write-byte 0 s))
     ;; bool _calibrate
       (if _calibrate (write-byte -1 s) (write-byte 0 s))
     ;; bool _quiet
       (if _quiet (write-byte -1 s) (write-byte 0 s))
     ;; uint8 _count
       (write-byte _count s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32 _steering_wheel_angle_cmd
     (setq _steering_wheel_angle_cmd (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _steering_wheel_angle_velocity
     (setq _steering_wheel_angle_velocity (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _steering_wheel_torque_cmd
     (setq _steering_wheel_torque_cmd (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; uint8 _cmd_type
     (setq _cmd_type (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; bool _enable
     (setq _enable (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; bool _clear
     (setq _clear (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; bool _ignore
     (setq _ignore (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; bool _calibrate
     (setq _calibrate (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; bool _quiet
     (setq _quiet (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; uint8 _count
     (setq _count (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;;
   self)
  )

(setf (get dbw_polaris_msgs::SteeringCmd :md5sum-) "db9f921f0c5966aa2ecb11628a300e0d")
(setf (get dbw_polaris_msgs::SteeringCmd :datatype-) "dbw_polaris_msgs/SteeringCmd")
(setf (get dbw_polaris_msgs::SteeringCmd :definition-)
      "# Steering Wheel
float32 steering_wheel_angle_cmd        # rad, range -8.4 to 8.4
float32 steering_wheel_angle_velocity   # rad/s, range 0 to 17.5, 0 = maximum
float32 steering_wheel_torque_cmd       # Nm, range -60.0 to 60.0
uint8 cmd_type

# Enable
bool enable

# Clear driver overrides
bool clear

# Ignore driver overrides
bool ignore

# Sets current steering wheel angle to value in steering_wheel_angle_cmd
bool calibrate

# Disable the driver override audible warning
bool quiet

# Watchdog counter (optional)
uint8 count

# Command types
uint8 CMD_ANGLE=0
uint8 CMD_TORQUE=1

# Maximum values
float32 ANGLE_MAX=8.4    # rad, maximum angle
float32 VELOCITY_MAX=17.5 # rad/s, maximum velocity
float32 TORQUE_MAX=60.0   # Nm, maximum torque

")



(provide :dbw_polaris_msgs/SteeringCmd "db9f921f0c5966aa2ecb11628a300e0d")


