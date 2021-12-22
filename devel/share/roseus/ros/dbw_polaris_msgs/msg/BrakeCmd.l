;; Auto-generated. Do not edit!


(when (boundp 'dbw_polaris_msgs::BrakeCmd)
  (if (not (find-package "DBW_POLARIS_MSGS"))
    (make-package "DBW_POLARIS_MSGS"))
  (shadow 'BrakeCmd (find-package "DBW_POLARIS_MSGS")))
(unless (find-package "DBW_POLARIS_MSGS::BRAKECMD")
  (make-package "DBW_POLARIS_MSGS::BRAKECMD"))

(in-package "ROS")
;;//! \htmlinclude BrakeCmd.msg.html


(intern "*CMD_NONE*" (find-package "DBW_POLARIS_MSGS::BRAKECMD"))
(shadow '*CMD_NONE* (find-package "DBW_POLARIS_MSGS::BRAKECMD"))
(defconstant dbw_polaris_msgs::BrakeCmd::*CMD_NONE* 0)
(intern "*CMD_PERCENT*" (find-package "DBW_POLARIS_MSGS::BRAKECMD"))
(shadow '*CMD_PERCENT* (find-package "DBW_POLARIS_MSGS::BRAKECMD"))
(defconstant dbw_polaris_msgs::BrakeCmd::*CMD_PERCENT* 2)
(intern "*CMD_TORQUE*" (find-package "DBW_POLARIS_MSGS::BRAKECMD"))
(shadow '*CMD_TORQUE* (find-package "DBW_POLARIS_MSGS::BRAKECMD"))
(defconstant dbw_polaris_msgs::BrakeCmd::*CMD_TORQUE* 3)
(intern "*CMD_TORQUE_RQ*" (find-package "DBW_POLARIS_MSGS::BRAKECMD"))
(shadow '*CMD_TORQUE_RQ* (find-package "DBW_POLARIS_MSGS::BRAKECMD"))
(defconstant dbw_polaris_msgs::BrakeCmd::*CMD_TORQUE_RQ* 4)
(intern "*TORQUE_MAX*" (find-package "DBW_POLARIS_MSGS::BRAKECMD"))
(shadow '*TORQUE_MAX* (find-package "DBW_POLARIS_MSGS::BRAKECMD"))
(defconstant dbw_polaris_msgs::BrakeCmd::*TORQUE_MAX* 8000.0)

(defun dbw_polaris_msgs::BrakeCmd-to-symbol (const)
  (cond
        ((= const 0) 'dbw_polaris_msgs::BrakeCmd::*CMD_NONE*)
        ((= const 2) 'dbw_polaris_msgs::BrakeCmd::*CMD_PERCENT*)
        ((= const 3) 'dbw_polaris_msgs::BrakeCmd::*CMD_TORQUE*)
        ((= const 4) 'dbw_polaris_msgs::BrakeCmd::*CMD_TORQUE_RQ*)
        (t nil)))

(defclass dbw_polaris_msgs::BrakeCmd
  :super ros::object
  :slots (_pedal_cmd _pedal_cmd_type _enable _clear _ignore _count ))

(defmethod dbw_polaris_msgs::BrakeCmd
  (:init
   (&key
    ((:pedal_cmd __pedal_cmd) 0.0)
    ((:pedal_cmd_type __pedal_cmd_type) 0)
    ((:enable __enable) nil)
    ((:clear __clear) nil)
    ((:ignore __ignore) nil)
    ((:count __count) 0)
    )
   (send-super :init)
   (setq _pedal_cmd (float __pedal_cmd))
   (setq _pedal_cmd_type (round __pedal_cmd_type))
   (setq _enable __enable)
   (setq _clear __clear)
   (setq _ignore __ignore)
   (setq _count (round __count))
   self)
  (:pedal_cmd
   (&optional __pedal_cmd)
   (if __pedal_cmd (setq _pedal_cmd __pedal_cmd)) _pedal_cmd)
  (:pedal_cmd_type
   (&optional __pedal_cmd_type)
   (if __pedal_cmd_type (setq _pedal_cmd_type __pedal_cmd_type)) _pedal_cmd_type)
  (:enable
   (&optional (__enable :null))
   (if (not (eq __enable :null)) (setq _enable __enable)) _enable)
  (:clear
   (&optional (__clear :null))
   (if (not (eq __clear :null)) (setq _clear __clear)) _clear)
  (:ignore
   (&optional (__ignore :null))
   (if (not (eq __ignore :null)) (setq _ignore __ignore)) _ignore)
  (:count
   (&optional __count)
   (if __count (setq _count __count)) _count)
  (:serialization-length
   ()
   (+
    ;; float32 _pedal_cmd
    4
    ;; uint8 _pedal_cmd_type
    1
    ;; bool _enable
    1
    ;; bool _clear
    1
    ;; bool _ignore
    1
    ;; uint8 _count
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32 _pedal_cmd
       (sys::poke _pedal_cmd (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; uint8 _pedal_cmd_type
       (write-byte _pedal_cmd_type s)
     ;; bool _enable
       (if _enable (write-byte -1 s) (write-byte 0 s))
     ;; bool _clear
       (if _clear (write-byte -1 s) (write-byte 0 s))
     ;; bool _ignore
       (if _ignore (write-byte -1 s) (write-byte 0 s))
     ;; uint8 _count
       (write-byte _count s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32 _pedal_cmd
     (setq _pedal_cmd (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; uint8 _pedal_cmd_type
     (setq _pedal_cmd_type (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; bool _enable
     (setq _enable (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; bool _clear
     (setq _clear (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; bool _ignore
     (setq _ignore (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; uint8 _count
     (setq _count (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;;
   self)
  )

(setf (get dbw_polaris_msgs::BrakeCmd :md5sum-) "721f6879aa59a5ff6c620ca00e08bb53")
(setf (get dbw_polaris_msgs::BrakeCmd :datatype-) "dbw_polaris_msgs/BrakeCmd")
(setf (get dbw_polaris_msgs::BrakeCmd :definition-)
      "# Brake pedal
# Options defined below
float32 pedal_cmd
uint8 pedal_cmd_type

# Enable
bool enable

# Clear driver overrides
bool clear

# Ignore driver overrides
bool ignore

# Watchdog counter (optional)
uint8 count

uint8 CMD_NONE=0
uint8 CMD_PERCENT=2   # Percent of maximum torque, range 0 to 1
uint8 CMD_TORQUE=3    # Nm, range 0 to 8000, open-loop
uint8 CMD_TORQUE_RQ=4 # Nm, range 0 to 8000, closed-loop

float32 TORQUE_MAX=8000 # Nm, maximum torque

")



(provide :dbw_polaris_msgs/BrakeCmd "721f6879aa59a5ff6c620ca00e08bb53")


