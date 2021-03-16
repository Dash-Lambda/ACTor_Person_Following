#include <ros/ros.h>
#include <std_msgs/Float64.h>
#include <sensor_msgs/Image.h>
#include <actor_person_following/Detection.h>
#include <actor_person_following/Detections.h>
#include <darknet_ros_msgs/BoundingBox.h>
#include <darknet_ros_msgs/BoundingBoxes.h>
#include <darknet_ros_msgs/ObjectCount.h>
#include <string>
#include <vector>

#include <cv_bridge/cv_bridge.h>
#include <opencv2/imgproc/imgproc.hpp>
#include <opencv2/highgui/highgui.hpp>

#include <image_transport/image_transport.h>

using namespace std;

ros::Publisher dist_pub;
ros::Subscriber box_sub, found_sub, img_sub;
image_transport::Publisher img_test_pub;

string cam_topic, target_class;
int color_spot_wid;
double smoothing_timeout, sat_adj;

long cur_tag;
int cur_xres, cur_yres;
cv_bridge::CvImageConstPtr cur_img_ptr;
ros::Time smooth_tag;

int cur_max_ind, cur_count;
std::vector<actor_person_following::Detection> cur_detects;

cv::Vec3b get_color(int xc, int yc, int wid){
	double clr[3] = {0, 0, 0};
	int xmin = max(0, xc - wid/2);
	int xmax = min(cur_xres, xc + wid/2);
	int ymin = max(0, yc - wid/2);
	int ymax = min(cur_yres, yc + wid/2);
	for(int x = xmin; x <= xmax; x++){
		for(int y = ymin; y <= ymax; y++){
			cv::Vec3b pix = cur_img_ptr->image.at<cv::Vec3b>(y, x);
			for(int i = 0; i < 3; i++){
				clr[i] = clr[i] + pix[i];
			}
		}
	}
	cv::Vec3b clr_vec;
	for(int i = 0; i < 3; i++){
		clr[i] = clr[i]/((xmax - xmin + 1.0)*(ymax - ymin + 1.0));
		clr_vec[i] = clr[i];
	}
	return clr_vec;
}

void box_callback(const darknet_ros_msgs::BoundingBoxes::ConstPtr& box_msg){
	double wid = -1;
	int cur_max = -1, count = 0;

	std::vector<actor_person_following::Detection> tmp_detects;
	for(darknet_ros_msgs::BoundingBox box : box_msg->bounding_boxes){
		if(box.Class.compare(target_class) == 0){
			actor_person_following::Detection tmp_msg;
			tmp_msg.width = (double)(box.xmax - box.xmin)/cur_xres;
			tmp_msg.height = (double)(box.ymin + box.ymax)/cur_yres - 1;
			tmp_msg.center = (double)(box.xmin + box.xmax)/cur_xres - 1;
			if(tmp_msg.width > wid){
				wid = tmp_msg.width;
				cur_max = count;
			}
			cv::Vec3b pix = get_color((box.xmin + box.xmax)/2, (box.ymin + box.ymax)/2, color_spot_wid);
			tmp_msg.r = pix[0];
			tmp_msg.g = pix[1];
			tmp_msg.b = pix[2];
			tmp_detects.push_back(tmp_msg);
			count++;
		}
	}

	ros::Time cur_time = ros::Time::now();
	if(count == 0 && (cur_time - smooth_tag) < ros::Duration(smoothing_timeout)){
		return;
	}else{
		cur_count = count;
		cur_max_ind = cur_max;
		cur_detects = tmp_detects;
	}
}

void img_callback(const sensor_msgs::Image::ConstPtr& img_msg){
	cur_img_ptr = cv_bridge::toCvShare(img_msg, sensor_msgs::image_encodings::RGB8);
	cur_xres = img_msg->width;
	cur_yres = img_msg->height;

	cv_bridge::CvImagePtr hsv_img = cv_bridge::toCvCopy(img_msg, sensor_msgs::image_encodings::RGB8);
	cv::cvtColor(cur_img_ptr->image, hsv_img->image, cv::COLOR_BGR2HSV);
	hsv_img->image = hsv_img->image.mul(cv::Scalar(1, sat_adj, 1));
	cv::cvtColor(hsv_img->image, cur_img_ptr->image, cv::COLOR_HSV2BGR);

	img_test_pub.publish(cur_img_ptr->toImageMsg());
}

void found_callback(const darknet_ros_msgs::ObjectCount::ConstPtr& found_msg){
	actor_person_following::Detections det_msg;
	det_msg.xres = cur_xres;
	det_msg.yres = cur_yres;
	det_msg.num_detects = cur_count;
	if(found_msg->count > 0 || cur_count > 0){
		det_msg.closest = cur_max_ind;
		det_msg.detections = cur_detects;
	}else{
		det_msg.closest = -1;
	}
	dist_pub.publish(det_msg);
}

int main(int argc, char* argv[])
{
	ros::init(argc, argv, "detection_reporter_node");
	ros::NodeHandle nh;

	cam_topic = "/follower/default_cam";
	color_spot_wid = -1;
	smoothing_timeout = 0;
	target_class = "person";
	sat_adj = 1;
	nh.getParam("/detection_reporter_node/cam_topic", cam_topic);
	nh.getParam("/detection_reporter_node/color_spot_width", color_spot_wid);
	nh.getParam("/detection_reporter_node/smoothing_timeout", smoothing_timeout);
	nh.getParam("/detection_reporter_node/target_class", target_class);
	nh.getParam("/detection_reporter_node/sat_adj", sat_adj);
	smooth_tag = ros::Time::now();

	dist_pub = nh.advertise<actor_person_following::Detections>("/follower/detects", 1000);
	box_sub = nh.subscribe("/darknet_ros/bounding_boxes", 10, box_callback);
	img_sub = nh.subscribe(cam_topic, 10, img_callback);
	found_sub = nh.subscribe("/darknet_ros/found_object", 10, found_callback);

	image_transport::ImageTransport it(nh);
	img_test_pub = it.advertise("/follower/image_test_raw", 1);

	ros::spin();
}
