// Auto-generated. Do not edit!

// (in-package actor_person_following.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let Detection = require('./Detection.js');
let std_msgs = _finder('std_msgs');
let sensor_msgs = _finder('sensor_msgs');
let perception_msgs = _finder('perception_msgs');

//-----------------------------------------------------------

class Detections {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.image_header = null;
      this.image = null;
      this.num_detects = null;
      this.detections = null;
      this.closest = null;
      this.close_target = null;
      this.aruco_target = null;
      this.color_target = null;
      this.xres = null;
      this.yres = null;
      this.aruco_visible = null;
      this.aruco_x = null;
      this.aruco_y = null;
      this.aruco_points = null;
      this.start = null;
      this.stop = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('image_header')) {
        this.image_header = initObj.image_header
      }
      else {
        this.image_header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('image')) {
        this.image = initObj.image
      }
      else {
        this.image = new sensor_msgs.msg.Image();
      }
      if (initObj.hasOwnProperty('num_detects')) {
        this.num_detects = initObj.num_detects
      }
      else {
        this.num_detects = 0;
      }
      if (initObj.hasOwnProperty('detections')) {
        this.detections = initObj.detections
      }
      else {
        this.detections = [];
      }
      if (initObj.hasOwnProperty('closest')) {
        this.closest = initObj.closest
      }
      else {
        this.closest = 0;
      }
      if (initObj.hasOwnProperty('close_target')) {
        this.close_target = initObj.close_target
      }
      else {
        this.close_target = 0;
      }
      if (initObj.hasOwnProperty('aruco_target')) {
        this.aruco_target = initObj.aruco_target
      }
      else {
        this.aruco_target = 0;
      }
      if (initObj.hasOwnProperty('color_target')) {
        this.color_target = initObj.color_target
      }
      else {
        this.color_target = 0;
      }
      if (initObj.hasOwnProperty('xres')) {
        this.xres = initObj.xres
      }
      else {
        this.xres = 0;
      }
      if (initObj.hasOwnProperty('yres')) {
        this.yres = initObj.yres
      }
      else {
        this.yres = 0;
      }
      if (initObj.hasOwnProperty('aruco_visible')) {
        this.aruco_visible = initObj.aruco_visible
      }
      else {
        this.aruco_visible = false;
      }
      if (initObj.hasOwnProperty('aruco_x')) {
        this.aruco_x = initObj.aruco_x
      }
      else {
        this.aruco_x = 0.0;
      }
      if (initObj.hasOwnProperty('aruco_y')) {
        this.aruco_y = initObj.aruco_y
      }
      else {
        this.aruco_y = 0.0;
      }
      if (initObj.hasOwnProperty('aruco_points')) {
        this.aruco_points = initObj.aruco_points
      }
      else {
        this.aruco_points = [];
      }
      if (initObj.hasOwnProperty('start')) {
        this.start = initObj.start
      }
      else {
        this.start = false;
      }
      if (initObj.hasOwnProperty('stop')) {
        this.stop = initObj.stop
      }
      else {
        this.stop = false;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type Detections
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [image_header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.image_header, buffer, bufferOffset);
    // Serialize message field [image]
    bufferOffset = sensor_msgs.msg.Image.serialize(obj.image, buffer, bufferOffset);
    // Serialize message field [num_detects]
    bufferOffset = _serializer.int32(obj.num_detects, buffer, bufferOffset);
    // Serialize message field [detections]
    // Serialize the length for message field [detections]
    bufferOffset = _serializer.uint32(obj.detections.length, buffer, bufferOffset);
    obj.detections.forEach((val) => {
      bufferOffset = Detection.serialize(val, buffer, bufferOffset);
    });
    // Serialize message field [closest]
    bufferOffset = _serializer.int32(obj.closest, buffer, bufferOffset);
    // Serialize message field [close_target]
    bufferOffset = _serializer.int32(obj.close_target, buffer, bufferOffset);
    // Serialize message field [aruco_target]
    bufferOffset = _serializer.int32(obj.aruco_target, buffer, bufferOffset);
    // Serialize message field [color_target]
    bufferOffset = _serializer.int32(obj.color_target, buffer, bufferOffset);
    // Serialize message field [xres]
    bufferOffset = _serializer.int32(obj.xres, buffer, bufferOffset);
    // Serialize message field [yres]
    bufferOffset = _serializer.int32(obj.yres, buffer, bufferOffset);
    // Serialize message field [aruco_visible]
    bufferOffset = _serializer.bool(obj.aruco_visible, buffer, bufferOffset);
    // Serialize message field [aruco_x]
    bufferOffset = _serializer.float64(obj.aruco_x, buffer, bufferOffset);
    // Serialize message field [aruco_y]
    bufferOffset = _serializer.float64(obj.aruco_y, buffer, bufferOffset);
    // Serialize message field [aruco_points]
    // Serialize the length for message field [aruco_points]
    bufferOffset = _serializer.uint32(obj.aruco_points.length, buffer, bufferOffset);
    obj.aruco_points.forEach((val) => {
      bufferOffset = perception_msgs.msg.PointInImage.serialize(val, buffer, bufferOffset);
    });
    // Serialize message field [start]
    bufferOffset = _serializer.bool(obj.start, buffer, bufferOffset);
    // Serialize message field [stop]
    bufferOffset = _serializer.bool(obj.stop, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type Detections
    let len;
    let data = new Detections(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [image_header]
    data.image_header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [image]
    data.image = sensor_msgs.msg.Image.deserialize(buffer, bufferOffset);
    // Deserialize message field [num_detects]
    data.num_detects = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [detections]
    // Deserialize array length for message field [detections]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.detections = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.detections[i] = Detection.deserialize(buffer, bufferOffset)
    }
    // Deserialize message field [closest]
    data.closest = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [close_target]
    data.close_target = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [aruco_target]
    data.aruco_target = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [color_target]
    data.color_target = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [xres]
    data.xres = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [yres]
    data.yres = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [aruco_visible]
    data.aruco_visible = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [aruco_x]
    data.aruco_x = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [aruco_y]
    data.aruco_y = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [aruco_points]
    // Deserialize array length for message field [aruco_points]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.aruco_points = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.aruco_points[i] = perception_msgs.msg.PointInImage.deserialize(buffer, bufferOffset)
    }
    // Deserialize message field [start]
    data.start = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [stop]
    data.stop = _deserializer.bool(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    length += std_msgs.msg.Header.getMessageSize(object.image_header);
    length += sensor_msgs.msg.Image.getMessageSize(object.image);
    object.detections.forEach((val) => {
      length += Detection.getMessageSize(val);
    });
    length += 8 * object.aruco_points.length;
    return length + 55;
  }

  static datatype() {
    // Returns string type for a message object
    return 'actor_person_following/Detections';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '89334e354050dfb15aacf14eca62859b';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    Header header
    Header image_header
    sensor_msgs/Image image
    int32 num_detects
    Detection[] detections
    
    int32 closest
    int32 close_target
    int32 aruco_target
    int32 color_target
    
    int32 xres
    int32 yres
    
    bool aruco_visible
    float64 aruco_x
    float64 aruco_y
    perception_msgs/PointInImage[] aruco_points
    
    bool start
    bool stop
    
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
    MSG: sensor_msgs/Image
    # This message contains an uncompressed image
    # (0, 0) is at top-left corner of image
    #
    
    Header header        # Header timestamp should be acquisition time of image
                         # Header frame_id should be optical frame of camera
                         # origin of frame should be optical center of camera
                         # +x should point to the right in the image
                         # +y should point down in the image
                         # +z should point into to plane of the image
                         # If the frame_id here and the frame_id of the CameraInfo
                         # message associated with the image conflict
                         # the behavior is undefined
    
    uint32 height         # image height, that is, number of rows
    uint32 width          # image width, that is, number of columns
    
    # The legal values for encoding are in file src/image_encodings.cpp
    # If you want to standardize a new string format, join
    # ros-users@lists.sourceforge.net and send an email proposing a new encoding.
    
    string encoding       # Encoding of pixels -- channel meaning, ordering, size
                          # taken from the list of strings in include/sensor_msgs/image_encodings.h
    
    uint8 is_bigendian    # is this data bigendian?
    uint32 step           # Full row length in bytes
    uint8[] data          # actual matrix data, size is (step * rows)
    
    ================================================================================
    MSG: actor_person_following/Detection
    float64 width
    float64 height
    float64 center
    
    float64 close_overlap
    float64 aruco_overlap
    
    float64 close_dist
    float64 aruco_dist
    
    float64 aruco_strength
    
    float32 r
    float32 g
    float32 b
    
    string gesture
    actor_person_following/Pose_Points pose_points
    
    darknet_ros_msgs/BoundingBox box
    actor_person_following/Lidar_Point lidar_point
    
    ================================================================================
    MSG: actor_person_following/Pose_Points
    actor_person_following/Pose_Point[] points
    
    ================================================================================
    MSG: actor_person_following/Pose_Point
    float64 x
    float64 y
    int32 frame_x
    int32 frame_y
    
    ================================================================================
    MSG: darknet_ros_msgs/BoundingBox
    float64 probability
    int64 xmin
    int64 ymin
    int64 xmax
    int64 ymax
    int16 id
    string Class
    
    ================================================================================
    MSG: actor_person_following/Lidar_Point
    float64 x
    float64 y
    float64 z
    
    float64 distance
    float64 pitch
    float64 yaw
    
    float64 frame_x
    float64 frame_y
    
    ================================================================================
    MSG: perception_msgs/PointInImage
    # x coordinate of the point in the image
    float32 x
    # y coordinate of the poitn in the image
    float32 y
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new Detections(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.image_header !== undefined) {
      resolved.image_header = std_msgs.msg.Header.Resolve(msg.image_header)
    }
    else {
      resolved.image_header = new std_msgs.msg.Header()
    }

    if (msg.image !== undefined) {
      resolved.image = sensor_msgs.msg.Image.Resolve(msg.image)
    }
    else {
      resolved.image = new sensor_msgs.msg.Image()
    }

    if (msg.num_detects !== undefined) {
      resolved.num_detects = msg.num_detects;
    }
    else {
      resolved.num_detects = 0
    }

    if (msg.detections !== undefined) {
      resolved.detections = new Array(msg.detections.length);
      for (let i = 0; i < resolved.detections.length; ++i) {
        resolved.detections[i] = Detection.Resolve(msg.detections[i]);
      }
    }
    else {
      resolved.detections = []
    }

    if (msg.closest !== undefined) {
      resolved.closest = msg.closest;
    }
    else {
      resolved.closest = 0
    }

    if (msg.close_target !== undefined) {
      resolved.close_target = msg.close_target;
    }
    else {
      resolved.close_target = 0
    }

    if (msg.aruco_target !== undefined) {
      resolved.aruco_target = msg.aruco_target;
    }
    else {
      resolved.aruco_target = 0
    }

    if (msg.color_target !== undefined) {
      resolved.color_target = msg.color_target;
    }
    else {
      resolved.color_target = 0
    }

    if (msg.xres !== undefined) {
      resolved.xres = msg.xres;
    }
    else {
      resolved.xres = 0
    }

    if (msg.yres !== undefined) {
      resolved.yres = msg.yres;
    }
    else {
      resolved.yres = 0
    }

    if (msg.aruco_visible !== undefined) {
      resolved.aruco_visible = msg.aruco_visible;
    }
    else {
      resolved.aruco_visible = false
    }

    if (msg.aruco_x !== undefined) {
      resolved.aruco_x = msg.aruco_x;
    }
    else {
      resolved.aruco_x = 0.0
    }

    if (msg.aruco_y !== undefined) {
      resolved.aruco_y = msg.aruco_y;
    }
    else {
      resolved.aruco_y = 0.0
    }

    if (msg.aruco_points !== undefined) {
      resolved.aruco_points = new Array(msg.aruco_points.length);
      for (let i = 0; i < resolved.aruco_points.length; ++i) {
        resolved.aruco_points[i] = perception_msgs.msg.PointInImage.Resolve(msg.aruco_points[i]);
      }
    }
    else {
      resolved.aruco_points = []
    }

    if (msg.start !== undefined) {
      resolved.start = msg.start;
    }
    else {
      resolved.start = false
    }

    if (msg.stop !== undefined) {
      resolved.stop = msg.stop;
    }
    else {
      resolved.stop = false
    }

    return resolved;
    }
};

module.exports = Detections;
