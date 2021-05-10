# Install script for directory: /home/mpleune/lfa_ws/ACTor_Person_Following/src

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/home/mpleune/lfa_ws/ACTor_Person_Following/install")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "1")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  
      if (NOT EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}")
        file(MAKE_DIRECTORY "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}")
      endif()
      if (NOT EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/.catkin")
        file(WRITE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/.catkin" "")
      endif()
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/home/mpleune/lfa_ws/ACTor_Person_Following/install/_setup_util.py")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
file(INSTALL DESTINATION "/home/mpleune/lfa_ws/ACTor_Person_Following/install" TYPE PROGRAM FILES "/home/mpleune/lfa_ws/ACTor_Person_Following/build/catkin_generated/installspace/_setup_util.py")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/home/mpleune/lfa_ws/ACTor_Person_Following/install/env.sh")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
file(INSTALL DESTINATION "/home/mpleune/lfa_ws/ACTor_Person_Following/install" TYPE PROGRAM FILES "/home/mpleune/lfa_ws/ACTor_Person_Following/build/catkin_generated/installspace/env.sh")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/home/mpleune/lfa_ws/ACTor_Person_Following/install/setup.bash;/home/mpleune/lfa_ws/ACTor_Person_Following/install/local_setup.bash")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
file(INSTALL DESTINATION "/home/mpleune/lfa_ws/ACTor_Person_Following/install" TYPE FILE FILES
    "/home/mpleune/lfa_ws/ACTor_Person_Following/build/catkin_generated/installspace/setup.bash"
    "/home/mpleune/lfa_ws/ACTor_Person_Following/build/catkin_generated/installspace/local_setup.bash"
    )
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/home/mpleune/lfa_ws/ACTor_Person_Following/install/setup.sh;/home/mpleune/lfa_ws/ACTor_Person_Following/install/local_setup.sh")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
file(INSTALL DESTINATION "/home/mpleune/lfa_ws/ACTor_Person_Following/install" TYPE FILE FILES
    "/home/mpleune/lfa_ws/ACTor_Person_Following/build/catkin_generated/installspace/setup.sh"
    "/home/mpleune/lfa_ws/ACTor_Person_Following/build/catkin_generated/installspace/local_setup.sh"
    )
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/home/mpleune/lfa_ws/ACTor_Person_Following/install/setup.zsh;/home/mpleune/lfa_ws/ACTor_Person_Following/install/local_setup.zsh")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
file(INSTALL DESTINATION "/home/mpleune/lfa_ws/ACTor_Person_Following/install" TYPE FILE FILES
    "/home/mpleune/lfa_ws/ACTor_Person_Following/build/catkin_generated/installspace/setup.zsh"
    "/home/mpleune/lfa_ws/ACTor_Person_Following/build/catkin_generated/installspace/local_setup.zsh"
    )
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/home/mpleune/lfa_ws/ACTor_Person_Following/install/.rosinstall")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
file(INSTALL DESTINATION "/home/mpleune/lfa_ws/ACTor_Person_Following/install" TYPE FILE FILES "/home/mpleune/lfa_ws/ACTor_Person_Following/build/catkin_generated/installspace/.rosinstall")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  include("/home/mpleune/lfa_ws/ACTor_Person_Following/build/gtest/cmake_install.cmake")
  include("/home/mpleune/lfa_ws/ACTor_Person_Following/build/aruco_eye/aruco_eye/cmake_install.cmake")
  include("/home/mpleune/lfa_ws/ACTor_Person_Following/build/aruco_eye/aruco_lib/cmake_install.cmake")
  include("/home/mpleune/lfa_ws/ACTor_Person_Following/build/dataspeed_can/dataspeed_can/cmake_install.cmake")
  include("/home/mpleune/lfa_ws/ACTor_Person_Following/build/dbw_polaris_ros/dbw_polaris/cmake_install.cmake")
  include("/home/mpleune/lfa_ws/ACTor_Person_Following/build/lusb/cmake_install.cmake")
  include("/home/mpleune/lfa_ws/ACTor_Person_Following/build/pugixml/cmake_install.cmake")
  include("/home/mpleune/lfa_ws/ACTor_Person_Following/build/aruco_eye/aruco_eye_core/cmake_install.cmake")
  include("/home/mpleune/lfa_ws/ACTor_Person_Following/build/dbw_polaris_ros/dbw_polaris_msgs/cmake_install.cmake")
  include("/home/mpleune/lfa_ws/ACTor_Person_Following/build/robot_component_srvs/cmake_install.cmake")
  include("/home/mpleune/lfa_ws/ACTor_Person_Following/build/dataspeed_can/dataspeed_can_msg_filters/cmake_install.cmake")
  include("/home/mpleune/lfa_ws/ACTor_Person_Following/build/dataspeed_can/dataspeed_can_usb/cmake_install.cmake")
  include("/home/mpleune/lfa_ws/ACTor_Person_Following/build/dataspeed_can/dataspeed_can_tools/cmake_install.cmake")
  include("/home/mpleune/lfa_ws/ACTor_Person_Following/build/darknet_ros/darknet_ros_msgs/cmake_install.cmake")
  include("/home/mpleune/lfa_ws/ACTor_Person_Following/build/dbw_polaris_ros/dbw_polaris_can/cmake_install.cmake")
  include("/home/mpleune/lfa_ws/ACTor_Person_Following/build/dbw_polaris_ros/dbw_polaris_joystick_demo/cmake_install.cmake")
  include("/home/mpleune/lfa_ws/ACTor_Person_Following/build/darknet_ros/darknet_ros/cmake_install.cmake")
  include("/home/mpleune/lfa_ws/ACTor_Person_Following/build/perception_msgs/cmake_install.cmake")
  include("/home/mpleune/lfa_ws/ACTor_Person_Following/build/simple_camera_publisher/cmake_install.cmake")
  include("/home/mpleune/lfa_ws/ACTor_Person_Following/build/aruco_eye/aruco_eye_ros/cmake_install.cmake")
  include("/home/mpleune/lfa_ws/ACTor_Person_Following/build/actor_person_following/cmake_install.cmake")
  include("/home/mpleune/lfa_ws/ACTor_Person_Following/build/dbw_polaris_ros/dbw_polaris_description/cmake_install.cmake")

endif()

if(CMAKE_INSTALL_COMPONENT)
  set(CMAKE_INSTALL_MANIFEST "install_manifest_${CMAKE_INSTALL_COMPONENT}.txt")
else()
  set(CMAKE_INSTALL_MANIFEST "install_manifest.txt")
endif()

string(REPLACE ";" "\n" CMAKE_INSTALL_MANIFEST_CONTENT
       "${CMAKE_INSTALL_MANIFEST_FILES}")
file(WRITE "/home/mpleune/lfa_ws/ACTor_Person_Following/build/${CMAKE_INSTALL_MANIFEST}"
     "${CMAKE_INSTALL_MANIFEST_CONTENT}")
