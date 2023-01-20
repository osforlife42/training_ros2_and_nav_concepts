FROM althack/ros2:galactic-dev 

# ** major installations  **
#
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update \
   && apt-get -y install --no-install-recommends ros-galactic-nav2* \
   ros-galactic-turtlebot3* 
   
# per-project installations
RUN apt-get update \ 
   && apt-get -y install --no-install-recommends ros-${ROS_DISTRO}-joint-state-publisher-gui \
   ros-${ROS_DISTRO}-xacro 

# cleanup 
RUN apt-get autoremove -y \
   && apt-get clean -y \
   && rm -rf /var/lib/apt/lists/*

ENV DEBIAN_FRONTEND=dialog

# Set up auto-source of workspace for ros user
USER ros

ARG WORKSPACE="/home/ros/dev_ws/"
RUN mkdir -p ${WORKSPACE}

COPY setup_docker_env.sh /tmp/
RUN /tmp/setup_docker_env.sh
WORKDIR ${WORKSPACE}
RUN echo "if [ -f ${WORKSPACE}/install/setup.bash ]; then source ${WORKSPACE}/install/setup.bash; fi" >> /home/ros/.bashrc
