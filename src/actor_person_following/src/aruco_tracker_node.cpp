#include <ros/ros.h>
#include <std_msgs/Float64.h>
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

using namespace std;

int main(int argc, char* argv[])
{
	//Initialize and set up ROS
	ros::init(argc, argv, "aruco_tracker");
	ros::NodeHandle nh("~");

	//cv::Mat markerImage;
	//cv::Ptr<cv::aruco::Dictionary> dictionary = cv::aruco::getPredefinedDictionary(cv::aruco::DICT_6X6_250);
	//cv::aruco::drawMarker(dictionary, 23, 200, markerImage, 1);
	//cv::imwrite("marker23.png", markerImage);

	ros::spin();
}
