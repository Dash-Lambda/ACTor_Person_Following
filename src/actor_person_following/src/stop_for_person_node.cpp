#include <ros/ros.h>
#include <time.h>
#include <geometry_msgs/TwistStamped.h>
#include <actor_person_following/Detection.h>
#include <actor_person_following/Detections.h>
#include <std_msgs/Bool.h>
#include <std_msgs/String.h>
#include <std_msgs/ColorRGBA.h>
#include <std_msgs/Empty.h>
#include <string>
#include <iostream>

#include <dbw_polaris_msgs/ThrottleCmd.h>
#include <dbw_polaris_msgs/BrakeCmd.h>
#include <dbw_polaris_msgs/SteeringCmd.h>
#include <dbw_polaris_msgs/GearCmd.h>

using namespace std;

//ROS Objects
ros::Publisher twist_pub, disp_msg_pub, disp_rgb_pub, enable_pub, gear_pub, brake_pub;
ros::Subscriber det_sub, start_sub, stop_sub;

//Config Parameters
string twist_topic, brake_topic, gear_topic, enable_topic, disp_msg_topic, disp_rgb_topic;
double stop_thresh, speed, steerMult, 
	timeout, looprate, proximity_cooldown, 
	smoothing_timeout, dist_decay, steer_decay, 
	center_offset, brake_force, enable_rate,
	target_distance, deadzone;
bool enable_aruco, enable_color, enable_closest;
string stopped_color, idle_color, follow_color, slow_color, stop_color, cooldown_color, error_color;

//Running Variables
double cur_dist, cur_pos, closest_dist;
int cur_r, cur_g, cur_b, clr_sel;
ros::Time last_update, last_proximity_trigger;
bool active, target_visible, aruco_visible;

void send_enable(){
	std_msgs::Empty enable_msg;
	enable_pub.publish(enable_msg);
}

void send_gear(int gear_num){ // need to make this actually select the gear
	dbw_polaris_msgs::GearCmd gear_msg;
	gear_msg.cmd.gear = gear_num;
	gear_pub.publish(gear_msg);
}

void send_twist(double spd, double dir){
	geometry_msgs::Twist twist_msg;
	twist_msg.linear.x = spd;
	twist_msg.angular.z = dir;
	twist_pub.publish(twist_msg);
}

void send_brake(double force){
	dbw_polaris_msgs::BrakeCmd brake_msg;
	brake_msg.pedal_cmd = force;
	brake_pub.publish(brake_msg);
}

//Receive detections and update state
void box_callback(const actor_person_following::Detections::ConstPtr& boxes_msg){
	if(boxes_msg->num_detects > 0){ // if any objects were detected, update state
		int target_ind = -1;
		if(enable_aruco && boxes_msg->aruco_target >= 0){ // if targeting aruco, check for aruco marker
			target_ind = boxes_msg->aruco_target;
		}else if(enable_color && boxes_msg->color_target >= 0){ // if targeting color, check for color target
			target_ind = boxes_msg->color_target;
		}else if(enable_closest && boxes_msg->close_target >= 0){ // if targeting closest, check for closest detection
			target_ind = boxes_msg->close_target;
		}

		closest_dist = boxes_msg->detections[boxes_msg->closest].lidar_point.distance; // set current width
		if(target_ind >= 0){ // if target exists, update state
			actor_person_following::Detection box_msg = boxes_msg->detections[target_ind];
			cur_dist = (box_msg.lidar_point.distance + dist_decay*cur_dist)/(1 + dist_decay);
			cur_pos = (box_msg.center + steer_decay*cur_pos)/(1 + steer_decay);
			cur_r = box_msg.r;
			cur_g = box_msg.g;
			cur_b = box_msg.b;
			target_visible = true;
			last_update = ros::Time::now();
		}else if(ros::Time::now() - last_update > ros::Duration(smoothing_timeout)){ // if smoothing timed out, update state regardless of target
			cur_dist = -1;
			cur_pos = 0;
			target_visible = false;
			last_update = ros::Time::now();
		}
	}else if(ros::Time::now() - last_update > ros::Duration(smoothing_timeout)){ // if smoothing timed out, update state regardless of detections
		cur_dist = -1;
		cur_pos = 0;
		target_visible = false;
		last_update = ros::Time::now();
	}
	aruco_visible = boxes_msg->aruco_visible;
	if(boxes_msg->start){
		active = true;
	}
	if(boxes_msg->stop){
		active = false;
	}
}

void start_callback(const std_msgs::Empty::ConstPtr& start){
	active = true;
}

