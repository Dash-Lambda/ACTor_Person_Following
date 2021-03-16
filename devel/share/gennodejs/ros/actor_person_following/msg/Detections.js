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

//-----------------------------------------------------------

class Detections {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.num_detects = null;
      this.closest = null;
      this.detections = null;
      this.xres = null;
      this.yres = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('num_detects')) {
        this.num_detects = initObj.num_detects
      }
      else {
        this.num_detects = 0;
      }
      if (initObj.hasOwnProperty('closest')) {
        this.closest = initObj.closest
      }
      else {
        this.closest = 0;
      }
      if (initObj.hasOwnProperty('detections')) {
        this.detections = initObj.detections
      }
      else {
        this.detections = [];
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
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type Detections
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [num_detects]
    bufferOffset = _serializer.int32(obj.num_detects, buffer, bufferOffset);
    // Serialize message field [closest]
    bufferOffset = _serializer.int32(obj.closest, buffer, bufferOffset);
    // Serialize message field [detections]
    // Serialize the length for message field [detections]
    bufferOffset = _serializer.uint32(obj.detections.length, buffer, bufferOffset);
    obj.detections.forEach((val) => {
      bufferOffset = Detection.serialize(val, buffer, bufferOffset);
    });
    // Serialize message field [xres]
    bufferOffset = _serializer.int32(obj.xres, buffer, bufferOffset);
    // Serialize message field [yres]
    bufferOffset = _serializer.int32(obj.yres, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type Detections
    let len;
    let data = new Detections(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [num_detects]
    data.num_detects = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [closest]
    data.closest = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [detections]
    // Deserialize array length for message field [detections]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.detections = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.detections[i] = Detection.deserialize(buffer, bufferOffset)
    }
    // Deserialize message field [xres]
    data.xres = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [yres]
    data.yres = _deserializer.int32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    length += 36 * object.detections.length;
    return length + 20;
  }

  static datatype() {
    // Returns string type for a message object
    return 'actor_person_following/Detections';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '0650002a922808155cc9f3d500ee9e38';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    Header header
    int32 num_detects
    int32 closest
    Detection[] detections
    
    int32 xres
    int32 yres
    
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
    MSG: actor_person_following/Detection
    float64 width
    float64 height
    float64 center
    
    float32 r
    float32 g
    float32 b
    
    
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

    if (msg.num_detects !== undefined) {
      resolved.num_detects = msg.num_detects;
    }
    else {
      resolved.num_detects = 0
    }

    if (msg.closest !== undefined) {
      resolved.closest = msg.closest;
    }
    else {
      resolved.closest = 0
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

    return resolved;
    }
};

module.exports = Detections;
