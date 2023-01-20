#! /bin/bash
this_script_path="$(realpath $BASH_SOURCE)"
scripts_path=$(dirname $this_script_path) 
export ROS2_WS_DIR=$(dirname $scripts_path)
# echo `dirname $this_script_path`
echo "now ros2_ws_dir is: $ROS2_WS_DIR"
export PATH=$PATH:$scripts_path
# export ROS2_WS_DIR=