void stop_callback(const std_msgs::Empty::ConstPtr& stop){
	active = false;
}

int main(int argc, char* argv[])
{
	ros::init(argc, argv, "stop_for_person_node");
	ros::NodeHandle nh;

	twist_topic = "/follower/twist_cmd";
	brake_topic = "/follower/brake_cmd";
	gear_topic = "/follower/gear_cmd";
	enable_topic = "/follower/enable_vehcile";
	disp_msg_topic = "/follower/disp_msg_default";
	disp_rgb_topic = "/follower/disp_rgb_default";
	stop_thresh = 0;
	speed = 0.2;
	steerMult = 0;
	timeout = 0;
	looprate = 10;
	proximity_cooldown = 1;
	smoothing_timeout = 0;
	dist_decay = 0;
	steer_decay = 0;
	center_offset = 0;
	brake_force = 0;
	enable_rate = -1;
	target_distance = 5;
	deadzone = 0;
	target_visible = false;
	aruco_visible = false;

	enable_aruco = false;
	enable_color = false;
	enable_closest = false;
	nh.getParam("/stop_for_person_node/enable_aruco", enable_aruco);
	nh.getParam("/stop_for_person_node/enable_color", enable_color);
	nh.getParam("/stop_for_person_node/enable_closest", enable_closest);

	nh.getParam("/stop_for_person_node/twist_topic", twist_topic);
	nh.getParam("/stop_for_person_node/brake_topic", brake_topic);
	nh.getParam("/stop_for_person_node/gear_topic", gear_topic);
	nh.getParam("/stop_for_person_node/enable_topic", enable_topic);
	nh.getParam("/stop_for_person_node/disp_msg_topic", disp_msg_topic);
	nh.getParam("/stop_for_person_node/disp_rgb_topic", disp_rgb_topic);
	nh.getParam("/stop_for_person_node/stop_thresh", stop_thresh);
	nh.getParam("/stop_for_person_node/speed", speed);
	nh.getParam("/stop_for_person_node/steerMult", steerMult);
	nh.getParam("/stop_for_person_node/timeout", timeout);
	nh.getParam("/stop_for_person_node/looprate", looprate);
	nh.getParam("/stop_for_person_node/proximity_cooldown", proximity_cooldown);
	nh.getParam("/stop_for_person_node/smoothing_timeout", smoothing_timeout);
	nh.getParam("/stop_for_person_node/distance_decay", dist_decay);
	nh.getParam("/stop_for_person_node/steering_decay", steer_decay);
	nh.getParam("/stop_for_person_node/center_offset", center_offset);
	nh.getParam("/stop_for_person_node/enable_rate", enable_rate);
	nh.getParam("/stop_for_person_node/target_distance", target_distance);
	nh.getParam("/stop_for_person_node/deadzone", deadzone);

	steer_decay = 1 - ((1 - steer_decay)/looprate);
	dist_decay = 1 - ((1 - dist_decay)/looprate);

	active = false;
	nh.getParam("/stop_for_person_node/start_active", active);

	string stopped_color = "#FFFFFF";
	string idle_color = "#FFFFFF";
	string follow_color = "#FFFFFF";
	string slow_color = "#FFFFFF";
	string stop_color = "#FFFFFF";
	string cooldown_color = "#FFFFFF";
	string error_color = "#FFFFFF";
	nh.getParam("/stop_for_person_node/stopped_color", stopped_color);
	nh.getParam("/stop_for_person_node/idle_color", idle_color);
	nh.getParam("/stop_for_person_node/follow_color", follow_color);
	nh.getParam("/stop_for_person_node/slow_color", slow_color);
	nh.getParam("/stop_for_person_node/stop_color", stop_color);
	nh.getParam("/stop_for_person_node/cooldown_color", cooldown_color);
	nh.getParam("/stop_for_person_node/error_color", error_color);

	twist_pub = nh.advertise<geometry_msgs::Twist>(twist_topic, 1000);

	det_sub = nh.subscribe("/follower/detects", 10, box_callback);
	start_sub = nh.subscribe("/follower/start", 10, start_callback);
	stop_sub = nh.subscribe("/follower/stop", 10, stop_callback);

	cur_dist = -1;
	closest_dist = -1;
	cur_pos = 0;
	last_update = ros::Time::now();
	last_proximity_trigger = ros::Time::now();

	disp_msg_pub = nh.advertise<std_msgs::String>(disp_msg_topic, 1000);
	disp_rgb_pub = nh.advertise<std_msgs::String>(disp_rgb_topic, 1000);

	enable_pub = nh.advertise<std_msgs::Empty>(enable_topic, 1000);
	gear_pub = nh.advertise<dbw_polaris_msgs::GearCmd>(gear_topic, 1000);
	brake_pub = nh.advertise<dbw_polaris_msgs::BrakeCmd>(brake_topic, 1000);

	//stopped = false;
	ros::Rate r(looprate);

	send_enable();
	send_gear(4);
	ros::Time enable_tag = ros::Time::now();
	string stopped_reason = "STOPPED";
	while(ros::ok()){
		//Set message template with steering direction
		std_msgs::String str_msg, clr_msg;
		str_msg.data = "ERROR";
		double ang = cur_pos;
		if(ang < -0.5){ // set steering indicators
			str_msg.data = "  |>>";
		}else if(ang < -0.25){
			str_msg.data = "  |> ";
		}else if(ang > 0.5){
			str_msg.data = "<<|  ";
		}else if(ang > 0.25){
			str_msg.data = " <|  ";
		}else{
			str_msg.data = "  |  ";
		}

		double steer_dir = steerMult*(cur_pos);

		//Determine state and actions
		ros::Time cur_time = ros::Time::now();
		if(enable_rate >= 0 && (cur_time - enable_tag) > ros::Duration(enable_rate)){
			send_enable();
			if(active){ send_gear(4); }
			else{ send_gear(3); }
			enable_tag = ros::Time::now();
		}
		if(!active){ //Idle State
			send_twist(0, 0);
			str_msg.data = stopped_reason;
			clr_msg.data = stopped_color;
		}else if(closest_dist <= stop_thresh || cur_dist <= stop_thresh){ //Proximity Trigger
			send_twist(0, steer_dir);
			send_brake(brake_force);
			last_proximity_trigger = ros::Time::now();
			str_msg.data = "STOP";
			clr_msg.data = stop_color;
		}else if(cur_time - last_proximity_trigger <= ros::Duration(proximity_cooldown)){ //Wait after prox trigger before restarting
			send_twist(0, steer_dir);
			int disp = proximity_cooldown - (int)(cur_time - last_proximity_trigger).toSec();
			char disc = to_string(disp)[0];
			str_msg.data[2] = disc;
			clr_msg.data = cooldown_color;
			str_msg.data = "STOP";
			clr_msg.data = stop_color;
		}else if(cur_time - last_update >= ros::Duration(timeout)){ //Timeout if communication stopped
			send_twist(0, 0);
			active = false;
			stopped_reason = "STOPPED: TIMEOUT";
			str_msg.data = "TIMEOUT";
			clr_msg.data = error_color;
		}else if(cur_dist <= 0 || !target_visible){ //Active but no detections
			send_twist(0, 0);
			str_msg.data = "--0--";
			clr_msg.data = idle_color;
		}else if(cur_dist >= target_distance + deadzone && closest_dist > stop_thresh){ //Following detected person
			send_twist(speed, steer_dir);
			str_msg.data[2] = '+';
			//str_msg.data = to_string(cur_dist - deadzone);
			clr_msg.data = follow_color;
		}else if(cur_dist <= target_distance - deadzone && closest_dist > stop_thresh){ //Retreating from detected person
			send_twist(-speed, -steer_dir);
			str_msg.data[2] = '-';
			//str_msg.data = to_string(cur_dist - deadzone);
			clr_msg.data = follow_color;
		}else if(cur_dist <= target_distance + deadzone && cur_dist >= target_distance - deadzone && closest_dist > stop_thresh){ //Idling on target
			send_twist(0, steer_dir);
			str_msg.data[2] = '.';
			//str_msg.data = to_string(cur_dist - deadzone);
			clr_msg.data = follow_color;
		}else{ //Unexpected error
			send_twist(0, 0);
			active = false;
			stopped_reason = "STOPPED: Unknown";
			str_msg.data = "UNKN";
			clr_msg.data = error_color;
		}

		//Display message and color
		//std_msgs::String clr_msg;
		//char hex_str[7];
		//int maxclr = max(cur_r, max(cur_g, cur_b));
		//sprintf(hex_str, "#%02X%02X%02X", cur_r == maxclr ? 255 : 0, cur_g == maxclr ? 255 : 0, cur_b == maxclr ? 255 : 0);
		//clr_msg.data = hex_str;
		if(aruco_visible){ clr_msg.data = cooldown_color; }
		disp_msg_pub.publish(str_msg);
		disp_rgb_pub.publish(clr_msg);

		r.sleep();
		ros::spinOnce();
	}

	//ros::spin();
}
