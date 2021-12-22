#!/usr/bin/env python3

import rospy
import sys
import math
import message_filters
import cv2
from darknet_ros_msgs.msg import BoundingBox, BoundingBoxes
from actor_person_following.msg import Detection, Detections, Lidar_Point, Lidar_Points, Pose_Point, Pose_Points
import sensor_msgs
from cv_bridge import CvBridge
import numpy as np
import time
from collections import deque

from pydarknet import Detector, Image
import gc

## Poser imports
from keras import models, layers, Sequential
from tensorflow.keras.utils import to_categorical
from keras.preprocessing import image as keras_image
from keras.preprocessing.image import ImageDataGenerator
from tensorflow.keras.preprocessing.image import img_to_array
from tensorflow.keras.preprocessing import image_dataset_from_directory
import tensorflow as tf
import os
from PIL import Image as PIL_Image
from PIL import ImageOps as PIL_ImageOps
import glob
import matplotlib.pyplot as plt
import json
import tensorflow_hub as hub

gpus = tf.config.experimental.list_physical_devices('GPU')
for gpu in gpus:
   tf.config.experimental.set_memory_growth(gpu, True)
logical_gpus = tf.config.experimental.list_logical_devices('GPU')
print(len(gpus), "Physical GPUs,", len(logical_gpus), "Logical GPUs")

CONFIDENCE_THRESHOLD=0.3

#net = cv2.dnn.readNetFromDarknet(CONFIG_FILE, WEIGHTS_FILE)
#Read the YOLO files
#net = Detector(bytes(CONFIG_FILE, encoding="utf-8"), bytes(WEIGHTS_FILE, encoding="utf-8"), 0, bytes(DATA_FILE,encoding="utf-8"))	

