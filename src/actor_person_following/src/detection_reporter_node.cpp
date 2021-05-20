#include <ros/ros.h>
#include <std_msgs/Float64.h>
//#include <sensor_msgs/PointCloud2.h>
#include <actor_person_following/Lidar_Point.h>
#include <actor_person_following/Lidar_Points.h>
#include <std_msgs/Header.h>
#include <sensor_msgs/Image.h>
#include <perception_msgs/MarkerList.h>
#include <perception_msgs/Marker.h>
#include <perception_msgs/LabeledPointInImage.h>
#include <perception_msgs/PointInImage.h>
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
#include <math.h>

using namespace std;
const double PI = 3.14159265359;

ros::Publisher dist_pub;
ros::Subscriber box_sub, img_sub, aruco_sub, lidar_sub;
image_transport::Publisher img_test_pub;

//Config Parameters
string cam_topic, aruco_topic, target_class, aruco_target;
int color_spot_wid, persist_method, buffer_size;
double smoothing_timeout, sat_adj, color_target_tol, 
	target_overlap_thresh, retarget_timeout, distance_thresh, 
	distance_expansion, aruco_grab_dist;
double color_target_rgb[3];
const vector<string> corner_names = {};

//Running Variables
int cur_xres, cur_yres;
double ar_x, ar_y;
bool aruco_visible;
cv_bridge::CvImageConstPtr cur_img_ptr, target_img_ptr;
ros::Time smooth_tag, aruco_tag, close_tag, aruco_target_tag;

int cur_max_ind, cur_count, cur_aruco_target_ind, cur_color_target_ind, cur_overlap_target_ind;
std::vector<actor_person_following::Detection> cur_detects;
std::vector<perception_msgs::PointInImage> aruco_points;
darknet_ros_msgs::BoundingBox cur_target_box, cur_aruco_box;
std_msgs::Header cur_image_header;

//Lidar;
vector<actor_person_following::Lidar_Points> lidar_buffer;
actor_person_following::Lidar_Points lidar_points;
bool lidar_found;

bool pointsort(actor_person_following::Lidar_Point a, actor_person_following::Lidar_Point b){ return a.distance < b.distance; }

void lidar_callback(const actor_person_following::Lidar_Points& lidar_msg){
	lidar_buffer.insert(lidar_buffer.begin(), lidar_msg);
	if(lidar_buffer.size() > buffer_size){ lidar_buffer.resize(buffer_size); }
}

void set_lidar(ros::Time timestamp){
	long min_diff = -1;
	int min_ind = -1;
	for(int i = 0; i < lidar_buffer.size(); i++){
		long diff = abs((lidar_buffer[i].header.stamp - timestamp).toNSec());
		if(diff < min_diff || min_diff < 0){
			min_diff = diff;
			min_ind = i;
		}
	}
	if(min_ind >= 0){
		lidar_points = lidar_buffer[min_ind];
		lidar_found = true;
		return;
	}else{
		lidar_found = false;
	}
}

actor_person_following::Lidar_Point get_distance(double x0, double x1, double y0, double y1){
	vector<actor_person_following::Lidar_Point> points;
	for(actor_person_following::Lidar_Point point : lidar_points.points){
		double x = point.frame_x;
		double y = point.frame_y;
		if(x0 <= x && x <= x1 && y0 <= y && y <= y1){
			points.push_back(point);
		}
	}
	int size = points.size();
	if (size == 0){
		actor_person_following::Lidar_Point nah;
		nah.distance = -1;
		return nah; // Undefined, really.
	}else{
		sort(points.begin(), points.end(), pointsort);
		actor_person_following::Lidar_Point avg;
		avg.x = 0;
		avg.y = 0;
		avg.z = 0;
		avg.distance = 0;
		avg.pitch = 0;
		avg.yaw = 0;
		avg.frame_x = 0;
		avg.frame_y = 0;
		for(int i = 0; i < min(10, size - 1); i++){
			avg.x += points[i].x/min(10, size - 1);
			avg.y += points[i].y/min(10, size - 1);
			avg.z += points[i].z/min(10, size - 1);
			avg.distance += points[i].distance/min(10, size - 1);
			avg.pitch += points[i].pitch/min(10, size - 1);
			avg.yaw += points[i].yaw/min(10, size - 1);
			avg.frame_x += points[i].frame_x/min(10, size - 1);
			avg.frame_y += points[i].frame_y/min(10, size - 1);
		}	
		return avg;
	}
}

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

