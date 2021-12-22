// Auto-generated. Do not edit!

// (in-package actor_person_following.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class Pose_Point {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.x = null;
      this.y = null;
      this.frame_x = null;
      this.frame_y = null;
    }
    else {
      if (initObj.hasOwnProperty('x')) {
        this.x = initObj.x
      }
      else {
        this.x = 0.0;
      }
      if (initObj.hasOwnProperty('y')) {
        this.y = initObj.y
      }
      else {
        this.y = 0.0;
      }
      if (initObj.hasOwnProperty('frame_x')) {
        this.frame_x = initObj.frame_x
      }
      else {
        this.frame_x = 0;
      }
      if (initObj.hasOwnProperty('frame_y')) {
        this.frame_y = initObj.frame_y
      }
      else {
        this.frame_y = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type Pose_Point
    // Serialize message field [x]
    bufferOffset = _serializer.float64(obj.x, buffer, bufferOffset);
    // Serialize message field [y]
    bufferOffset = _serializer.float64(obj.y, buffer, bufferOffset);
    // Serialize message field [frame_x]
    bufferOffset = _serializer.int32(obj.frame_x, buffer, bufferOffset);
    // Serialize message field [frame_y]
    bufferOffset = _serializer.int32(obj.frame_y, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type Pose_Point
    let len;
    let data = new Pose_Point(null);
    // Deserialize message field [x]
    data.x = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [y]
    data.y = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [frame_x]
    data.frame_x = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [frame_y]
    data.frame_y = _deserializer.int32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 24;
  }

  static datatype() {
    // Returns string type for a message object
    return 'actor_person_following/Pose_Point';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'dfd463ee421cc1e9e1267153d3d5f543';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float64 x
    float64 y
    int32 frame_x
    int32 frame_y
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new Pose_Point(null);
    if (msg.x !== undefined) {
      resolved.x = msg.x;
    }
    else {
      resolved.x = 0.0
    }

    if (msg.y !== undefined) {
      resolved.y = msg.y;
    }
    else {
      resolved.y = 0.0
    }

    if (msg.frame_x !== undefined) {
      resolved.frame_x = msg.frame_x;
    }
    else {
      resolved.frame_x = 0
    }

    if (msg.frame_y !== undefined) {
      resolved.frame_y = msg.frame_y;
    }
    else {
      resolved.frame_y = 0
    }

    return resolved;
    }
};

module.exports = Pose_Point;
