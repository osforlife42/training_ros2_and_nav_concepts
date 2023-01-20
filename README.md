# Training ROS2 and nav concepts

## Project intention
This project is meant for educational and training purposes. The training material is located under training folder. Start reading from there and come back to this README.md when instructed to in the training. 

## Installation and getting started
To clone and build the relevant docker images - 

```
git clone https://github.com/osforlife42/training_ros2_and_nav_concepts.git
cd training_ros2_and_nav_concepts
source ./scripts/setup_host_env.sh
build_training_ws.sh
```

To run the docker with all the capabilities, volumes needed for ros2 inside docker just type: ```run_training_ws.sh```  

(To learn more about what's starting the project look into the scripts folder).

For starters, inside the docker, build the workspace packages and then run 
```
ros2 launch training_bringup training_tb3_sim_launch.py
``` 

This launch file should be very similar to the [nav2 documentation](https://navigation.ros.org/getting_started/index.html) one. So use it as your main source of information about what's been done here under the hood. 