double overlap_ratio(darknet_ros_msgs::BoundingBox base, darknet_ros_msgs::BoundingBox test){
	double L = max(base.xmin, test.xmin);
	double R = min(base.xmax, test.xmax);
	double D = max(base.ymin, test.ymin);
	double U = min(base.ymax, test.ymax);
	double X = max(R - L, 0.0);
	double Y = max(U - D, 0.0);
	double Ao = X*Y;
	double Ab = (base.xmax - base.xmin)*(base.ymax - base.ymin);
	double At = (test.xmax - test.xmin)*(test.ymax - test.ymin);
	double A = Ab + At - Ao;
	return A == 0 ? 0 : Ao/A;
}

double direct_distance(double x0, double y0, double x1, double y1){
	return sqrt(pow(x1 - x0, 2) + pow(y1 - y0, 2));
}
double box_distance(darknet_ros_msgs::BoundingBox base, darknet_ros_msgs::BoundingBox test){
	double x0 = (base.xmin + base.xmax)/(2.0*cur_xres);
	double y0 = (base.ymin + base.ymax)/(2.0*cur_yres);
	double x1 = (test.xmin + test.xmax)/(2.0*cur_xres);
	double y1 = (test.ymin + test.ymax)/(2.0*cur_yres);
	return direct_distance(x0, y0, x1, y1);
}

actor_person_following::Detection make_detection(darknet_ros_msgs::BoundingBox box){
	double x0 = (double)box.xmin/cur_xres, x1 = (double)box.xmax/cur_xres, y0 = (double)box.ymin/cur_yres, y1 = (double)box.ymax/cur_yres;	
	actor_person_following::Detection tmp_msg;

	tmp_msg.lidar_point = get_distance(x0, x1, y0, (y0 + y1)/2);

	tmp_msg.box = box;
	tmp_msg.width = (double)(box.xmax - box.xmin)/cur_xres;
	tmp_msg.height = (double)(box.ymin + box.ymax)/cur_yres - 1;
	tmp_msg.center = (double)(box.xmin + box.xmax)/cur_xres - 1;

	tmp_msg.aruco_strength = direct_distance(ar_x, ar_y, tmp_msg.center, tmp_msg.height);

	tmp_msg.aruco_dist = box_distance(cur_aruco_box, box);
	tmp_msg.close_dist = box_distance(cur_target_box, box);
	tmp_msg.aruco_overlap = overlap_ratio(cur_aruco_box, box);
	tmp_msg.close_overlap = overlap_ratio(cur_target_box, box);

	cv::Vec3b pix = get_color((box.xmin + box.xmax)/2, (box.ymin + box.ymax)/2, color_spot_wid);
	tmp_msg.r = pix[0];
	tmp_msg.g = pix[1];
	tmp_msg.b = pix[2];

	return tmp_msg;
}

double expansion_func(ros::Duration dur){
	return 1 + distance_expansion*(dur.toSec());
}

