# Summarizing exercise

## Purpose

The exercise should include the following elements - 

1. Ros2 basics - launch files, pub-sub, parameters, services 
2. Ros system design thinking - node separation by responsibility and a healthy data flow.  
3. Ardupilot integration with ros. 
4. gazebo
5. Tf (hopefully)

## The exercise in a sentence

“A copter tracking a ground robot above him at a given height”

## Important Resources
1. The project sources 
2. Ros2 gazebo pkgs migration page - [https://github.com/ros-simulation/gazebo_ros_pkgs/wiki](https://github.com/ros-simulation/gazebo_ros_pkgs/wiki) 
3. The internet

## Prerequisites

1. Ardupilot prerequisite - 
    1. A working model of the copter in gazebo
    2. SITL controlling it 
    3. Ardupilot-python wrapper controlling system (or a good familiarization with mavros, although the exercise will not assume any usage of it)    
2. ros2-basics 
3. Demo nav2 robot model in gazebo and with the right launch files. odom -> base_link (on your instructor, should be in the training project). 

## Exercise Flow 

****CAUTION**** -  the exercise should FLOW, if in some way you feel stuck make sure to ask for help. It’s very easy and tempting to get stuck at some devops problems or over demanding at this kind of work, but it's important to be mission oriented at the task at hand. 

1. Make sure that your ardupilot-python program can send the drone to go-to a location and that it follows as expected in the gazebo simulator. Also, check that it is able to stop a current mission / go-to and send a new location. Both are mandatory for the rest of the exercise. 
2. Create your own mavros, meaning wrap your ardupilot-python in a ros node inside a package with a proper launch file. Make sure you’re using the API of your framework, **and not changing it**. 
3. Now let’s add some ros elements to it - 
    1. Create a service server which receives a global position point (lat, long, alt) and sends the drone to this point. (even if it is already going to another location). Check it using ros2 cli.  \
Create a dedicated ros2 package for the messages you’ll use in communicating with your ardupilot-ros node.    
    2. Now if we want to track a moving target - a service isn’t the right approach to set a new location (if the location updates rapidly it might send a lot of service requests). Let’s use pub-sub here. Let the mavlink node subscribe to a lat,long message and every second update the ardupilot go-to based on the last location received (**Think**: why not every time that we received a new location - we send it to the ardupilot ?). For now assume that the height of the tracking is constant.
    3. Now let’s say the height of the tracking is controlled by the user, and is mainly configured before each flight and sometimes can be changed by the user using GUI. In what ros tool would you use? Incorporate it in the code, and check that it works as expected. 
4. Now let’s mimic the api of a ground tracker vehicle. It is not related to the mavlink node as the data can come from another source (some algorithm or as we’ll see shortly, from the ground vehicle itself) -  
    1. Write  a simple node that publishes a moving target (lat,lon) at a reasonable speed from a given constant starting position.
    2. Check that when you run it your drone follows the published point. And when you stop, your drone stops somewhat above it. 
5. And finally let’s add our ground robot ! Now we have two options here - the ardupilot way or the ros way. Consult your instructor on which way to use (depends on the time budget, project for you to be placed in and your personal needs). The rest of this exercise will continue with the ros way.   
6. Use the training project and especially the training_bringup package - check that you can control your ground robot with rviz and nav2 go-to points (Now go back to the project README.md to start working on it). 
    1. Learn about the basics of tf using the links - [https://docs.ros.org/en/galactic/Tutorials/Intermediate/Tf2/Introduction-To-Tf2.html](https://docs.ros.org/en/galactic/Tutorials/Intermediate/Tf2/Introduction-To-Tf2.html)

        [https://articulatedrobotics.xyz/ready-for-ros-6-tf/](https://articulatedrobotics.xyz/ready-for-ros-6-tf/)

    2. View the tf tree and understand it using tf-tools. 
    3. Now spawn your drone sdf into the simulation (use the same way as in the tutorial bringup). Make sure you are still able to communicate with your drone in the same way. For this stage, checkout to ardupilot_training_add_on to save some devops installation time. 
7. Wrap it all together - 
    1. Listen for tf from the vehicle
    2. Choose a good tf frame to work with - which frame is it? THINK: It should be easy from this frame to transfer it to lat,long coordinates. Transform the robot location to this frame using tf to and from this frame create a listener which transforms this tf to lat, long.  
    3. Send the lat, long of the vehicle to the drone to track it. And voila! You should have a tracking copter on your ground robot. 