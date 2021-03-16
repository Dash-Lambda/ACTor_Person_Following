#include <ros/ros.h>
#include <time.h>
#include <geometry_msgs/TwistStamped.h>
#include <actor_person_following/Detection.h>
#include <actor_person_following/Detections.h>
#include <std_msgs/Bool.h>
#include <std_msgs/String.h>
#include <std_msgs/ColorRGBA.h>
#include <string>
#include <iostream>

#include <dbw_polaris_msgs/ThrottleCmd.h>
#include <dbw_polaris_msgs/BrakeCmd.h>
#include <dbw_polaris_msgs/SteeringCmd.h>
#include <dbw_polaris_msgs/GearCmd.h>

using namespace std;

ros::Publisher twist_pub, disp_msg_pub, disp_rgb_pub;
ros::Subscriber det_sub, start_sub;
bool stopped;

double cur_wid, cur_pos;
int cur_r, cur_g, cur_b, clr_sel, clr_fallback;
ros::Time last_update, last_proximity_trigger;

string twist_topic, start_topic, disp_msg_topic, disp_rgb_topic;
double stop_thresh, speed, steerMult, timeout, looprate, proximity_cooldown, smoothing_timeout;

void sendTwist(double spd, double dir){
	geometry_msgs::TwistStamped twist_msg;
	twist_msg.twist.linear.x = spd;
	twist_msg.twist.angular.z = dir;
	twist_pub.publish(twist_msg);
}

void box_callback(const actor_person_following::Detections::ConstPtr& boxes_msg){
	//actor_person_following::Detection box_msg = boxes_msg->detections[boxes_msg->closest];
	//cur_wid = box_msg.width;
	//cur_pos = box_msg.center;
	//cur_r = box_msg.r;
	//cur_g = box_msg.g;
	//cur_b = box_msg.b;
	if(boxes_msg->num_detects > 0){
		int target_ind = -1;
		double target_max = -1;
		for(int i = 0; i < boxes_msg->num_detects; i++){
			actor_person_following::Detection tmp = boxes_msg->detections[i];
			bool clr_chk = false;
			switch(clr_sel){
				case 0: clr_chk = tmp.r >= max(tmp.g, tmp.b);
					break;
				case 1: clr_chk = tmp.g >= max(tmp.r, tmp.b);
					break;
				case 2: clr_chk = tmp.b >= max(tmp.g, tmp.r);
					break;
				default: clr_chk = true;
			}
			if(clr_chk && tmp.width > target_max){
				target_ind = i;
				target_max = tmp.width;
			}
		}
		cur_wid = boxes_msg->detections[boxes_msg->closest].width;
		actor_person_following::Detection box_msg = target_ind >= 0 ? boxes_msg->detections[target_ind] : boxes_msg->detections[boxes_msg->closest];
		if(target_ind >= 0 || (ros::Time::now() - last_update > ros::Duration(smoothing_timeout) && clr_fallback == 1)){
			cur_pos = box_msg.center;
			cur_r = box_msg.r;
			cur_g = box_msg.g;
			cur_b = box_msg.b;
			last_update = ros::Time::now();
		}else if(target_ind < 0 || (ros::Time::now() - last_update > ros::Duration(smoothing_timeout) && clr_fallback == 0)){
			cur_wid = -1;
			last_update = ros::Time::now();
		}
	}else if(ros::Time::now() - last_update > ros::Duration(smoothing_timeout)){
		cur_wid = -1;
		last_update = ros::Time::now();
	}
}

void start_callback(const std_msgs::Bool::ConstPtr& start){
	stopped = !start->data;
}

