;; Auto-generated. Do not edit!


(when (boundp 'dbw_polaris_msgs::SteeringReport)
  (if (not (find-package "DBW_POLARIS_MSGS"))
    (make-package "DBW_POLARIS_MSGS"))
  (shadow 'SteeringReport (find-package "DBW_POLARIS_MSGS")))
(unless (find-package "DBW_POLARIS_MSGS::STEERINGREPORT")
  (make-package "DBW_POLARIS_MSGS::STEERINGREPORT"))

(in-package "ROS")
;;//! \htmlinclude SteeringReport.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(intern "*CMD_ANGLE*" (find-package "DBW_POLARIS_MSGS::STEERINGREPORT"))
(shadow '*CMD_ANGLE* (find-package "DBW_POLARIS_MSGS::STEERINGREPORT"))
(defconstant dbw_polaris_msgs::SteeringReport::*CMD_ANGLE* 0)
(intern "*CMD_TORQUE*" (find-package "DBW_POLARIS_MSGS::STEERINGREPORT"))
(shadow '*CMD_TORQUE* (find-package "DBW_POLARIS_MSGS::STEERINGREPORT"))
(defconstant dbw_polaris_msgs::SteeringReport::*CMD_TORQUE* 1)

(defun dbw_polaris_msgs::SteeringReport-to-symbol (const)
  (cond
        ((= const 0) 'dbw_polaris_msgs::SteeringReport::*CMD_ANGLE*)
        ((= const 1) 'dbw_polaris_msgs::SteeringReport::*CMD_TORQUE*)
        (t nil)))

(defclass dbw_polaris_msgs::SteeringReport
  :super ros::object
  :slots (_header _steering_wheel_angle _steering_wheel_cmd _steering_wheel_torque _steering_wheel_cmd_type _speed _enabled _override _timeout _fault_wdc _fault_bus1 _fault_bus2 _fault_calibration _fault_power ))

(defmethod dbw_polaris_msgs::SteeringReport
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:steering_wheel_angle __steering_wheel_angle) 0.0)
    ((:steering_wheel_cmd __steering_wheel_cmd) 0.0)
    ((:steering_wheel_torque __steering_wheel_torque) 0.0)
    ((:steering_wheel_cmd_type __steering_wheel_cmd_type) 0)
    ((:speed __speed) 0.0)
    ((:enabled __enabled) nil)
    ((:override __override) nil)
    ((:timeout __timeout) nil)
    ((:fault_wdc __fault_wdc) nil)
    ((:fault_bus1 __fault_bus1) nil)
    ((:fault_bus2 __fault_bus2) nil)
    ((:fault_calibration __fault_calibration) nil)
    ((:fault_power __fault_power) nil)
    )
   (send-super :init)
   (setq _header __header)
   (setq _steering_wheel_angle (float __steering_wheel_angle))
   (setq _steering_wheel_cmd (float __steering_wheel_cmd))
   (setq _steering_wheel_torque (float __steering_wheel_torque))
   (setq _steering_wheel_cmd_type (round __steering_wheel_cmd_type))
   (setq _speed (float __speed))
   (setq _enabled __enabled)
   (setq _override __override)
   (setq _timeout __timeout)
   (setq _fault_wdc __fault_wdc)
   (setq _fault_bus1 __fault_bus1)
   (setq _fault_bus2 __fault_bus2)
   (setq _fault_calibration __fault_calibration)
   (setq _fault_power __fault_power)
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:steering_wheel_angle
   (&optional __steering_wheel_angle)
   (if __steering_wheel_angle (setq _steering_wheel_angle __steering_wheel_angle)) _steering_wheel_angle)
  (:steering_wheel_cmd
   (&optional __steering_wheel_cmd)
   (if __steering_wheel_cmd (setq _steering_wheel_cmd __steering_wheel_cmd)) _steering_wheel_cmd)
  (:steering_wheel_torque
   (&optional __steering_wheel_torque)
   (if __steering_wheel_torque (setq _steering_wheel_torque __steering_wheel_torque)) _steering_wheel_torque)
  (:steering_wheel_cmd_type
   (&optional __steering_wheel_cmd_type)
   (if __steering_wheel_cmd_type (setq _steering_wheel_cmd_type __steering_wheel_cmd_type)) _steering_wheel_cmd_type)
  (:speed
   (&optional __speed)
   (if __speed (setq _speed __speed)) _speed)
  (:enabled
   (&optional (__enabled :null))
   (if (not (eq __enabled :null)) (setq _enabled __enabled)) _enabled)
  (:override
   (&optional (__override :null))
   (if (not (eq __override :null)) (setq _override __override)) _override)
  (:timeout
   (&optional (__timeout :null))
   (if (not (eq __timeout :null)) (setq _timeout __timeout)) _timeout)
  (:fault_wdc
   (&optional (__fault_wdc :null))
   (if (not (eq __fault_wdc :null)) (setq _fault_wdc __fault_wdc)) _fault_wdc)
  (:fault_bus1
   (&optional (__fault_bus1 :null))
   (if (not (eq __fault_bus1 :null)) (setq _fault_bus1 __fault_bus1)) _fault_bus1)
  (:fault_bus2
   (&optional (__fault_bus2 :null))
   (if (not (eq __fault_bus2 :null)) (setq _fault_bus2 __fault_bus2)) _fault_bus2)
  (:fault_calibration
   (&optional (__fault_calibration :null))
   (if (not (eq __fault_calibration :null)) (setq _fault_calibration __fault_calibration)) _fault_calibration)
  (:fault_power
   (&optional (__fault_power :null))
   (if (not (eq __fault_power :null)) (setq _fault_power __fault_power)) _fault_power)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; float32 _steering_wheel_angle
    4
    ;; float32 _steering_wheel_cmd
    4
    ;; float32 _steering_wheel_torque
    4
    ;; uint8 _steering_wheel_cmd_type
    1
    ;; float32 _speed
    4
    ;; bool _enabled
    1
    ;; bool _override
    1
    ;; bool _timeout
    1
    ;; bool _fault_wdc
    1
    ;; bool _fault_bus1
    1
    ;; bool _fault_bus2
    1
    ;; bool _fault_calibration
    1
    ;; bool _fault_power
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; float32 _steering_wheel_angle
       (sys::poke _steering_wheel_angle (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _steering_wheel_cmd
       (sys::poke _steering_wheel_cmd (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _steering_wheel_torque
       (sys::poke _steering_wheel_torque (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; uint8 _steering_wheel_cmd_type
       (write-byte _steering_wheel_cmd_type s)
     ;; float32 _speed
       (sys::poke _speed (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; bool _enabled
       (if _enabled (write-byte -1 s) (write-byte 0 s))
     ;; bool _override
       (if _override (write-byte -1 s) (write-byte 0 s))
     ;; bool _timeout
       (if _timeout (write-byte -1 s) (write-byte 0 s))
     ;; bool _fault_wdc
       (if _fault_wdc (write-byte -1 s) (write-byte 0 s))
     ;; bool _fault_bus1
       (if _fault_bus1 (write-byte -1 s) (write-byte 0 s))
     ;; bool _fault_bus2
       (if _fault_bus2 (write-byte -1 s) (write-byte 0 s))
     ;; bool _fault_calibration
       (if _fault_calibration (write-byte -1 s) (write-byte 0 s))
     ;; bool _fault_power
       (if _fault_power (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; float32 _steering_wheel_angle
     (setq _steering_wheel_angle (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _steering_wheel_cmd
     (setq _steering_wheel_cmd (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _steering_wheel_torque
     (setq _steering_wheel_torque (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; uint8 _steering_wheel_cmd_type
     (setq _steering_wheel_cmd_type (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; float32 _speed
     (setq _speed (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; bool _enabled
     (setq _enabled (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; bool _override
     (setq _override (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; bool _timeout
     (setq _timeout (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; bool _fault_wdc
     (setq _fault_wdc (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; bool _fault_bus1
     (setq _fault_bus1 (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; bool _fault_bus2
     (setq _fault_bus2 (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; bool _fault_calibration
     (setq _fault_calibration (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; bool _fault_power
     (setq _fault_power (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(setf (get dbw_polaris_msgs::SteeringReport :md5sum-) "d69c596b4b3137253a040eceaaa57690")
(setf (get dbw_polaris_msgs::SteeringReport :datatype-) "dbw_polaris_msgs/SteeringReport")
(setf (get dbw_polaris_msgs::SteeringReport :definition-)
      "Header header

# Steering Wheel
float32 steering_wheel_angle      # rad
float32 steering_wheel_cmd        # rad or Nm
float32 steering_wheel_torque     # Nm
uint8 steering_wheel_cmd_type

# Command types
uint8 CMD_ANGLE=0
uint8 CMD_TORQUE=1

# Vehicle Speed
float32 speed                     # m/s

# Status
bool enabled  # Enabled
bool override # Driver override
bool timeout  # Command timeout

# Watchdog Counter
bool fault_wdc

# Faults
bool fault_bus1
bool fault_bus2
bool fault_calibration
bool fault_power

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

")



(provide :dbw_polaris_msgs/SteeringReport "d69c596b4b3137253a040eceaaa57690")