class LFA_Gesture_Injector():
	def __init__(self):
		self.tres_x = 192
		self.tres_y = 192
		self.expansion_const = 1
		self.smoothing_timeout = 0.1
		self.distance_threshold = 0.25
		self.retarget_timeout = 0.5
		self.cur_report = None
		self.certainty_threshold = 3
		self.certainty_count = 0
		
		self.cur_xres = -1
		self.cur_yres = -1
		
		self.cur_target_box = None
		
		self.poser = hub.load("/home/actor1/ACTor_Person_Following/src/actor_person_following/config/tflite_singlepose/")
		self.movenet = self.poser.signatures['serving_default']
		self.classifier = models.load_model("/home/actor1/ACTor_Person_Following/src/actor_person_following/config/saved_pose_classifier.h5")
		
		self.boxes_topic = "/follower/detects"
		self.reporter_topic = "/follower/detects_firstpass"
		
		self.boxes_sub = rospy.Subscriber(self.reporter_topic, Detections, self.report_callback)
		self.boxes_pub = rospy.Publisher(self.boxes_topic, Detections, queue_size = 10)
		
		self.rate = rospy.Rate(30)
		self.last_stamp = rospy.Time.now()
		self.certainty_stamp = rospy.Time.now()
		self.debug_checkpoint = rospy.Time.now()
		
		#rospy.spin()
		gc.disable()
		#gc.enable()
		tmp_count = 0
		print('LFA Gesture Injector is running')
		while not rospy.is_shutdown():
			if not self.cur_report == None:
				ss = rospy.Time.now()
				self.report_act(self.cur_report)
				es = rospy.Time.now()
				elps = (es - ss).to_sec()
				#print("ELAPSED: {:.3f}s ({:.1f}hz)".format(elps, 1/elps))
			#else:
			#	print("-")
			tmp_count = tmp_count + 1
			self.rate.sleep()
	
	def direct_distance(self, x0, y0, x1, y1):
		return math.sqrt(math.pow(x1 - x0, 2) + math.pow(y1 - y0, 2))
	
	def expansion_coef(self, dur):
		return 1 + self.expansion_const*(dur.to_sec())
	
	def cropImage(self, image, center_x, center_y, w, h, W, H):
		#print("Cropping:\n  center_x = {}\n  center_y = {}\n  w = {}\n  h = {}\n  W = {}\n  H = {}".format(center_x, center_y, w, h, W, H))
		tgcd = math.gcd(self.tres_x,self.tres_y)
		ar_x = self.tres_x/tgcd
		ar_y = self.tres_y/tgcd
		#print("  ar_x = {}\n  ar_y = {}".format(ar_x, ar_y))
		
		frame_x_bound = math.floor(2*min(center_x, W - center_x)/ar_x)
		frame_y_bound = math.floor(2*min(center_y, H - center_y)/ar_y)
		box_x_bound = math.ceil(w/ar_x)
		box_y_bound = math.ceil(h/ar_y)
		frame_bound = min(frame_x_bound, frame_y_bound)
		box_bound = max(box_x_bound, box_y_bound)
		
		cut_scale = -1
		if (box_bound < frame_bound):
			#print("	- Box Bound")
			cut_scale = box_bound
		else:
			#print("	- Frame Bound")
			cut_scale = frame_bound
		
		cut_x = cut_scale*ar_x
		cut_y = cut_scale*ar_y
		x0 = round(center_x - cut_x/2)
		x1 = round(center_x + cut_x/2)
		y0 = round(center_y - cut_y/2)
		y1 = round(center_y + cut_y/2)
		#print("  cut_x = {}\n  cut_y = {}\n  x0 = {}\n  x1 = {}\n  y0 = {}\n  y1 = {}".format(cut_x, cut_y, x0,x1,y0,y1))
		cropped = image[y0:y1,x0:x1]
		return cv2.resize(cropped, (self.tres_x,self.tres_y))
	
	def getPose(self, inImage):
		image = tf.convert_to_tensor(inImage, dtype=tf.int32)
		image = tf.expand_dims(image, axis=0)
		#image = tf.cast(tf.image.resize_with_pad(image, self.
		outputs = self.movenet(image)
		keypoints = outputs['output_0']
		#print(type(keypoints))
		points = keypoints[0][0][:,0:2]
		mdlpnts = np.array(keypoints[0]).reshape(1, 51)
		x = np.array(points[:,0])
		y = np.array(points[:,1])
		pose_points = Pose_Points()
		for i in range(len(points)):
			point = Pose_Point()
			point.x = x[i]
			point.y = y[i]
			pose_points.points.append(point)
		return pose_points, mdlpnts
	
	def poseFromImage(self, inImage, center_x, center_y, w, h, W, H):
		# Crop image
		#print("Cropping:\n  center_x = {}\n  center_y = {}\n  w = {}\n  h = {}\n  W = {}\n  H = {}".format(center_x, center_y, w, h, W, H))
		tgcd = math.gcd(self.tres_x,self.tres_y)
		ar_x = self.tres_x/tgcd
		ar_y = self.tres_y/tgcd
		#print("  ar_x = {}\n  ar_y = {}".format(ar_x, ar_y))
		
		frame_x_bound = math.floor(2*min(center_x, W - center_x)/ar_x)
		frame_y_bound = math.floor(2*min(center_y, H - center_y)/ar_y)
		box_x_bound = math.ceil(w/ar_x)
		box_y_bound = math.ceil(h/ar_y)
		frame_bound = min(frame_x_bound, frame_y_bound)
		box_bound = max(box_x_bound, box_y_bound)
		
		cut_scale = -1
		if (box_bound < frame_bound):
			#print("	- Box Bound")
			cut_scale = box_bound
		else:
			#print("	- Frame Bound")
			cut_scale = frame_bound
		
		cut_x = cut_scale*ar_x
		cut_y = cut_scale*ar_y
		x0 = round(center_x - cut_x/2)
		x1 = round(center_x + cut_x/2)
		y0 = round(center_y - cut_y/2)
		y1 = round(center_y + cut_y/2)
		#print("  cut_x = {}\n  cut_y = {}\n  x0 = {}\n  x1 = {}\n  y0 = {}\n  y1 = {}".format(cut_x, cut_y, x0,x1,y0,y1))
		cropped = inImage[y0:y1,x0:x1]
		
		# Estimate pose
		pose_points, mdlpnts = self.getPose(cv2.resize(cropped, (self.tres_x,self.tres_y)))
		for i in range(len(pose_points.points)):
			point = pose_points.points[i]
			pose_points.points[i].frame_x = int(y0 + round(cut_x*point.x))
			pose_points.points[i].frame_y = int(x0 + round(cut_y*point.y))
		gesture_res = self.classifier.predict(mdlpnts)
		gesture = self.map_output(gesture_res)
		return pose_points, gesture
	
	def map_output(self, output):
		output = output.argmax()
		if output == 0:
			return "Stop"
		elif output == 1:
			return "Start"
		else:
			return "None"
	
	def box_distance(self, p0, p1, q0, q1):
		if self.cur_target_box == None:
			return -1
		else:
			x0 = self.cur_target_box.xmin
			x1 = self.cur_target_box.xmax
			y0 = self.cur_target_box.ymin
			y1 = self.cur_target_box.ymax
			cx0 = (x0 + x1)/(2*self.cur_xres)
			cy0 = (y0 + y1)/(2*self.cur_yres)
			cx1 = (p0 + p1)/(2*self.cur_xres)
			cy1 = (q0 + q1)/(2*self.cur_yres)
			return self.direct_distance(cx0, cy0, cx1, cy1)
	
	def report_callback(self, inReport):
		self.cur_report = inReport
	
	def report_act(self, inReport):
		processing_start_stamp = rospy.Time.now()
		report = inReport
		image = CvBridge().imgmsg_to_cv2(report.image, 'bgr8')
		H = report.yres
		W = report.xres
		self.cur_xres = W
		self.cur_yres = H
		
		abs_target_dist = -1;
		abs_target_ind = -1
		target_dist = -1
		target_ind = -1
		cur_time = rospy.Time.now()
		elapsed = cur_time - self.last_stamp
		ccx = 0
		ccy = 0
		cw = 0
		ch = 0
		for i in range(len(report.detections)):
			detection = report.detections[i]
			center_x = (detection.box.xmax + detection.box.xmin)/2
			center_y = (detection.box.ymax + detection.box.ymin)/2
			x = detection.box.xmin
			y = detection.box.ymin
			w = (detection.box.xmax - detection.box.xmin)
			h = (detection.box.ymax - detection.box.ymin)
			report.detections[i].aruco_dist = self.box_distance(x, x + w, y, y + w)
			if detection.lidar_point.distance < 50 and (self.cur_target_box == None):
				tmp_pose_points, gesture = self.poseFromImage(image, center_x, center_y, w, h, W, H)
				report.detections[i].pose_points = tmp_pose_points
				report.detections[i].gesture = gesture
			else:
				report.detections[i].gesture = "-"
			
			if (report.detections[i].gesture == "Start") and ((abs_target_ind == -1) or (detection.lidar_point.distance < abs_target_dist)):
				print('GESTURE: {}'.format(report.detections[i].gesture))
				abs_target_ind = i
				abs_target_dist = detection.lidar_point.distance
			if (target_ind == -1) or (target_dist > report.detections[i].aruco_dist):
				target_ind = i
				target_dist = report.detections[i].aruco_dist
				ccx = center_x
				ccy = center_y
				cw = w
				ch = h
		
		if (target_ind >= 0) and (target_dist <= self.expansion_coef(elapsed)*self.distance_threshold) and (elapsed < rospy.Duration.from_sec(self.retarget_timeout)):
			print('  - Target: Persist ({})'.format(self.certainty_count))
			tmp_pose_points, gesture = self.poseFromImage(image, ccx, ccy, cw, ch, W, H)
			report.detections[target_ind].pose_points = tmp_pose_points
			report.detections[target_ind].gesture = gesture
			print('  - Target: Acquired')
			report.aruco_target = target_ind
			self.cur_target_box = report.detections[target_ind].box
			if report.detections[target_ind].gesture == "Start":
				report.start = True
			elif report.detections[target_ind].gesture == "Stop":
				report.stop = True
				self.cur_target_box = None
			#if self.certainty_count > self.certainty_threshold:
			#	print('  - Target: Acquired')
			#	report.aruco_target = target_ind
			#	self.cur_target_box = report.detections[target_ind].box
			#	if report.detections[target_ind].gesture == "Start":
			#		report.start = True
			#	elif report.detections[target_ind].gesture == "Stop":
			#		report.stop = True
			#		self.cur_target_box = None
			#elif self.certainty_count < -self.certainty_threshold:
			#	print('  - Target: Dropped')
			#	self.certainty_count = 0
			#	self.cur_target_box = None
			#	report.aruco_target = -1
			#	report.stop = True
			#else:
			#	if report.detections[target_ind].gesture == "Start":
			#		print('  - Target: Acquiring (+)')
			#		self.certainty_count = self.certainty_count + 1
			#	else:
			#		print('  - Target: Acquiring (-)')
			#		self.certainty_count = self.certainty_count - 1
			#	self.cur_target_box = report.detections[target_ind].box
			#	report.aruco_target = -1
			#	report.stop = True
			self.last_stamp = rospy.Time.now()
		elif (elapsed >= rospy.Duration.from_sec(self.retarget_timeout)) and (abs_target_ind >= 0):
			print('  - Target: Retarget')
			report.aruco_target = abs_target_ind
			report.start = True
			self.cur_target_box = report.detections[abs_target_ind].box
			self.last_stamp = rospy.Time.now()
			self.certainty_count = 0
		else:
			print('  - Target: Lost')
			self.cur_target_box = None
			report.aruco_target = -1
			report.stop = True
		
		processing_end_stamp = rospy.Time.now()
		processing_dur = (processing_end_stamp - processing_start_stamp).to_sec()
		total_dur = (processing_end_stamp - self.debug_checkpoint).to_sec()
		
		#print('Processing: {:.3f} ({:.3f}hz | {:.3f}hz)'.format(processing_dur/total_dur, 1/processing_dur, 1/total_dur))
		#print('Detections: {}'.format(report.num_detects))
		self.debug_checkpoint = rospy.Time.now()
		
		self.boxes_pub.publish(report)

if __name__ == '__main__':
	rospy.init_node('gesture_injection_node')
	print('LFA Gesture Injector is initialized')
	
	try:
		LFA_Gesture_Injector()
	except rospy.ROSInterruptException:
		pass