void box_callback(const darknet_ros_msgs::BoundingBoxes::ConstPtr& box_msg){
	set_lidar(box_msg->image_header.stamp);
	if(!lidar_found){ return; }
	double tmp_dist = -1, tmp_ardist = -1, tmp_aruco_metric = -1, tmp_wid_color = -1, tmp_close_metric = -1;
	int tmp_max_ind = -1, tmp_color_ind = -1, count = 0, tmp_aruco_ind = -1, tmp_close_ind = -1, tmp_ardist_ind = -1;

	std::vector<actor_person_following::Detection> tmp_detects;
	for(darknet_ros_msgs::BoundingBox box : box_msg->bounding_boxes){
		if(box.Class.compare(target_class) == 0 || target_class.compare("") == 0){
			actor_person_following::Detection tmp_msg = make_detection(box);
			if(persist_method == 1){
				if(tmp_msg.aruco_dist < tmp_aruco_metric || tmp_aruco_ind < 0){
					tmp_aruco_ind = count;
					tmp_aruco_metric = tmp_msg.aruco_dist;
				}
				if(tmp_msg.close_dist < tmp_close_metric || tmp_close_ind < 0){
					tmp_close_ind = count;
					tmp_close_metric = tmp_msg.close_dist;
				}
			}else if(persist_method == 2){
				if(tmp_msg.aruco_overlap > tmp_aruco_metric || tmp_aruco_ind < 0){
					tmp_aruco_ind = count;
					tmp_aruco_metric = tmp_msg.aruco_overlap;
				}
				if(tmp_msg.close_overlap > tmp_close_metric || tmp_close_ind < 0){
					tmp_close_ind = count;
					tmp_close_metric = tmp_msg.close_overlap;
				}
			}else{
				if(tmp_msg.aruco_strength < tmp_aruco_metric || tmp_aruco_ind < 0){
					tmp_aruco_ind = count;
					tmp_aruco_metric = tmp_msg.aruco_strength;
				}
				if(tmp_msg.width > tmp_close_metric || tmp_close_ind < 0){
					tmp_close_ind = count;
					tmp_close_metric = tmp_msg.width;
				}
			}
			if(tmp_msg.aruco_strength < tmp_ardist || tmp_ardist_ind < 0){
				tmp_ardist_ind = count;
				tmp_ardist = tmp_msg.aruco_strength;
			}
			if(tmp_msg.lidar_point.distance > tmp_dist || tmp_max_ind < 0){
				tmp_dist = tmp_msg.lidar_point.distance;
				tmp_max_ind = count;
			}
			if((pow(color_target_rgb[0] - tmp_msg.r, 2) + pow(color_target_rgb[0] - tmp_msg.r, 2) + pow(color_target_rgb[0] - tmp_msg.r, 2)) < color_target_tol && tmp_msg.width > tmp_wid_color){
				tmp_wid_color = tmp_msg.width;
				tmp_color_ind = count;
			}
			tmp_detects.push_back(tmp_msg);
			count++;
		}
	}

	ros::Time cur_time = ros::Time::now();
	if(count == 0 && (cur_time - smooth_tag) < ros::Duration(smoothing_timeout)){
		return;
	}else{
		cur_count = count;
		cur_max_ind = tmp_max_ind;
		cur_color_target_ind = tmp_color_ind;
		cur_detects = tmp_detects;
		cur_image_header = box_msg->image_header;

		if(persist_method == 1){
			double aruco_coef = expansion_func(cur_time - aruco_target_tag);
			double close_coef = expansion_func(cur_time - close_tag);
			if(!aruco_visible && tmp_aruco_ind >= 0 && tmp_aruco_metric <= aruco_coef*distance_thresh && (cur_time - aruco_target_tag) < ros::Duration(retarget_timeout)){
				cur_aruco_target_ind = tmp_aruco_ind;
				cur_aruco_box = tmp_detects[tmp_aruco_ind].box;
				aruco_target_tag = ros::Time::now();
			}else if(aruco_visible && tmp_ardist >= 0 && tmp_ardist <= aruco_grab_dist){
				cur_aruco_target_ind = tmp_ardist_ind;
				cur_aruco_box = tmp_detects[tmp_ardist_ind].box;
				aruco_target_tag = ros::Time::now();
			}else{
				cur_aruco_target_ind = -1;
			}

			if(tmp_close_ind >= 0 && tmp_close_metric <= close_coef*distance_thresh){
				cur_overlap_target_ind = tmp_close_ind;
				cur_target_box = tmp_detects[tmp_close_ind].box;
				close_tag = ros::Time::now();
			}else if((cur_time - close_tag) > ros::Duration(retarget_timeout) && tmp_max_ind >= 0){
				cur_overlap_target_ind = tmp_max_ind;
				cur_target_box = tmp_detects[tmp_max_ind].box;
				close_tag = ros::Time::now();
			}else{
				cur_overlap_target_ind = -1;
			}
		}else if(persist_method == 2){
			if(!aruco_visible && tmp_aruco_ind >= 0 && tmp_aruco_metric >= target_overlap_thresh && (cur_time - aruco_target_tag) < ros::Duration(retarget_timeout)){
				cur_aruco_target_ind = tmp_aruco_ind;
				cur_aruco_box = tmp_detects[tmp_aruco_ind].box;
				aruco_target_tag = ros::Time::now();
			}else if(aruco_visible && tmp_ardist >= 0){
				cur_aruco_target_ind = tmp_ardist_ind;
				cur_aruco_box = tmp_detects[tmp_ardist_ind].box;
				aruco_target_tag = ros::Time::now();
			}else{
				cur_aruco_target_ind = -1;
			}

			if(tmp_close_ind >= 0 && tmp_close_metric >= target_overlap_thresh){
				cur_overlap_target_ind = tmp_close_ind;
				cur_target_box = tmp_detects[tmp_close_ind].box;
				close_tag = ros::Time::now();
			}else if((cur_time - close_tag) > ros::Duration(retarget_timeout) && tmp_max_ind >= 0){
				cur_overlap_target_ind = tmp_max_ind;
				cur_target_box = tmp_detects[tmp_max_ind].box;
				close_tag = ros::Time::now();
			}else{
				cur_overlap_target_ind = -1;
			}
		}else{
			cur_aruco_target_ind = tmp_aruco_ind;
			if(tmp_aruco_ind >= 0){ cur_aruco_box = tmp_detects[tmp_aruco_ind].box; }
			cur_overlap_target_ind = tmp_close_ind;
			if(tmp_close_ind >= 0){ cur_target_box = tmp_detects[tmp_close_ind].box; }
		}
	}
}

