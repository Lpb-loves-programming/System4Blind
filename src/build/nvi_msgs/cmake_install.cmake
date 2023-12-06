# Install script for directory: /home/juhaokun/ros_test/src/nvi_msgs

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/usr/local")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "Debug")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "1")
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/nvi_msgs/msg" TYPE FILE FILES
    "/home/juhaokun/ros_test/src/nvi_msgs/msg/stamp_float32array.msg"
    "/home/juhaokun/ros_test/src/nvi_msgs/msg/Object.msg"
    "/home/juhaokun/ros_test/src/nvi_msgs/msg/ObjectArray.msg"
    "/home/juhaokun/ros_test/src/nvi_msgs/msg/Voice.msg"
    "/home/juhaokun/ros_test/src/nvi_msgs/msg/GPSTarget.msg"
    "/home/juhaokun/ros_test/src/nvi_msgs/msg/HeaderString.msg"
    "/home/juhaokun/ros_test/src/nvi_msgs/msg/HeaderFloat32.msg"
    "/home/juhaokun/ros_test/src/nvi_msgs/msg/TargetWaypoint.msg"
    "/home/juhaokun/ros_test/src/nvi_msgs/msg/TargetPath.msg"
    "/home/juhaokun/ros_test/src/nvi_msgs/msg/RGBDImage.msg"
    "/home/juhaokun/ros_test/src/nvi_msgs/msg/CompressedRGBDImage.msg"
    "/home/juhaokun/ros_test/src/nvi_msgs/msg/Destination.msg"
    "/home/juhaokun/ros_test/src/nvi_msgs/msg/Location.msg"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/nvi_msgs/cmake" TYPE FILE FILES "/home/juhaokun/ros_test/src/build/nvi_msgs/catkin_generated/installspace/nvi_msgs-msg-paths.cmake")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE DIRECTORY FILES "/home/juhaokun/ros_test/src/build/devel/include/nvi_msgs")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/roseus/ros" TYPE DIRECTORY FILES "/home/juhaokun/ros_test/src/build/devel/share/roseus/ros/nvi_msgs")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/common-lisp/ros" TYPE DIRECTORY FILES "/home/juhaokun/ros_test/src/build/devel/share/common-lisp/ros/nvi_msgs")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/gennodejs/ros" TYPE DIRECTORY FILES "/home/juhaokun/ros_test/src/build/devel/share/gennodejs/ros/nvi_msgs")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  execute_process(COMMAND "/usr/bin/python3" -m compileall "/home/juhaokun/ros_test/src/build/devel/lib/python3/dist-packages/nvi_msgs")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/python3/dist-packages" TYPE DIRECTORY FILES "/home/juhaokun/ros_test/src/build/devel/lib/python3/dist-packages/nvi_msgs")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/home/juhaokun/ros_test/src/build/nvi_msgs/catkin_generated/installspace/nvi_msgs.pc")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/nvi_msgs/cmake" TYPE FILE FILES "/home/juhaokun/ros_test/src/build/nvi_msgs/catkin_generated/installspace/nvi_msgs-msg-extras.cmake")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/nvi_msgs/cmake" TYPE FILE FILES
    "/home/juhaokun/ros_test/src/build/nvi_msgs/catkin_generated/installspace/nvi_msgsConfig.cmake"
    "/home/juhaokun/ros_test/src/build/nvi_msgs/catkin_generated/installspace/nvi_msgsConfig-version.cmake"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/nvi_msgs" TYPE FILE FILES "/home/juhaokun/ros_test/src/nvi_msgs/package.xml")
endif()

