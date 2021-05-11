
"use strict";

let BoundingBox = require('./BoundingBox.js');
let BoundingBoxes = require('./BoundingBoxes.js');
let ObjectCount = require('./ObjectCount.js');
let CheckForObjectsResult = require('./CheckForObjectsResult.js');
let CheckForObjectsActionResult = require('./CheckForObjectsActionResult.js');
let CheckForObjectsActionGoal = require('./CheckForObjectsActionGoal.js');
let CheckForObjectsFeedback = require('./CheckForObjectsFeedback.js');
let CheckForObjectsActionFeedback = require('./CheckForObjectsActionFeedback.js');
let CheckForObjectsGoal = require('./CheckForObjectsGoal.js');
let CheckForObjectsAction = require('./CheckForObjectsAction.js');

module.exports = {
  BoundingBox: BoundingBox,
  BoundingBoxes: BoundingBoxes,
  ObjectCount: ObjectCount,
  CheckForObjectsResult: CheckForObjectsResult,
  CheckForObjectsActionResult: CheckForObjectsActionResult,
  CheckForObjectsActionGoal: CheckForObjectsActionGoal,
  CheckForObjectsFeedback: CheckForObjectsFeedback,
  CheckForObjectsActionFeedback: CheckForObjectsActionFeedback,
  CheckForObjectsGoal: CheckForObjectsGoal,
  CheckForObjectsAction: CheckForObjectsAction,
};