void img_callback(const sensor_msgs::Image::ConstPtr& img_msg){
	cur_img_ptr = cv_bridge::toCvShare(img_msg, sensor_msgs::image_encodings::RGB8);
	cur_xres = img_msg->width;
	cur_yres = img_msg->height;
}

void publish_detections(){
	actor_person_following::Detections det_msg;
	det_msg.image_header = cur_image_header;
	det_msg.num_detects = cur_count;
	det_msg.xres = cur_xres;
	det_msg.yres = cur_yres;
	det_msg.aruco_visible = aruco_visible;
	det_msg.aruco_points = aruco_points;
	det_msg.aruco_x = ar_x;
	det_msg.aruco_y = ar_y;
	det_msg.detections = cur_detects;

	det_msg.closest = det_msg.detections.size() <= 0 ? -1 : cur_max_ind;
	det_msg.close_target = det_msg.detections.size() <= 0 ? -1 : cur_overlap_target_ind;
	det_msg.aruco_target = det_msg.detections.size() <= 0 ? -1 : cur_aruco_target_ind;
	det_msg.color_target = det_msg.detections.size() <= 0 ? -1 : cur_color_target_ind;

	dist_pub.publish(det_msg);
}

void aruco_callback(const perception_msgs::MarkerList::ConstPtr& aruco_msg){
	for(int i = 0; i < aruco_msg->markers.size(); i++){
		perception_msgs::Marker mark = aruco_msg->markers[i];
		if(mark.id.compare(aruco_target) == 0){
			double tmp_x = 0, tmp_y = 0;
			int pnt_cnt = 0;
			std::vector<perception_msgs::PointInImage> tmp_points;
			for(perception_msgs::LabeledPointInImage& point: mark.labeledPointsInImage){
				//if(find(corner_names.begin(), corner_names.end(), point.value) != corner_names.end()){
				//	tmp_x += point.pointsInImage.x;
				//	tmp_y += point.pointsInImage.y;
				//	pnt_cnt++;
				//}
				tmp_x += point.pointsInImage.x;
				tmp_y += point.pointsInImage.y;
				tmp_points.push_back(point.pointsInImage);
				pnt_cnt++;
			}
			if(pnt_cnt != 0){
				ar_x = 2*tmp_x/(pnt_cnt*cur_xres) - 1;
				ar_y = 2*tmp_y/(pnt_cnt*cur_yres) - 1;
				aruco_points = tmp_points;
				aruco_visible = true;
				aruco_tag = ros::Time::now();
				return;
			}
		}
	}
	if(ros::Time::now() - aruco_tag >= ros::Duration(smoothing_timeout)){
		ar_x = 0;
		ar_y = 0;
		aruco_visible = false;
	}
}

