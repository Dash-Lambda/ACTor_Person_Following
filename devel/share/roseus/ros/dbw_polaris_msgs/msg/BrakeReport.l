;; Auto-generated. Do not edit!


(when (boundp 'dbw_polaris_msgs::BrakeReport)
  (if (not (find-package "DBW_POLARIS_MSGS"))
    (make-package "DBW_POLARIS_MSGS"))
  (shadow 'BrakeReport (find-package "DBW_POLARIS_MSGS")))
(unless (find-package "DBW_POLARIS_MSGS::BRAKEREPORT")
  (make-package "DBW_POLARIS_MSGS::BRAKEREPORT"))

(in-package "ROS")
;;//! \htmlinclude BrakeReport.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass dbw_polaris_msgs::BrakeReport
  :super ros::object
  :slots (_header _torque_input _torque_cmd _torque_output _enabled _override _driver _timeout _watchdog_counter _watchdog_braking _fault_wdc _fault_ch1 _fault_ch2 _fault_power ))

(defmethod dbw_polaris_msgs::BrakeReport
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:torque_input __torque_input) 0.0)
    ((:torque_cmd __torque_cmd) 0.0)
    ((:torque_output __torque_output) 0.0)
    ((:enabled __enabled) nil)
    ((:override __override) nil)
    ((:driver __driver) nil)
    ((:timeout __timeout) nil)
    ((:watchdog_counter __watchdog_counter) (instance dbw_polaris_msgs::WatchdogCounter :init))
    ((:watchdog_braking __watchdog_braking) nil)
    ((:fault_wdc __fault_wdc) nil)
    ((:fault_ch1 __fault_ch1) nil)
    ((:fault_ch2 __fault_ch2) nil)
    ((:fault_power __fault_power) nil)
    )
   (send-super :init)
   (setq _header __header)
   (setq _torque_input (float __torque_input))
   (setq _torque_cmd (float __torque_cmd))
   (setq _torque_output (float __torque_output))
   (setq _enabled __enabled)
   (setq _override __override)
   (setq _driver __driver)
   (setq _timeout __timeout)
   (setq _watchdog_counter __watchdog_counter)
   (setq _watchdog_braking __watchdog_braking)
   (setq _fault_wdc __fault_wdc)
   (setq _fault_ch1 __fault_ch1)
   (setq _fault_ch2 __fault_ch2)
   (setq _fault_power __fault_power)
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:torque_input
   (&optional __torque_input)
   (if __torque_input (setq _torque_input __torque_input)) _torque_input)
  (:torque_cmd
   (&optional __torque_cmd)
   (if __torque_cmd (setq _torque_cmd __torque_cmd)) _torque_cmd)
  (:torque_output
   (&optional __torque_output)
   (if __torque_output (setq _torque_output __torque_output)) _torque_output)
  (:enabled
   (&optional (__enabled :null))
   (if (not (eq __enabled :null)) (setq _enabled __enabled)) _enabled)
  (:override
   (&optional (__override :null))
   (if (not (eq __override :null)) (setq _override __override)) _override)
  (:driver
   (&optional (__driver :null))
   (if (not (eq __driver :null)) (setq _driver __driver)) _driver)
  (:timeout
   (&optional (__timeout :null))
   (if (not (eq __timeout :null)) (setq _timeout __timeout)) _timeout)
  (:watchdog_counter
   (&rest __watchdog_counter)
   (if (keywordp (car __watchdog_counter))
       (send* _watchdog_counter __watchdog_counter)
     (progn
       (if __watchdog_counter (setq _watchdog_counter (car __watchdog_counter)))
       _watchdog_counter)))
  (:watchdog_braking
   (&optional (__watchdog_braking :null))
   (if (not (eq __watchdog_braking :null)) (setq _watchdog_braking __watchdog_braking)) _watchdog_braking)
  (:fault_wdc
   (&optional (__fault_wdc :null))
   (if (not (eq __fault_wdc :null)) (setq _fault_wdc __fault_wdc)) _fault_wdc)
  (:fault_ch1
   (&optional (__fault_ch1 :null))
   (if (not (eq __fault_ch1 :null)) (setq _fault_ch1 __fault_ch1)) _fault_ch1)
  (:fault_ch2
   (&optional (__fault_ch2 :null))
   (if (not (eq __fault_ch2 :null)) (setq _fault_ch2 __fault_ch2)) _fault_ch2)
  (:fault_power
   (&optional (__fault_power :null))
   (if (not (eq __fault_power :null)) (setq _fault_power __fault_power)) _fault_power)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; float32 _torque_input
    4
    ;; float32 _torque_cmd
    4
    ;; float32 _torque_output
    4
    ;; bool _enabled
    1
    ;; bool _override
    1
    ;; bool _driver
    1
    ;; bool _timeout
    1
    ;; dbw_polaris_msgs/WatchdogCounter _watchdog_counter
    (send _watchdog_counter :serialization-length)
    ;; bool _watchdog_braking
    1
    ;; bool _fault_wdc
    1
    ;; bool _fault_ch1
    1
    ;; bool _fault_ch2
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
     ;; float32 _torque_input
       (sys::poke _torque_input (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _torque_cmd
       (sys::poke _torque_cmd (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _torque_output
       (sys::poke _torque_output (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; bool _enabled
       (if _enabled (write-byte -1 s) (write-byte 0 s))
     ;; bool _override
       (if _override (write-byte -1 s) (write-byte 0 s))
     ;; bool _driver
       (if _driver (write-byte -1 s) (write-byte 0 s))
     ;; bool _timeout
       (if _timeout (write-byte -1 s) (write-byte 0 s))
     ;; dbw_polaris_msgs/WatchdogCounter _watchdog_counter
       (send _watchdog_counter :serialize s)
     ;; bool _watchdog_braking
       (if _watchdog_braking (write-byte -1 s) (write-byte 0 s))
     ;; bool _fault_wdc
       (if _fault_wdc (write-byte -1 s) (write-byte 0 s))
     ;; bool _fault_ch1
       (if _fault_ch1 (write-byte -1 s) (write-byte 0 s))
     ;; bool _fault_ch2
       (if _fault_ch2 (write-byte -1 s) (write-byte 0 s))
     ;; bool _fault_power
       (if _fault_power (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; float32 _torque_input
     (setq _torque_input (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _torque_cmd
     (setq _torque_cmd (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _torque_output
     (setq _torque_output (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; bool _enabled
     (setq _enabled (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; bool _override
     (setq _override (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; bool _driver
     (setq _driver (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; bool _timeout
     (setq _timeout (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; dbw_polaris_msgs/WatchdogCounter _watchdog_counter
     (send _watchdog_counter :deserialize buf ptr-) (incf ptr- (send _watchdog_counter :serialization-length))
   ;; bool _watchdog_braking
     (setq _watchdog_braking (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; bool _fault_wdc
     (setq _fault_wdc (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; bool _fault_ch1
     (setq _fault_ch1 (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; bool _fault_ch2
     (setq _fault_ch2 (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; bool _fault_power
     (setq _fault_power (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(setf (get dbw_polaris_msgs::BrakeReport :md5sum-) "8fcdb23643ffb06de372fe999ba6e238")
(setf (get dbw_polaris_msgs::BrakeReport :datatype-) "dbw_polaris_msgs/BrakeReport")
(setf (get dbw_polaris_msgs::BrakeReport :definition-)
      "Header header

# Braking torque (Nm)
float32 torque_input
float32 torque_cmd
float32 torque_output

# Status
bool enabled  # Enabled
bool override # Driver override
bool driver   # Driver activity
bool timeout  # Command timeout

# Watchdog Counter
WatchdogCounter watchdog_counter
bool watchdog_braking
bool fault_wdc

# Faults
bool fault_ch1
bool fault_ch2
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

================================================================================
MSG: dbw_polaris_msgs/WatchdogCounter
uint8 source

uint8 NONE=0               # No source for watchdog counter fault
uint8 OTHER_BRAKE=1        # Fault determined by brake controller
uint8 OTHER_THROTTLE=2     # Fault determined by throttle controller
uint8 OTHER_STEERING=3     # Fault determined by steering controller
uint8 BRAKE_COUNTER=4      # Brake command counter failed to increment
uint8 BRAKE_DISABLED=5     # Brake transition to disabled while in gear or moving
uint8 BRAKE_COMMAND=6      # Brake command timeout after 100ms
uint8 BRAKE_REPORT=7       # Brake report timeout after 100ms
uint8 THROTTLE_COUNTER=8   # Throttle command counter failed to increment
uint8 THROTTLE_DISABLED=9  # Throttle transition to disabled while in gear or moving
uint8 THROTTLE_COMMAND=10  # Throttle command timeout after 100ms
uint8 THROTTLE_REPORT=11   # Throttle report timeout after 100ms
uint8 STEERING_COUNTER=12  # Steering command counter failed to increment
uint8 STEERING_DISABLED=13 # Steering transition to disabled while in gear or moving
uint8 STEERING_COMMAND=14  # Steering command timeout after 100ms
uint8 STEERING_REPORT=15   # Steering report timeout after 100ms

")



(provide :dbw_polaris_msgs/BrakeReport "8fcdb23643ffb06de372fe999ba6e238")


