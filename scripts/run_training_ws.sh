#!/bin/bash
xhost + 
docker run --rm -it -u ros --network host  \
-v "/tmp/.X11-unix:/tmp/.X11-unix" -e DISPLAY=$DISPLAY --volume "/dev/:/dev/" \
--volume "$ROS2_WS_DIR/src/:/home/ros/dev_ws/src/:rw"  --volume "$ROS2_WS_DIR/install/:/home/ros/dev_ws/install/:rw" --volume "$ROS2_WS_DIR/docker_save/:/home/ros/dev_ws/docker_save/:rw" \
--volume "$ROS2_WS_DIR/docker_build/:/home/ros/dev_ws/build/:rw" \
training_nav2_docker:latest