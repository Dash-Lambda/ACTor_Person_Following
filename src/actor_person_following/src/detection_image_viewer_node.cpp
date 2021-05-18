#include <ros/ros.h>
#include <std_msgs/Header.h>
#include <std_msgs/String.h>
#include <sensor_msgs/Image.h>
#include <perception_msgs/PointInImage.h>
#include <actor_person_following/Detection.h>
#include <actor_person_following/Detections.h>
#include <string>
#include <vector>

#include <opencv2/opencv.hpp>
#include <cv_bridge/cv_bridge.h>
#include <opencv2/imgproc/imgproc.hpp>
#include <opencv2/highgui/highgui.hpp>

#include <image_transport/image_transport.h>
#include <iostream>
#include <ros/console.h>

using namespace std;

ros::Subscriber detection_image_sub, detection_sub, status_sub;
image_transport::Publisher image_pub;
const int text_font = cv::FONT_HERSHEY_PLAIN;
const double text_scale = 0.8;

//Config Parameters
string detection_image_topic, detection_topic, window_name;
bool flip_image, enable_aruco, enable_color, enable_closest, show_image;
int waitkey_delay, line_spacing, buffer_size;

//Running Variables
//cv_bridge::CvImageConstPtr cur_img_ptr;
cv::Mat src_image, image;
actor_person_following::Detections detections;
bool stale_image, made_image, image_exists, image_found, in_sync;
string cur_status;
cv::Size status_size;
vector<sensor_msgs::Image::ConstPtr> image_buffer;
long image_diff;

int write_line(cv::Mat& img, const string& str, cv::Point pos, cv::Scalar color){	
	int baseline = 0;
	cv::Size size = cv::getTextSize("0", text_font, text_scale, 1, &baseline);
	cv::putText(img, str, pos + cv::Point(0, size.height), text_font, text_scale, color);
	return size.height;
}

void set_image(int seq_id){
	//if(image_seq == seq_id) return;
	/*for(sensor_msgs::Image::ConstPtr& img_msg : image_buffer){
		if(img_msg->header.seq == seq_id){
			cv_bridge::CvImageConstPtr target_img_ptr = cv_bridge::toCvShare(img_msg, sensor_msgs::image_encodings::BGR8);
			src_image = target_img_ptr->image;
			in_sync = true;
			image_seq = seq_id;
			image_found = true;
			return;
		}
	}*/
	/*if(image_buffer.size() > 0){
		cv_bridge::CvImageConstPtr target_img_ptr = cv_bridge::toCvShare(image_buffer[0], sensor_msgs::image_encodings::BGR8);
		src_image = target_img_ptr->image;
		in_sync = false;
		image_seq = image_buffer[0]->header.seq;
		image_found = true;
		//ROS_INFO("res: %dx%d", target_img_ptr->image.cols, target_img_ptr->image.rows);
		return;
	}else{
		image_found = false;
	}*/

	long min_diff = -1;
	int min_ind = -1;
	for(int i = 0; i < image_buffer.size(); i++){
		long diff = abs((image_buffer[i]->header.stamp - detections.image_header.stamp).toNSec());
		if(diff < min_diff || min_diff < 0){
			min_diff = diff;
			min_ind = i;
		}
	}
	if(min_ind >= 0){
		src_image = cv_bridge::toCvShare(image_buffer[min_ind], sensor_msgs::image_encodings::BGR8)->image;
		in_sync = false;
		image_diff = min_diff;
		image_found = true;
		return;
	}else{
		image_found = false;
	}
}

