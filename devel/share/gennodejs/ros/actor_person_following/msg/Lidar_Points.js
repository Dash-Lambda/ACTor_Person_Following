// Auto-generated. Do not edit!

// (in-package actor_person_following.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let Lidar_Point = require('./Lidar_Point.js');
let std_msgs = _finder('std_msgs');

//-----------------------------------------------------------

class Lidar_Points {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.points = null;
      this.max_distance = null;
      this.xmin = null;
      this.xmax = null;
      this.ymin = null;
      this.ymax = null;
      this.zmin = null;
      this.zmax = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('points')) {
        this.points = initObj.points
      }
      else {
        this.points = [];
      }
      if (initObj.hasOwnProperty('max_distance')) {
        this.max_distance = initObj.max_distance
      }
      else {
        this.max_distance = 0.0;
      }
      if (initObj.hasOwnProperty('xmin')) {
        this.xmin = initObj.xmin
      }
      else {
        this.xmin = 0.0;
      }
      if (initObj.hasOwnProperty('xmax')) {
        this.xmax = initObj.xmax
      }
      else {
        this.xmax = 0.0;
      }
      if (initObj.hasOwnProperty('ymin')) {
        this.ymin = initObj.ymin
      }
      else {
        this.ymin = 0.0;
      }
      if (initObj.hasOwnProperty('ymax')) {
        this.ymax = initObj.ymax
      }
      else {
        this.ymax = 0.0;
      }
      if (initObj.hasOwnProperty('zmin')) {
        this.zmin = initObj.zmin
      }
      else {
        this.zmin = 0.0;
      }
      if (initObj.hasOwnProperty('zmax')) {
        this.zmax = initObj.zmax
      }
      else {
        this.zmax = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type Lidar_Points
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [points]
    // Serialize the length for message field [points]
    bufferOffset = _serializer.uint32(obj.points.length, buffer, bufferOffset);
    obj.points.forEach((val) => {
      bufferOffset = Lidar_Point.serialize(val, buffer, bufferOffset);
    });
    // Serialize message field [max_distance]
    bufferOffset = _serializer.float64(obj.max_distance, buffer, bufferOffset);
    // Serialize message field [xmin]
    bufferOffset = _serializer.float64(obj.xmin, buffer, bufferOffset);
    // Serialize message field [xmax]
    bufferOffset = _serializer.float64(obj.xmax, buffer, bufferOffset);
    // Serialize message field [ymin]
    bufferOffset = _serializer.float64(obj.ymin, buffer, bufferOffset);
    // Serialize message field [ymax]
    bufferOffset = _serializer.float64(obj.ymax, buffer, bufferOffset);
    // Serialize message field [zmin]
    bufferOffset = _serializer.float64(obj.zmin, buffer, bufferOffset);
    // Serialize message field [zmax]
    bufferOffset = _serializer.float64(obj.zmax, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type Lidar_Points
    let len;
    let data = new Lidar_Points(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [points]
    // Deserialize array length for message field [points]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.points = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.points[i] = Lidar_Point.deserialize(buffer, bufferOffset)
    }
    // Deserialize message field [max_distance]
    data.max_distance = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [xmin]
    data.xmin = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [xmax]
    data.xmax = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [ymin]
    data.ymin = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [ymax]
    data.ymax = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [zmin]
    data.zmin = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [zmax]
    data.zmax = _deserializer.float64(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    length += 64 * object.points.length;
    return length + 60;
  }

  static datatype() {
    // Returns string type for a message object
    return 'actor_person_following/Lidar_Points';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '07597cb25cd3fee3a74bcea7ddf36338';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    Header header
    Lidar_Point[] points
    
    float64 max_distance
    float64 xmin
    float64 xmax
    float64 ymin
    float64 ymax
    float64 zmin
    float64 zmax
    
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
    # 0: no frame
    # 1: global frame
    string frame_id
    
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
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new Lidar_Points(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.points !== undefined) {
      resolved.points = new Array(msg.points.length);
      for (let i = 0; i < resolved.points.length; ++i) {
        resolved.points[i] = Lidar_Point.Resolve(msg.points[i]);
      }
    }
    else {
      resolved.points = []
    }

    if (msg.max_distance !== undefined) {
      resolved.max_distance = msg.max_distance;
    }
    else {
      resolved.max_distance = 0.0
    }

    if (msg.xmin !== undefined) {
      resolved.xmin = msg.xmin;
    }
    else {
      resolved.xmin = 0.0
    }

    if (msg.xmax !== undefined) {
      resolved.xmax = msg.xmax;
    }
    else {
      resolved.xmax = 0.0
    }

    if (msg.ymin !== undefined) {
      resolved.ymin = msg.ymin;
    }
    else {
      resolved.ymin = 0.0
    }

    if (msg.ymax !== undefined) {
      resolved.ymax = msg.ymax;
    }
    else {
      resolved.ymax = 0.0
    }

    if (msg.zmin !== undefined) {
      resolved.zmin = msg.zmin;
    }
    else {
      resolved.zmin = 0.0
    }

    if (msg.zmax !== undefined) {
      resolved.zmax = msg.zmax;
    }
    else {
      resolved.zmax = 0.0
    }

    return resolved;
    }
};

module.exports = Lidar_Points;
