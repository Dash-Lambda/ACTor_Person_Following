;; Auto-generated. Do not edit!


(when (boundp 'actor_person_following::Detection)
  (if (not (find-package "ACTOR_PERSON_FOLLOWING"))
    (make-package "ACTOR_PERSON_FOLLOWING"))
  (shadow 'Detection (find-package "ACTOR_PERSON_FOLLOWING")))
(unless (find-package "ACTOR_PERSON_FOLLOWING::DETECTION")
  (make-package "ACTOR_PERSON_FOLLOWING::DETECTION"))

(in-package "ROS")
;;//! \htmlinclude Detection.msg.html


(defclass actor_person_following::Detection
  :super ros::object
  :slots (_width _height _center _r _g _b ))

(defmethod actor_person_following::Detection
  (:init
   (&key
    ((:width __width) 0.0)
    ((:height __height) 0.0)
    ((:center __center) 0.0)
    ((:r __r) 0.0)
    ((:g __g) 0.0)
    ((:b __b) 0.0)
    )
   (send-super :init)
   (setq _width (float __width))
   (setq _height (float __height))
   (setq _center (float __center))
   (setq _r (float __r))
   (setq _g (float __g))
   (setq _b (float __b))
   self)
  (:width
   (&optional __width)
   (if __width (setq _width __width)) _width)
  (:height
   (&optional __height)
   (if __height (setq _height __height)) _height)
  (:center
   (&optional __center)
   (if __center (setq _center __center)) _center)
  (:r
   (&optional __r)
   (if __r (setq _r __r)) _r)
  (:g
   (&optional __g)
   (if __g (setq _g __g)) _g)
  (:b
   (&optional __b)
   (if __b (setq _b __b)) _b)
  (:serialization-length
   ()
   (+
    ;; float64 _width
    8
    ;; float64 _height
    8
    ;; float64 _center
    8
    ;; float32 _r
    4
    ;; float32 _g
    4
    ;; float32 _b
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64 _width
       (sys::poke _width (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _height
       (sys::poke _height (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _center
       (sys::poke _center (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float32 _r
       (sys::poke _r (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _g
       (sys::poke _g (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _b
       (sys::poke _b (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64 _width
     (setq _width (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _height
     (setq _height (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _center
     (setq _center (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float32 _r
     (setq _r (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _g
     (setq _g (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _b
     (setq _b (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get actor_person_following::Detection :md5sum-) "f7a1a34da77d93e8a72f096cb0e7875c")
(setf (get actor_person_following::Detection :datatype-) "actor_person_following/Detection")
(setf (get actor_person_following::Detection :definition-)
      "float64 width
float64 height
float64 center

float32 r
float32 g
float32 b


")



(provide :actor_person_following/Detection "f7a1a34da77d93e8a72f096cb0e7875c")


