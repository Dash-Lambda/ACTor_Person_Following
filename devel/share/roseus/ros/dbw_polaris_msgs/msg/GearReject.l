;; Auto-generated. Do not edit!


(when (boundp 'dbw_polaris_msgs::GearReject)
  (if (not (find-package "DBW_POLARIS_MSGS"))
    (make-package "DBW_POLARIS_MSGS"))
  (shadow 'GearReject (find-package "DBW_POLARIS_MSGS")))
(unless (find-package "DBW_POLARIS_MSGS::GEARREJECT")
  (make-package "DBW_POLARIS_MSGS::GEARREJECT"))

(in-package "ROS")
;;//! \htmlinclude GearReject.msg.html


(intern "*NONE*" (find-package "DBW_POLARIS_MSGS::GEARREJECT"))
(shadow '*NONE* (find-package "DBW_POLARIS_MSGS::GEARREJECT"))
(defconstant dbw_polaris_msgs::GearReject::*NONE* 0)
(intern "*SHIFT_IN_PROGRESS*" (find-package "DBW_POLARIS_MSGS::GEARREJECT"))
(shadow '*SHIFT_IN_PROGRESS* (find-package "DBW_POLARIS_MSGS::GEARREJECT"))
(defconstant dbw_polaris_msgs::GearReject::*SHIFT_IN_PROGRESS* 1)
(intern "*OVERRIDE*" (find-package "DBW_POLARIS_MSGS::GEARREJECT"))
(shadow '*OVERRIDE* (find-package "DBW_POLARIS_MSGS::GEARREJECT"))
(defconstant dbw_polaris_msgs::GearReject::*OVERRIDE* 2)
(intern "*NEUTRAL*" (find-package "DBW_POLARIS_MSGS::GEARREJECT"))
(shadow '*NEUTRAL* (find-package "DBW_POLARIS_MSGS::GEARREJECT"))
(defconstant dbw_polaris_msgs::GearReject::*NEUTRAL* 3)
(intern "*VEHICLE*" (find-package "DBW_POLARIS_MSGS::GEARREJECT"))
(shadow '*VEHICLE* (find-package "DBW_POLARIS_MSGS::GEARREJECT"))
(defconstant dbw_polaris_msgs::GearReject::*VEHICLE* 5)
(intern "*UNSUPPORTED*" (find-package "DBW_POLARIS_MSGS::GEARREJECT"))
(shadow '*UNSUPPORTED* (find-package "DBW_POLARIS_MSGS::GEARREJECT"))
(defconstant dbw_polaris_msgs::GearReject::*UNSUPPORTED* 6)
(intern "*FAULT*" (find-package "DBW_POLARIS_MSGS::GEARREJECT"))
(shadow '*FAULT* (find-package "DBW_POLARIS_MSGS::GEARREJECT"))
(defconstant dbw_polaris_msgs::GearReject::*FAULT* 7)

(defun dbw_polaris_msgs::GearReject-to-symbol (const)
  (cond
        ((= const 0) 'dbw_polaris_msgs::GearReject::*NONE*)
        ((= const 1) 'dbw_polaris_msgs::GearReject::*SHIFT_IN_PROGRESS*)
        ((= const 2) 'dbw_polaris_msgs::GearReject::*OVERRIDE*)
        ((= const 3) 'dbw_polaris_msgs::GearReject::*NEUTRAL*)
        ((= const 5) 'dbw_polaris_msgs::GearReject::*VEHICLE*)
        ((= const 6) 'dbw_polaris_msgs::GearReject::*UNSUPPORTED*)
        ((= const 7) 'dbw_polaris_msgs::GearReject::*FAULT*)
        (t nil)))

(defclass dbw_polaris_msgs::GearReject
  :super ros::object
  :slots (_value ))

(defmethod dbw_polaris_msgs::GearReject
  (:init
   (&key
    ((:value __value) 0)
    )
   (send-super :init)
   (setq _value (round __value))
   self)
  (:value
   (&optional __value)
   (if __value (setq _value __value)) _value)
  (:serialization-length
   ()
   (+
    ;; uint8 _value
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; uint8 _value
       (write-byte _value s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; uint8 _value
     (setq _value (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;;
   self)
  )

(setf (get dbw_polaris_msgs::GearReject :md5sum-) "247cfcc2ad89bbcb7f775b6b408f2121")
(setf (get dbw_polaris_msgs::GearReject :datatype-) "dbw_polaris_msgs/GearReject")
(setf (get dbw_polaris_msgs::GearReject :definition-)
      "uint8 value

uint8 NONE=0              # Not rejected
uint8 SHIFT_IN_PROGRESS=1 # Shift in progress
uint8 OVERRIDE=2          # Override on brake, throttle, or steering
uint8 NEUTRAL=3           # Manually shift to neutral before auto-shift
uint8 VEHICLE=5           # Rejected by vehicle (try pressing the brakes)
uint8 UNSUPPORTED=6       # Unsupported gear command
uint8 FAULT=7             # System in fault state

")



(provide :dbw_polaris_msgs/GearReject "247cfcc2ad89bbcb7f775b6b408f2121")


