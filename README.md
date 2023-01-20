# Training ROS from zero to hero 

## Preview: 

The learning material of ros basics is scattered along the internet and there are many tutorials and guides to start your learning. Some of them are more reading oriented, and some are more hands-on command-typing oriented. In order to really get the gist of ros it’s important to master both of these methods - understanding the principles behind it and the tools that comes with it, and how to use them efficiently in your development process. In order to do that we’re trying a some sort of hybrid learning -  learning hands-on from the ros official docs, and digging a little deeper into the main concepts from a blog called  “[articulated robotics](https://articulatedrobotics.xyz/)”. The training will go back and forth between them. It’s okay to not fully understand the concepts after the hands-on tutorials, as you should have some more insights on them in the “articulated robotics” blog, and you’re more than welcome to continue reading on the concepts more than what’s described in the blog.  For the grand finale you’ll have a fun exercise to implement these concepts.  Enjoy!  

## Training Flow:

1. To start - Install ros2 environment. It’s most easy to use a docker with a development environment  for the tutorials and to ease the learning process. You can find it here -  [https://docs.ros.org/en/galactic/How-To-Guides/Run-2-nodes-in-single-or-separate-docker-containers.html](https://docs.ros.org/en/galactic/How-To-Guides/Run-2-nodes-in-single-or-separate-docker-containers.html)

    Make sure you’re able to run their examples and then continue on, and that you’re able to run the docker with a simple script.

2. Next, start learning the basics of ros2 from the official tutorials - [https://docs.ros.org/en/galactic/Tutorials/Beginner-CLI-Tools.html](https://docs.ros.org/en/galactic/Tutorials/Beginner-CLI-Tools.html). 

    Read the “configuring environment” tutorial to know what happens inside your docker, but i’m pretty sure everything should be already configured inside it. 


    You’ll face some trouble when dealing with running inside a docker and using graphics (rqt, rviz, gazebo, etc…). When you’re facing it - first try to use this post 


    [https://roboticseabass.com/2021/04/21/docker-and-ros/](https://roboticseabass.com/2021/04/21/docker-and-ros/) 


    And then **Ask For Help**.  **REMEMBER**  it’s not the main business of the training. 

3. Now go through [https://articulatedrobotics.xyz/ready-for-ros-4-ros-overview/](https://articulatedrobotics.xyz/ready-for-ros-4-ros-overview/) , and [https://articulatedrobotics.xyz/ready-for-ros-5-packages/](https://articulatedrobotics.xyz/ready-for-ros-5-packages/) . These should help you understand a little better what you’ve done in the tutorials, and get you started with packages and workspaces in ros.

    Next, go through  [https://docs.ros.org/en/galactic/Tutorials/Beginner-Client-Libraries.html](https://docs.ros.org/en/galactic/Tutorials/Beginner-Client-Libraries.html)


    You can skip the cpp parts (as we mainly write in python), and the for the first two, you’ve done with “articulate robotics” so the important ones are - 

    1. “Writing a simple publisher and subscriber (python)” 
    2. “Writing a simple service and client (python)” 
    3. “Creating a custom msg and srv files” 
    4. **Skip** - “implementing custom interfaces (but know that it is possible and useful in some cases)” 
    5. “Using parameters in a class (python)”
    6. “Using ros2doctor to identify issues”  


4. You’re now officially not a beginner in ros2 ! (or at least as the official docs say). Now we will start the summarizing training exercise - 


## Summarizing exercise

### Purpose

The exercise should include the following elements - 

1. Ros2 basics - launch files, pub-sub, parameters, services 
2. Ros system design thinking - node separation by responsibility and a healthy data flow.  
3. Ardupilot integration with ros. 
4. gazebo
5. Tf (hopefully)

### The exercise in a sentence

“A copter tracking a ground robot above him at a given height”

### Important Resources
1. The project sources 
2. Ros2 gazebo pkgs migration page - [https://github.com/ros-simulation/gazebo_ros_pkgs/wiki](https://github.com/ros-simulation/gazebo_ros_pkgs/wiki) 
3. The internet

### Prerequisites

1. Ardupilot prerequisite - 
    1. A working model of the copter in gazebo
    2. SITL controlling it 
    3. Ardupilot-python wrapper controlling system (or a good familiarization with mavros, although the exercise will not assume any usage of it)    
2. ros2-basics 
3. Demo nav2 robot model in gazebo and with the right launch files. odom -> base_link (on your instructor, should be in the training project). 

### Exercise Flow 

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
6. Use the training workspace - check that you can control your ground robot with rviz and nav2 go-to points. 
    1. Learn about the basics of tf using the links - [https://docs.ros.org/en/galactic/Tutorials/Intermediate/Tf2/Introduction-To-Tf2.html](https://docs.ros.org/en/galactic/Tutorials/Intermediate/Tf2/Introduction-To-Tf2.html)

        [https://articulatedrobotics.xyz/ready-for-ros-6-tf/](https://articulatedrobotics.xyz/ready-for-ros-6-tf/)

    2. View the tf tree and understand it using tf-tools. 
    3. Now spawn your drone sdf into the simulation (use the same way as in the tutorial bringup). Make sure you are still able to communicate with your drone in the same way. For this stage, checkout to ardupilot_training_add_on to save some devops installation time. 
7. Wrap it all together - 
    1. Listen for tf from the vehicle
    2. Choose a good tf frame to work with - which frame is it? THINK: It should be easy from this frame to transfer it to lat,long coordinates. Transform the robot location to this frame using tf to and from this frame create a listener which transforms this tf to lat, long.  
    3. Send the lat, long of the vehicle to the drone to track it. And voila! You should have a tracking copter on your ground robot. 