int main(int argc, char* argv[])
{
	ros::init(argc, argv, "detection_reporter_node");
	ros::NodeHandle nh;

	cur_xres = -1;
	cur_yres = -1;
	ar_x = -1;
	ar_y = -1;
	cur_max_ind = -1;
	cur_count = 0;
	cur_aruco_target_ind = -1;
	cur_color_target_ind = -1;
	cur_overlap_target_ind = -1;
	aruco_visible = false;
	smooth_tag = ros::Time::now();

	cam_topic = "/follower/default_cam";
	aruco_topic = "/follower/default_aruco";
	color_spot_wid = -1;
	smoothing_timeout = 0;
	target_class = "person";
	aruco_target = "";
	sat_adj = 1;
	color_target_tol = 0;
	target_overlap_thresh = 0;
	retarget_timeout = 0;
	persist_method = 0;
	distance_thresh = 0;
	distance_expansion = 0;
	aruco_grab_dist = 2;
	buffer_size = 100;

	nh.getParam("/detection_reporter_node/cam_topic", cam_topic);
	nh.getParam("/detection_reporter_node/color_spot_width", color_spot_wid);
	nh.getParam("/detection_reporter_node/smoothing_timeout", smoothing_timeout);
	nh.getParam("/detection_reporter_node/target_class", target_class);
	nh.getParam("/detection_reporter_node/sat_adj", sat_adj);
	nh.getParam("/detection_reporter_node/aruco_topic", aruco_topic);
	nh.getParam("/detection_reporter_node/aruco_target", aruco_target);
	nh.getParam("/detection_reporter_node/color_target_tol", color_target_tol);
	nh.getParam("/detection_reporter_node/overlap_thresh", target_overlap_thresh);
	nh.getParam("/detection_reporter_node/retarget_timeout", retarget_timeout);
	nh.getParam("/detection_reporter_node/persist_method", persist_method);
	nh.getParam("/detection_reporter_node/distance_thresh", distance_thresh);
	nh.getParam("/detection_reporter_node/distance_expansion", distance_expansion);
	nh.getParam("/detection_reporter_node/aruco_grab_dist", aruco_grab_dist);
	nh.getParam("/detection_reporter_node/buffer_size", buffer_size);


	int tmp_r = 0, tmp_g = 0, tmp_b = 0;
	nh.getParam("/detection_reporter_node/color_target_r", tmp_r);
	nh.getParam("/detection_reporter_node/color_target_g", tmp_g);
	nh.getParam("/detection_reporter_node/color_target_b", tmp_b);
	color_target_rgb[0] = tmp_r;
	color_target_rgb[1] = tmp_g;
	color_target_rgb[2] = tmp_b;

	smooth_tag = ros::Time::now();
	close_tag = ros::Time::now();
	aruco_target_tag = ros::Time::now();

	dist_pub = nh.advertise<actor_person_following::Detections>("/follower/detects", 1000);
	box_sub = nh.subscribe("/darknet_ros/bounding_boxes", 10, box_callback);
	img_sub = nh.subscribe(cam_topic, 10, img_callback);
	aruco_sub = nh.subscribe(aruco_topic, 10, aruco_callback);

	image_transport::ImageTransport it(nh);
	img_test_pub = it.advertise("/follower/target_image", 1);

	lidar_sub = nh.subscribe("/follower/lidar_points", 10, lidar_callback);

	ros::Rate r(30);
	while(ros::ok()){
		publish_detections();
		r.sleep();
		ros::spinOnce();
	}
}
