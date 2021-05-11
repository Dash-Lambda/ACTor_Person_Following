# -*- coding: utf-8 -*-
from __future__ import print_function

import os
import stat
import sys

# find the import for catkin's python package - either from source space or from an installed underlay
if os.path.exists(os.path.join('/opt/ros/kinetic/share/catkin/cmake', 'catkinConfig.cmake.in')):
    sys.path.insert(0, os.path.join('/opt/ros/kinetic/share/catkin/cmake', '..', 'python'))
try:
    from catkin.environment_cache import generate_environment_script
except ImportError:
    # search for catkin package in all workspaces and prepend to path
    for workspace in '/home/mpleune/lfa_ws/ACTor_Person_Following/devel;/home/mpleune/LTU-Actor/devel_isolated/sign_detection;/home/mpleune/LTU-Actor/devel_isolated/ltu_actor_vehicle_gem;/home/mpleune/LTU-Actor/devel_isolated/ltu_actor_rpi_gpio;/home/mpleune/LTU-Actor/devel_isolated/ltu_actor_rpi_estop_loop;/home/mpleune/LTU-Actor/devel_isolated/ltu_actor_route_obstacle;/home/mpleune/LTU-Actor/devel_isolated/ltu_actor_route_blob;/home/mpleune/LTU-Actor/devel_isolated/ltu_actor_inputprocess_camadjust;/home/mpleune/LTU-Actor/devel_isolated/ltu_actor_graph;/home/mpleune/LTU-Actor/devel_isolated/ltu_actor_estop;/home/mpleune/LTU-Actor/devel_isolated/ltu_actor_core;/home/mpleune/LTU-Actor/devel_isolated/image_proc;/home/mpleune/LTU-Actor/devel_isolated/dbw_gem_twist_example;/home/mpleune/LTU-Actor/devel_isolated/dbw_gem_twist_controller;/home/mpleune/LTU-Actor/devel_isolated/dbw_gem_joystick_demo;/home/mpleune/LTU-Actor/devel_isolated/dbw_gem_can;/home/mpleune/LTU-Actor/devel_isolated/dbw_gem_msgs;/home/mpleune/LTU-Actor/devel_isolated/dbw_gem;/home/mpleune/LTU-Actor/devel_isolated/camera_calibration;/home/mpleune/LTU-Actor/devel_isolated/avt_vimba_camera;/home/mpleune/LTU-Actor/devel_isolated/adap_parameter;/opt/ros/kinetic'.split(';'):
        python_path = os.path.join(workspace, 'lib/python2.7/dist-packages')
        if os.path.isdir(os.path.join(python_path, 'catkin')):
            sys.path.insert(0, python_path)
            break
    from catkin.environment_cache import generate_environment_script

code = generate_environment_script('/home/mpleune/lfa_ws/ACTor_Person_Following/devel/env.sh')

output_filename = '/home/mpleune/lfa_ws/ACTor_Person_Following/build/catkin_generated/setup_cached.sh'
with open(output_filename, 'w') as f:
    # print('Generate script for cached setup "%s"' % output_filename)
    f.write('\n'.join(code))

mode = os.stat(output_filename).st_mode
os.chmod(output_filename, mode | stat.S_IXUSR)
