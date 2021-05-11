#include <ros/ros.h>
#include <std_msgs/Float64.h>
#include <sensor_msgs/PointCloud2.h>
#include <sensor_msgs/Image.h>
#include <string>
#include <vector>

#include <cv_bridge/cv_bridge.h>
#include <opencv2/imgproc/imgproc.hpp>
#include <opencv2/highgui/highgui.hpp>

#include <image_transport/image_transport.h>

//#include "aruco.h"
//#include <aruco_eye/aruco_eye.h>
#include <opencv2/aruco.hpp>
//#include <stdint.h>
#include <ros/console.h>
#include <math.h>

using namespace std;

ros::Subscriber lidar_sub;
image_transport::Publisher image_pub;
float xmax, ymax, zmax;

void lidar_callback(const sensor_msgs::PointCloud2::ConstPtr& lidar_msg){
	float z0 = 0.0, z1 = 1;
	int image_size = 1000;
	int rows = lidar_msg->height;
	int cols = lidar_msg->width;
	int x_offset = lidar_msg->fields[0].offset;
	int y_offset = lidar_msg->fields[1].offset;
	int z_offset = lidar_msg->fields[2].offset;
	int data_offset = lidar_msg->fields[3].offset;
	cv::Mat_<unsigned char> image_mat(image_size, image_size);
	for(int r = 0; r < rows; r++){
		for(int c = 0; c < cols; c++){
			int ind = (r*lidar_msg->row_step) + (c*lidar_msg->point_step);
			float x, y, z;
			memcpy(&x, &lidar_msg->data[ind + x_offset], sizeof(float));
			memcpy(&y, &lidar_msg->data[ind + y_offset], sizeof(float));
			memcpy(&z, &lidar_msg->data[ind + z_offset], sizeof(float));
			xmax = max(x, abs(xmax));
			ymax = max(y, abs(ymax));
			zmax = max(z, abs(zmax));
		}
	}
	for(int r = 0; r < image_size; r++){
		for(int c = 0; c < image_size; c++){
			image_mat(r, c) = 0;
		}
	}
	for(int r = 0; r < rows; r++){
		for(int c = 0; c < cols; c++){
			int ind = (r*lidar_msg->row_step) + (c*lidar_msg->point_step);
			float x, y, z;
			memcpy(&x, &lidar_msg->data[ind + x_offset], sizeof(float));
			memcpy(&y, &lidar_msg->data[ind + y_offset], sizeof(float));
			memcpy(&z, &lidar_msg->data[ind + z_offset], sizeof(float));
			float dat;
			memcpy(&dat, &lidar_msg->data[ind + data_offset], sizeof(float));
			unsigned char tmp = dat;

			float xybound = max(xmax, ymax);

			x = (x + xybound)/(2*xybound);
			y = (y + xybound)/(2*xybound);
			z = (z + zmax)/(zmax + zmax);
			float x0 = 1/2;
			float y0 = 1/2;
			//ROS_INFO("point = (%f, %f, %f)", x, y, z);
			float rad = sqrt((x - x0)*(x - x0) + (y - y0)*(y - y0));
			float ang = atan((y - y0)/(x - x0)) + ((x < x0) ? 3.14159 : ((y < y0) ? 2*3.14159 : 0));
			//ROS_INFO("(r,a) = (%f, %f)", rad, ang);
			if(z0 <= z && z <= z1) image_mat(y*(image_size - 1), x*(image_size - 1)) = 255*rad*rad;
		}
	}

	sensor_msgs::ImagePtr image_msg = cv_bridge::CvImage(std_msgs::Header(), "mono8", image_mat).toImageMsg();
	image_pub.publish(image_msg);

	ROS_INFO("New Frame:");
	ROS_INFO("  (width, height) = (%d, %d)", lidar_msg->width, lidar_msg->height);
	ROS_INFO("  point_step = %d", lidar_msg->point_step);
	ROS_INFO("  row_step = %d", lidar_msg->row_step);
	ROS_INFO("  is_dense = %s", lidar_msg->is_dense ? "true" : "false");
	ROS_INFO("  x bounds: [%f, %f]", -xmax, xmax);
	ROS_INFO("  y bounds: [%f, %f]", -ymax, ymax);
	ROS_INFO("  z bounds: [%f, %f]", -zmax, zmax);
	ROS_INFO("  fields:");
	for(int i = 0; i < lidar_msg->fields.size(); i++){
		ROS_INFO("  %d: %s (%d)", lidar_msg->fields[i].offset, lidar_msg->fields[i].name.c_str(), lidar_msg->fields[i].datatype);
	}
}

int main(int argc, char* argv[])
{
	//Initialize and set up ROS
	ros::init(argc, argv, "lidar");
	ros::NodeHandle nh("~");

	//cv::Mat markerImage;
	//cv::Ptr<cv::aruco::Dictionary> dictionary = cv::aruco::getPredefinedDictionary(cv::aruco::DICT_6X6_250);
	//cv::aruco::drawMarker(dictionary, 23, 200, markerImage, 1);
	//cv::imwrite("marker23.png", markerImage);

	xmax = 0;
	ymax = 0;
	zmax = 0;

	lidar_sub = nh.subscribe("/velodyne_points", 10, lidar_callback);
	image_transport::ImageTransport it(nh);
	image_pub = it.advertise("/follower/lidar_image", 1);

	ros::spin();
}
