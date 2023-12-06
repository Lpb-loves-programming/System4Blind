# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "ntrip_ros: 2 messages, 0 services")

set(MSG_I_FLAGS "-Intrip_ros:/home/juhaokun/ros_test/src/rtk/NTRIP_ROS/src/msg;-Istd_msgs:/opt/ros/noetic/share/std_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(ntrip_ros_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/juhaokun/ros_test/src/rtk/NTRIP_ROS/src/msg/GnssPVTSolnMsg.msg" NAME_WE)
add_custom_target(_ntrip_ros_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "ntrip_ros" "/home/juhaokun/ros_test/src/rtk/NTRIP_ROS/src/msg/GnssPVTSolnMsg.msg" "ntrip_ros/GnssTimeMsg"
)

get_filename_component(_filename "/home/juhaokun/ros_test/src/rtk/NTRIP_ROS/src/msg/GnssTimeMsg.msg" NAME_WE)
add_custom_target(_ntrip_ros_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "ntrip_ros" "/home/juhaokun/ros_test/src/rtk/NTRIP_ROS/src/msg/GnssTimeMsg.msg" ""
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(ntrip_ros
  "/home/juhaokun/ros_test/src/rtk/NTRIP_ROS/src/msg/GnssPVTSolnMsg.msg"
  "${MSG_I_FLAGS}"
  "/home/juhaokun/ros_test/src/rtk/NTRIP_ROS/src/msg/GnssTimeMsg.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/ntrip_ros
)
_generate_msg_cpp(ntrip_ros
  "/home/juhaokun/ros_test/src/rtk/NTRIP_ROS/src/msg/GnssTimeMsg.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/ntrip_ros
)

### Generating Services

### Generating Module File
_generate_module_cpp(ntrip_ros
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/ntrip_ros
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(ntrip_ros_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(ntrip_ros_generate_messages ntrip_ros_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/juhaokun/ros_test/src/rtk/NTRIP_ROS/src/msg/GnssPVTSolnMsg.msg" NAME_WE)
add_dependencies(ntrip_ros_generate_messages_cpp _ntrip_ros_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/juhaokun/ros_test/src/rtk/NTRIP_ROS/src/msg/GnssTimeMsg.msg" NAME_WE)
add_dependencies(ntrip_ros_generate_messages_cpp _ntrip_ros_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(ntrip_ros_gencpp)
add_dependencies(ntrip_ros_gencpp ntrip_ros_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS ntrip_ros_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(ntrip_ros
  "/home/juhaokun/ros_test/src/rtk/NTRIP_ROS/src/msg/GnssPVTSolnMsg.msg"
  "${MSG_I_FLAGS}"
  "/home/juhaokun/ros_test/src/rtk/NTRIP_ROS/src/msg/GnssTimeMsg.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/ntrip_ros
)
_generate_msg_eus(ntrip_ros
  "/home/juhaokun/ros_test/src/rtk/NTRIP_ROS/src/msg/GnssTimeMsg.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/ntrip_ros
)

### Generating Services

### Generating Module File
_generate_module_eus(ntrip_ros
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/ntrip_ros
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(ntrip_ros_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(ntrip_ros_generate_messages ntrip_ros_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/juhaokun/ros_test/src/rtk/NTRIP_ROS/src/msg/GnssPVTSolnMsg.msg" NAME_WE)
add_dependencies(ntrip_ros_generate_messages_eus _ntrip_ros_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/juhaokun/ros_test/src/rtk/NTRIP_ROS/src/msg/GnssTimeMsg.msg" NAME_WE)
add_dependencies(ntrip_ros_generate_messages_eus _ntrip_ros_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(ntrip_ros_geneus)
add_dependencies(ntrip_ros_geneus ntrip_ros_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS ntrip_ros_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(ntrip_ros
  "/home/juhaokun/ros_test/src/rtk/NTRIP_ROS/src/msg/GnssPVTSolnMsg.msg"
  "${MSG_I_FLAGS}"
  "/home/juhaokun/ros_test/src/rtk/NTRIP_ROS/src/msg/GnssTimeMsg.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/ntrip_ros
)
_generate_msg_lisp(ntrip_ros
  "/home/juhaokun/ros_test/src/rtk/NTRIP_ROS/src/msg/GnssTimeMsg.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/ntrip_ros
)

### Generating Services

### Generating Module File
_generate_module_lisp(ntrip_ros
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/ntrip_ros
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(ntrip_ros_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(ntrip_ros_generate_messages ntrip_ros_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/juhaokun/ros_test/src/rtk/NTRIP_ROS/src/msg/GnssPVTSolnMsg.msg" NAME_WE)
add_dependencies(ntrip_ros_generate_messages_lisp _ntrip_ros_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/juhaokun/ros_test/src/rtk/NTRIP_ROS/src/msg/GnssTimeMsg.msg" NAME_WE)
add_dependencies(ntrip_ros_generate_messages_lisp _ntrip_ros_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(ntrip_ros_genlisp)
add_dependencies(ntrip_ros_genlisp ntrip_ros_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS ntrip_ros_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(ntrip_ros
  "/home/juhaokun/ros_test/src/rtk/NTRIP_ROS/src/msg/GnssPVTSolnMsg.msg"
  "${MSG_I_FLAGS}"
  "/home/juhaokun/ros_test/src/rtk/NTRIP_ROS/src/msg/GnssTimeMsg.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/ntrip_ros
)
_generate_msg_nodejs(ntrip_ros
  "/home/juhaokun/ros_test/src/rtk/NTRIP_ROS/src/msg/GnssTimeMsg.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/ntrip_ros
)

### Generating Services

### Generating Module File
_generate_module_nodejs(ntrip_ros
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/ntrip_ros
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(ntrip_ros_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(ntrip_ros_generate_messages ntrip_ros_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/juhaokun/ros_test/src/rtk/NTRIP_ROS/src/msg/GnssPVTSolnMsg.msg" NAME_WE)
add_dependencies(ntrip_ros_generate_messages_nodejs _ntrip_ros_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/juhaokun/ros_test/src/rtk/NTRIP_ROS/src/msg/GnssTimeMsg.msg" NAME_WE)
add_dependencies(ntrip_ros_generate_messages_nodejs _ntrip_ros_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(ntrip_ros_gennodejs)
add_dependencies(ntrip_ros_gennodejs ntrip_ros_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS ntrip_ros_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(ntrip_ros
  "/home/juhaokun/ros_test/src/rtk/NTRIP_ROS/src/msg/GnssPVTSolnMsg.msg"
  "${MSG_I_FLAGS}"
  "/home/juhaokun/ros_test/src/rtk/NTRIP_ROS/src/msg/GnssTimeMsg.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/ntrip_ros
)
_generate_msg_py(ntrip_ros
  "/home/juhaokun/ros_test/src/rtk/NTRIP_ROS/src/msg/GnssTimeMsg.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/ntrip_ros
)

### Generating Services

### Generating Module File
_generate_module_py(ntrip_ros
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/ntrip_ros
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(ntrip_ros_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(ntrip_ros_generate_messages ntrip_ros_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/juhaokun/ros_test/src/rtk/NTRIP_ROS/src/msg/GnssPVTSolnMsg.msg" NAME_WE)
add_dependencies(ntrip_ros_generate_messages_py _ntrip_ros_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/juhaokun/ros_test/src/rtk/NTRIP_ROS/src/msg/GnssTimeMsg.msg" NAME_WE)
add_dependencies(ntrip_ros_generate_messages_py _ntrip_ros_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(ntrip_ros_genpy)
add_dependencies(ntrip_ros_genpy ntrip_ros_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS ntrip_ros_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/ntrip_ros)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/ntrip_ros
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(ntrip_ros_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/ntrip_ros)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/ntrip_ros
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(ntrip_ros_generate_messages_eus std_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/ntrip_ros)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/ntrip_ros
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(ntrip_ros_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/ntrip_ros)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/ntrip_ros
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(ntrip_ros_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/ntrip_ros)
  install(CODE "execute_process(COMMAND \"/usr/bin/python3\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/ntrip_ros\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/ntrip_ros
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(ntrip_ros_generate_messages_py std_msgs_generate_messages_py)
endif()
