#! /bin/bash
echo "export TURTLEBOT3_MODEL=waffle " >> ~/.bashrc
echo "export GAZEBO_MODEL_PATH=\$GAZEBO_MODEL_PATH:/opt/ros/galactic/share/turtlebot3_gazebo/models:" >> ~/.bashrc
echo "source /usr/share/gazebo/setup.sh" >> ~/.bashrc
# echo "export GAZEBO_MODEL_PATH=\$GAZEBO_MODEL_PATH:/opt/ros/galactic/share/turtlebot3_gazebo/models" >> ~/.bashrc

# echo "source /opt/ros/noetic/setup.sh" >> ~/.bashrc
echo "source /opt/ros/galactic/setup.sh" >> ~/.bashrc
echo "source /usr/share/colcon_cd/function/colcon_cd.sh" >> ~/.bashrc
echo "export _colcon_cd_root=${WORKSPACE}" >> ~/.bashrc


# echo "export GAZEBO_RESOURCE_PATH=\$GAZEBO_RESOURCE_PATH:${WORKSPACE}/docker_save/models" >> ~/.bashrc
# echo "export GAZEBO_RESOURCE_PATH=\$GAZEBO_RESOURCE_PATH:/opt/ros/galactic/share/turtlebot3_gazebo/models" >> ~/.bashrc
