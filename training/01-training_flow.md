# Training ROS - from zero to hero 

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


4. You’re now officially not a beginner in ros2 ! (or at least as the official docs say). Now you may start the summarizing training exercise! 