int main(int argc, char* argv[])
{
	ros::init(argc, argv, "stop_for_person_node");
	ros::NodeHandle nh;

	twist_topic = "/follower/twist_default";
	start_topic = "/follower/start_default";
	disp_msg_topic = "/follower/disp_msg_default";
	disp_rgb_topic = "/follower/disp_rgb_default";
	stop_thresh = 0;
	speed = 0.2;
	steerMult = 0;
	timeout = 0;
	looprate = 10;
	proximity_cooldown = 1;
	smoothing_timeout = 0;
	clr_sel = 0;
	clr_fallback = 0;

	nh.getParam("/stop_for_person_node/color_fallback", clr_fallback);
	nh.getParam("/stop_for_person_node/color_sel", clr_sel);
	nh.getParam("/stop_for_person_node/twist_topic", twist_topic);
	nh.getParam("/stop_for_person_node/start_topic", start_topic);
	nh.getParam("/stop_for_person_node/disp_msg_topic", disp_msg_topic);
	nh.getParam("/stop_for_person_node/disp_rgb_topic", disp_rgb_topic);
	nh.getParam("/stop_for_person_node/stop_thresh", stop_thresh);
	nh.getParam("/stop_for_person_node/speed", speed);
	nh.getParam("/stop_for_person_node/steerMult", steerMult);
	nh.getParam("/stop_for_person_node/timeout", timeout);
	nh.getParam("/stop_for_person_node/looprate", looprate);
	nh.getParam("/stop_for_person_node/proximity_cooldown", proximity_cooldown);
	nh.getParam("/stop_for_person_node/smoothing_timeout", smoothing_timeout);
	int stop_init = 0;
	nh.getParam("/stop_for_person_node/start_active", stop_init);
	stopped = stop_init == 0;

	twist_pub = nh.advertise<geometry_msgs::TwistStamped>(twist_topic, 1000);

	det_sub = nh.subscribe("/follower/detects", 10, box_callback);
	start_sub = nh.subscribe(start_topic, 10, start_callback);

	cur_wid = -1;
	cur_pos = 0;
	last_update = ros::Time::now();
	last_proximity_trigger = ros::Time::now();

	//changeGear(DRIVE);

	disp_msg_pub = nh.advertise<std_msgs::String>(disp_msg_topic, 1000);
	disp_rgb_pub = nh.advertise<std_msgs::String>(disp_rgb_topic, 1000);

	//stopped = false;
	ros::Rate r(looprate);
	while(ros::ok()){
		//Set message template with steering direction
		std_msgs::String str_msg;
		str_msg.data = "ERROR";
		double ang = steerMult*cur_pos;
		if(ang < -0.5){
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

		//Determine state and actions
		ros::Time cur_time = ros::Time::now();
		if(stopped){ //Idle State
			sendTwist(0, 0);
			str_msg.data = "IDLE";
		}else if(cur_wid >= stop_thresh){ //Proximity Trigger
			sendTwist(0, steerMult*cur_pos);
			last_proximity_trigger = ros::Time::now();
			str_msg.data = "STOP";
		}else if(cur_time - last_proximity_trigger <= ros::Duration(proximity_cooldown)){ //Wait after prox trigger before restarting
			sendTwist(0, steerMult*cur_pos);
			int disp = proximity_cooldown - (int)(cur_time - last_proximity_trigger).toSec();
			char disc = to_string(disp)[0];
			str_msg.data[2] = disc;
		}else if(cur_time - last_update >= ros::Duration(timeout)){ //Timeout if communication stopped
			sendTwist(0, 0);
			stopped = true;
			str_msg.data = "TIMEOUT";
		}else if(cur_wid <= 0){ //Active but no detections
			sendTwist(0, 0);
			str_msg.data = "--0--";
		}else if(cur_wid > 0 && cur_wid < stop_thresh){ //Following detected person
			sendTwist(speed, steerMult*cur_pos);
			str_msg.data[2] = '^';
		}else{ //Unexpected error
			sendTwist(0, 0);
			stopped = true;
			str_msg.data = "UNKN";
		}

		//Display message and color
		std_msgs::String clr_msg;
		char hex_str[7];
		int maxclr = max(cur_r, max(cur_g, cur_b));
		sprintf(hex_str, "#%02X%02X%02X", cur_r == maxclr ? 255 : 0, cur_g == maxclr ? 255 : 0, cur_b == maxclr ? 255 : 0);
		clr_msg.data = hex_str;
		disp_msg_pub.publish(str_msg);
		disp_rgb_pub.publish(clr_msg);

		r.sleep();
		ros::spinOnce();
	}

	//ros::spin();
}
