// Auto-generated. Do not edit!

// (in-package dbw_polaris_msgs.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class GearReject {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.value = null;
    }
    else {
      if (initObj.hasOwnProperty('value')) {
        this.value = initObj.value
      }
      else {
        this.value = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type GearReject
    // Serialize message field [value]
    bufferOffset = _serializer.uint8(obj.value, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type GearReject
    let len;
    let data = new GearReject(null);
    // Deserialize message field [value]
    data.value = _deserializer.uint8(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 1;
  }

  static datatype() {
    // Returns string type for a message object
    return 'dbw_polaris_msgs/GearReject';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '247cfcc2ad89bbcb7f775b6b408f2121';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    uint8 value
    
    uint8 NONE=0              # Not rejected
    uint8 SHIFT_IN_PROGRESS=1 # Shift in progress
    uint8 OVERRIDE=2          # Override on brake, throttle, or steering
    uint8 NEUTRAL=3           # Manually shift to neutral before auto-shift
    uint8 VEHICLE=5           # Rejected by vehicle (try pressing the brakes)
    uint8 UNSUPPORTED=6       # Unsupported gear command
    uint8 FAULT=7             # System in fault state
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new GearReject(null);
    if (msg.value !== undefined) {
      resolved.value = msg.value;
    }
    else {
      resolved.value = 0
    }

    return resolved;
    }
};

// Constants for message
GearReject.Constants = {
  NONE: 0,
  SHIFT_IN_PROGRESS: 1,
  OVERRIDE: 2,
  NEUTRAL: 3,
  VEHICLE: 5,
  UNSUPPORTED: 6,
  FAULT: 7,
}

module.exports = GearReject;
