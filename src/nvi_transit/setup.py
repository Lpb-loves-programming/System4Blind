#!/usr/bin/env python

import os
import sys
CURRENT_DIR = os.path.dirname(os.path.abspath(__file__))
sys.path.append(CURRENT_DIR)
from code_genertaion import NVITransitCodeGenerator
edge_file_path = CURRENT_DIR + '/scripts/nvi_transit_edge_node.py'
server_file_path = CURRENT_DIR + '/scripts/nvi_transit_server_node.py'
transit_msgs_file_path = CURRENT_DIR + '/src/transit/ros_msgs_transit.py'
transit_msg_config_path = CURRENT_DIR + '/config/transit_msg.json'
code_generator = NVITransitCodeGenerator(edge_file_path,server_file_path,transit_msgs_file_path,transit_msg_config_path)
code_generator.generate()

from distutils.core import setup
from catkin_pkg.python_setup import generate_distutils_setup

d = generate_distutils_setup(
    packages=['transit'],
    package_dir={'': 'src'}
)

setup(**d)
