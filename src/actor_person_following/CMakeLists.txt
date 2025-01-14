cmake_minimum_required(VERSION 3.0.2)
project(actor_person_following)

add_compile_options(-std=c++11)

find_package(catkin REQUIRED COMPONENTS
  darknet_ros_msgs
  roscpp
  rospy
  sensor_msgs
  std_msgs
  message_generation
  dbw_polaris_msgs
  cv_bridge
  image_transport
)

find_package(OpenCV REQUIRED)

add_message_files(
  FILES
  Detection.msg
  Detections.msg
  Lidar_Point.msg
  Lidar_Points.msg
  Pose_Point.msg
  Pose_Points.msg
)

generate_messages(
  DEPENDENCIES
    std_msgs
    darknet_ros_msgs
    perception_msgs
)

catkin_package(
#  INCLUDE_DIRS include
#  LIBRARIES actor_person_following
#  CATKIN_DEPENDS darknet_ros/darknet_ros_msgs/ roscpp rospy std_msgs message_runtime
  CATKIN_DEPENDS message_runtime
#                 roscpp
#                 sensor_msgs
#                 std_msgs
#                 cv_bridge
#                 image_transport
#  DEPENDS system_lib
)

include_directories(
# include
  ${catkin_INCLUDE_DIRS}
  ${OpenCV_INCLUDE_DIRS}
  
)

add_executable(detection_reporter_node src/detection_reporter_node.cpp)
target_link_libraries(detection_reporter_node ${catkin_LIBRARIES})
add_dependencies(detection_reporter_node
  actor_person_following_generate_messages_cpp
)

add_executable(stop_for_person_node src/stop_for_person_node.cpp)
target_link_libraries(stop_for_person_node ${catkin_LIBRARIES})
add_dependencies(stop_for_person_node
  actor_person_following_generate_messages_cpp
)

add_executable(lidar_node src/lidar_node.cpp)
target_link_libraries(lidar_node ${catkin_LIBRARIES})
add_dependencies(lidar_node
  actor_person_following_generate_messages_cpp
)

add_executable(detection_image_viewer_node src/detection_image_viewer_node.cpp)
target_link_libraries(detection_image_viewer_node ${catkin_LIBRARIES})
target_link_libraries(detection_image_viewer_node ${OpenCV_LIBS})
add_dependencies(detection_image_viewer_node
  actor_person_following_generate_messages_cpp
)