void render_image(){	
	image = src_image;
	if(detections.num_detects > 0){
		for(int i = 0; i < detections.num_detects; i++){
			int line_height = 0;
			actor_person_following::Detection det = detections.detections[i];
			cv::Point c1 = cv::Point(det.box.xmin, det.box.ymin), c2 = cv::Point(det.box.xmax, det.box.ymax);
			cv::Point label_pos = cv::Point(det.box.xmin, det.box.ymin);

			cv::rectangle(image, c1, c2, cv::Scalar(255, 0, 255));

			line_height = write_line(image, to_string(i), label_pos, cv::Scalar(255, 255, 0));
			label_pos = label_pos + cv::Point(0, line_height + line_spacing);

			line_height = write_line(image, to_string(det.lidar_point.distance), label_pos, cv::Scalar(0, 0, 255));
			label_pos = label_pos + cv::Point(0, line_height + line_spacing);
			
			cv::Point lidar_circle_center(det.lidar_point.frame_x*(image.cols - 1), det.lidar_point.frame_y*(image.rows - 1));
			cv::circle(image, lidar_circle_center, 5, cv::Scalar(0, 0, 255), cv::FILLED);

			if(enable_closest && detections.close_target == i){
				line_height = write_line(image, "CLOSE_TARGET", label_pos, cv::Scalar(0, 0, 255));
				label_pos = label_pos + cv::Point(0, line_height + line_spacing);
			}
			if(enable_aruco && detections.aruco_target == i){
				line_height = write_line(image, "ARUCO_TARGET", label_pos, cv::Scalar(0, 255, 0));
				label_pos = label_pos + cv::Point(0, line_height + line_spacing);
			}
		}

		//imshow(window_name, image);
		//cv::waitKey(waitkey_delay);
	}
	if(enable_aruco){
		if(detections.aruco_visible){
			for(int i = 0; i < detections.aruco_points.size(); i++){
				perception_msgs::PointInImage p1 = detections.aruco_points[i];
				perception_msgs::PointInImage p2 = detections.aruco_points[(i + 1)%detections.aruco_points.size()];
				cv::line(image, cv::Point(p1.x, p1.y), cv::Point(p2.x, p2.y), cv::Scalar(255, 0, 0));
			}
		}
	}

	if(flip_image){ cv::flip(image, image, 1); }
	cv::rectangle(image, cv::Point(0, 0), cv::Point(status_size.width, status_size.height), cv::Scalar(0, 0, 0), cv::FILLED);
	write_line(image, cur_status, cv::Point(0, 0), cv::Scalar(0, 255, 0));

	write_line(image, to_string(image_diff), cv::Point(0, status_size.height + 5), cv::Scalar(0, 255, 0));

	made_image = true;
	stale_image = false;
}

void send_image(){
	image_pub.publish(cv_bridge::CvImage(std_msgs::Header(), "bgr8", image).toImageMsg());
	if(show_image){
		imshow(window_name, image);
		cv::waitKey(waitkey_delay);
	}
}

void detection_report_callback(const actor_person_following::Detections& detections_msg){
	detections = detections_msg;
	stale_image = true;
}

void detection_image_callback(const sensor_msgs::Image::ConstPtr& img_msg){
	//cv_bridge::CvImageConstPtr target_img_ptr = cv_bridge::toCvShare(img_msg, sensor_msgs::image_encodings::BGR8);
	image_buffer.insert(image_buffer.begin(), img_msg);
	if(image_buffer.size() > buffer_size){ image_buffer.resize(buffer_size); }
	stale_image = true;
}

void status_callback(const std_msgs::String::ConstPtr& status_msg){
	cur_status = status_msg->data;
	int baseline = 0;
	status_size = cv::getTextSize(cur_status, text_font, text_scale, 1, &baseline);
}

int main(int argc, char* argv[]) //Make this work with a constant rate loop, detections buffer, and header-matched images
{
	ros::init(argc, argv, "detection_image_viewer_node");
	ros::NodeHandle nh;
	image_transport::ImageTransport it(nh);

	int baseline = 0;
	cur_status = "";
	stale_image = false;
	made_image = false;
	image_found = false;
	in_sync = false;

	detection_image_topic = "/follower/target_image";
	detection_topic = "/follower/detects";
	window_name = "ACTor targeting";
	flip_image = false;
	waitkey_delay = 10;
	enable_aruco = true;
	enable_color = true;
	enable_closest = true;
	line_spacing = 5;
	buffer_size = 100;
	show_image = false;

	nh.getParam("/detection_image_viewer_node/detection_image_topic", detection_image_topic);
	nh.getParam("/detection_image_viewer_node/detection_topic", detection_topic);
	nh.getParam("/detection_image_viewer_node/window_name", window_name);
	nh.getParam("/detection_image_viewer_node/flip_image", flip_image);
	nh.getParam("/detection_image_viewer_node/waitkey_delay", waitkey_delay);
	nh.getParam("/detection_image_viewer_node/enable_aruco", enable_aruco);
	nh.getParam("/detection_image_viewer_node/enable_color", enable_color);
	nh.getParam("/detection_image_viewer_node/enable_closest", enable_closest);
	nh.getParam("/detection_image_viewer_node/line_spacing", line_spacing);
	nh.getParam("/detection_image_viewer_node/buffer_size", buffer_size);
	nh.getParam("/detection_image_viewer_node/show_image", show_image);

	detection_image_sub = nh.subscribe(detection_image_topic, 10, detection_image_callback);
	detection_sub = nh.subscribe(detection_topic, 10, detection_report_callback);
	status_sub = nh.subscribe("/display/text/msg", 10, status_callback);

	image_pub = it.advertise("/follower/targeting_image", 1);

	if(show_image){ cv::namedWindow(window_name); }

	ros::Rate r(30);
	while(ros::ok()){
		set_image(detections.image_header.seq);
		if(stale_image && image_found){ render_image(); }
		if(made_image){ send_image(); }
		r.sleep();
		ros::spinOnce();
	}
}
