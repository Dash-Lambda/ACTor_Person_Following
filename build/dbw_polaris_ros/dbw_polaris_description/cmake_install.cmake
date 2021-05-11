# Install script for directory: /home/mpleune/lfa_ws/ACTor_Person_Following/src/dbw_polaris_ros/dbw_polaris_description

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
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/home/mpleune/lfa_ws/ACTor_Person_Following/build/dbw_polaris_ros/dbw_polaris_description/catkin_generated/installspace/dbw_polaris_description.pc")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/dbw_polaris_description/cmake" TYPE FILE FILES
    "/home/mpleune/lfa_ws/ACTor_Person_Following/build/dbw_polaris_ros/dbw_polaris_description/catkin_generated/installspace/dbw_polaris_descriptionConfig.cmake"
    "/home/mpleune/lfa_ws/ACTor_Person_Following/build/dbw_polaris_ros/dbw_polaris_description/catkin_generated/installspace/dbw_polaris_descriptionConfig-version.cmake"
    )
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/dbw_polaris_description" TYPE FILE FILES "/home/mpleune/lfa_ws/ACTor_Person_Following/src/dbw_polaris_ros/dbw_polaris_description/package.xml")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/dbw_polaris_description" TYPE DIRECTORY FILES
    "/home/mpleune/lfa_ws/ACTor_Person_Following/src/dbw_polaris_ros/dbw_polaris_description/meshes"
    "/home/mpleune/lfa_ws/ACTor_Person_Following/src/dbw_polaris_ros/dbw_polaris_description/urdf"
    "/home/mpleune/lfa_ws/ACTor_Person_Following/src/dbw_polaris_ros/dbw_polaris_description/launch"
    REGEX "/[^/]*\\.tar\\.gz$" EXCLUDE)
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  include("/home/mpleune/lfa_ws/ACTor_Person_Following/build/dbw_polaris_ros/dbw_polaris_description/tests/cmake_install.cmake")

endif()

