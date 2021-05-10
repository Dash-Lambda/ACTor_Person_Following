// Auto-generated. Do not edit!

// (in-package actor_person_following.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let darknet_ros_msgs = _finder('darknet_ros_msgs');

//-----------------------------------------------------------

class Detection {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.width = null;
      this.height = null;
      this.center = null;
      this.close_overlap = null;
      this.aruco_overlap = null;
      this.close_dist = null;
      this.aruco_dist = null;
      this.aruco_strength = null;
      this.r = null;
      this.g = null;
      this.b = null;
      this.box = null;
    }
    else {
      if (initObj.hasOwnProperty('width')) {
        this.width = initObj.width
      }
      else {
        this.width = 0.0;
      }
      if (initObj.hasOwnProperty('height')) {
        this.height = initObj.height
      }
      else {
        this.height = 0.0;
      }
      if (initObj.hasOwnProperty('center')) {
        this.center = initObj.center
      }
      else {
        this.center = 0.0;
      }
      if (initObj.hasOwnProperty('close_overlap')) {
        this.close_overlap = initObj.close_overlap
      }
      else {
        this.close_overlap = 0.0;
      }
      if (initObj.hasOwnProperty('aruco_overlap')) {
        this.aruco_overlap = initObj.aruco_overlap
      }
      else {
        this.aruco_overlap = 0.0;
      }
      if (initObj.hasOwnProperty('close_dist')) {
        this.close_dist = initObj.close_dist
      }
      else {
        this.close_dist = 0.0;
      }
      if (initObj.hasOwnProperty('aruco_dist')) {
        this.aruco_dist = initObj.aruco_dist
      }
      else {
        this.aruco_dist = 0.0;
      }
      if (initObj.hasOwnProperty('aruco_strength')) {
        this.aruco_strength = initObj.aruco_strength
      }
      else {
        this.aruco_strength = 0.0;
      }
      if (initObj.hasOwnProperty('r')) {
        this.r = initObj.r
      }
      else {
        this.r = 0.0;
      }
      if (initObj.hasOwnProperty('g')) {
        this.g = initObj.g
      }
      else {
        this.g = 0.0;
      }
      if (initObj.hasOwnProperty('b')) {
        this.b = initObj.b
      }
      else {
        this.b = 0.0;
      }
      if (initObj.hasOwnProperty('box')) {
        this.box = initObj.box
      }
      else {
        this.box = new darknet_ros_msgs.msg.BoundingBox();
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type Detection
    // Serialize message field [width]
    bufferOffset = _serializer.float64(obj.width, buffer, bufferOffset);
    // Serialize message field [height]
    bufferOffset = _serializer.float64(obj.height, buffer, bufferOffset);
    // Serialize message field [center]
    bufferOffset = _serializer.float64(obj.center, buffer, bufferOffset);
    // Serialize message field [close_overlap]
    bufferOffset = _serializer.float64(obj.close_overlap, buffer, bufferOffset);
    // Serialize message field [aruco_overlap]
    bufferOffset = _serializer.float64(obj.aruco_overlap, buffer, bufferOffset);
    // Serialize message field [close_dist]
    bufferOffset = _serializer.float64(obj.close_dist, buffer, bufferOffset);
    // Serialize message field [aruco_dist]
    bufferOffset = _serializer.float64(obj.aruco_dist, buffer, bufferOffset);
    // Serialize message field [aruco_strength]
    bufferOffset = _serializer.float64(obj.aruco_strength, buffer, bufferOffset);
    // Serialize message field [r]
    bufferOffset = _serializer.float32(obj.r, buffer, bufferOffset);
    // Serialize message field [g]
    bufferOffset = _serializer.float32(obj.g, buffer, bufferOffset);
    // Serialize message field [b]
    bufferOffset = _serializer.float32(obj.b, buffer, bufferOffset);
    // Serialize message field [box]
    bufferOffset = darknet_ros_msgs.msg.BoundingBox.serialize(obj.box, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type Detection
    let len;
    let data = new Detection(null);
    // Deserialize message field [width]
    data.width = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [height]
    data.height = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [center]
    data.center = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [close_overlap]
    data.close_overlap = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [aruco_overlap]
    data.aruco_overlap = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [close_dist]
    data.close_dist = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [aruco_dist]
    data.aruco_dist = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [aruco_strength]
    data.aruco_strength = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [r]
    data.r = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [g]
    data.g = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [b]
    data.b = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [box]
    data.box = darknet_ros_msgs.msg.BoundingBox.deserialize(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += darknet_ros_msgs.msg.BoundingBox.getMessageSize(object.box);
    return length + 76;
  }

  static datatype() {
    // Returns string type for a message object
    return 'actor_person_following/Detection';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'd6fc16488a4bcd596d1574f8093b6d85';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
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
    
    darknet_ros_msgs/BoundingBox box
    
    ================================================================================
    MSG: darknet_ros_msgs/BoundingBox
    float64 probability
    int64 xmin
    int64 ymin
    int64 xmax
    int64 ymax
    int16 id
    string Class
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new Detection(null);
    if (msg.width !== undefined) {
      resolved.width = msg.width;
    }
    else {
      resolved.width = 0.0
    }

    if (msg.height !== undefined) {
      resolved.height = msg.height;
    }
    else {
      resolved.height = 0.0
    }

    if (msg.center !== undefined) {
      resolved.center = msg.center;
    }
    else {
      resolved.center = 0.0
    }

    if (msg.close_overlap !== undefined) {
      resolved.close_overlap = msg.close_overlap;
    }
    else {
      resolved.close_overlap = 0.0
    }

    if (msg.aruco_overlap !== undefined) {
      resolved.aruco_overlap = msg.aruco_overlap;
    }
    else {
      resolved.aruco_overlap = 0.0
    }

    if (msg.close_dist !== undefined) {
      resolved.close_dist = msg.close_dist;
    }
    else {
      resolved.close_dist = 0.0
    }

    if (msg.aruco_dist !== undefined) {
      resolved.aruco_dist = msg.aruco_dist;
    }
    else {
      resolved.aruco_dist = 0.0
    }

    if (msg.aruco_strength !== undefined) {
      resolved.aruco_strength = msg.aruco_strength;
    }
    else {
      resolved.aruco_strength = 0.0
    }

    if (msg.r !== undefined) {
      resolved.r = msg.r;
    }
    else {
      resolved.r = 0.0
    }

    if (msg.g !== undefined) {
      resolved.g = msg.g;
    }
    else {
      resolved.g = 0.0
    }

    if (msg.b !== undefined) {
      resolved.b = msg.b;
    }
    else {
      resolved.b = 0.0
    }

    if (msg.box !== undefined) {
      resolved.box = darknet_ros_msgs.msg.BoundingBox.Resolve(msg.box)
    }
    else {
      resolved.box = new darknet_ros_msgs.msg.BoundingBox()
    }

    return resolved;
    }
};

module.exports = Detection;
