# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "nvi_msgs: 13 messages, 0 services")

set(MSG_I_FLAGS "-Invi_msgs:/home/juhaokun/ros_test/src/nvi_msgs/msg;-Istd_msgs:/opt/ros/noetic/share/std_msgs/cmake/../msg;-Invi_msgs:/home/juhaokun/ros_test/src/nvi_msgs/msg;-Isensor_msgs:/opt/ros/noetic/share/sensor_msgs/cmake/../msg;-Igeometry_msgs:/opt/ros/noetic/share/geometry_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(nvi_msgs_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/juhaokun/ros_test/src/nvi_msgs/msg/stamp_float32array.msg" NAME_WE)
add_custom_target(_nvi_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "nvi_msgs" "/home/juhaokun/ros_test/src/nvi_msgs/msg/stamp_float32array.msg" "std_msgs/Header"
)

get_filename_component(_filename "/home/juhaokun/ros_test/src/nvi_msgs/msg/Object.msg" NAME_WE)
add_custom_target(_nvi_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "nvi_msgs" "/home/juhaokun/ros_test/src/nvi_msgs/msg/Object.msg" ""
)

get_filename_component(_filename "/home/juhaokun/ros_test/src/nvi_msgs/msg/ObjectArray.msg" NAME_WE)
add_custom_target(_nvi_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "nvi_msgs" "/home/juhaokun/ros_test/src/nvi_msgs/msg/ObjectArray.msg" "std_msgs/Header:nvi_msgs/Object"
)

get_filename_component(_filename "/home/juhaokun/ros_test/src/nvi_msgs/msg/Voice.msg" NAME_WE)
add_custom_target(_nvi_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "nvi_msgs" "/home/juhaokun/ros_test/src/nvi_msgs/msg/Voice.msg" "std_msgs/Header"
)

get_filename_component(_filename "/home/juhaokun/ros_test/src/nvi_msgs/msg/GPSTarget.msg" NAME_WE)
add_custom_target(_nvi_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "nvi_msgs" "/home/juhaokun/ros_test/src/nvi_msgs/msg/GPSTarget.msg" "std_msgs/Header:geometry_msgs/Point"
)

get_filename_component(_filename "/home/juhaokun/ros_test/src/nvi_msgs/msg/HeaderString.msg" NAME_WE)
add_custom_target(_nvi_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "nvi_msgs" "/home/juhaokun/ros_test/src/nvi_msgs/msg/HeaderString.msg" "std_msgs/Header"
)

get_filename_component(_filename "/home/juhaokun/ros_test/src/nvi_msgs/msg/HeaderFloat32.msg" NAME_WE)
add_custom_target(_nvi_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "nvi_msgs" "/home/juhaokun/ros_test/src/nvi_msgs/msg/HeaderFloat32.msg" "std_msgs/Header"
)

get_filename_component(_filename "/home/juhaokun/ros_test/src/nvi_msgs/msg/TargetWaypoint.msg" NAME_WE)
add_custom_target(_nvi_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "nvi_msgs" "/home/juhaokun/ros_test/src/nvi_msgs/msg/TargetWaypoint.msg" ""
)

get_filename_component(_filename "/home/juhaokun/ros_test/src/nvi_msgs/msg/TargetPath.msg" NAME_WE)
add_custom_target(_nvi_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "nvi_msgs" "/home/juhaokun/ros_test/src/nvi_msgs/msg/TargetPath.msg" "std_msgs/Header:nvi_msgs/TargetWaypoint"
)

get_filename_component(_filename "/home/juhaokun/ros_test/src/nvi_msgs/msg/RGBDImage.msg" NAME_WE)
add_custom_target(_nvi_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "nvi_msgs" "/home/juhaokun/ros_test/src/nvi_msgs/msg/RGBDImage.msg" "std_msgs/Header:sensor_msgs/Image"
)

get_filename_component(_filename "/home/juhaokun/ros_test/src/nvi_msgs/msg/CompressedRGBDImage.msg" NAME_WE)
add_custom_target(_nvi_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "nvi_msgs" "/home/juhaokun/ros_test/src/nvi_msgs/msg/CompressedRGBDImage.msg" "std_msgs/Header:sensor_msgs/Image:sensor_msgs/CompressedImage"
)

get_filename_component(_filename "/home/juhaokun/ros_test/src/nvi_msgs/msg/Destination.msg" NAME_WE)
add_custom_target(_nvi_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "nvi_msgs" "/home/juhaokun/ros_test/src/nvi_msgs/msg/Destination.msg" "std_msgs/Header"
)

get_filename_component(_filename "/home/juhaokun/ros_test/src/nvi_msgs/msg/Location.msg" NAME_WE)
add_custom_target(_nvi_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "nvi_msgs" "/home/juhaokun/ros_test/src/nvi_msgs/msg/Location.msg" "std_msgs/Header"
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(nvi_msgs
  "/home/juhaokun/ros_test/src/nvi_msgs/msg/stamp_float32array.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/nvi_msgs
)
_generate_msg_cpp(nvi_msgs
  "/home/juhaokun/ros_test/src/nvi_msgs/msg/Object.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/nvi_msgs
)
_generate_msg_cpp(nvi_msgs
  "/home/juhaokun/ros_test/src/nvi_msgs/msg/ObjectArray.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/home/juhaokun/ros_test/src/nvi_msgs/msg/Object.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/nvi_msgs
)
_generate_msg_cpp(nvi_msgs
  "/home/juhaokun/ros_test/src/nvi_msgs/msg/Voice.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/nvi_msgs
)
_generate_msg_cpp(nvi_msgs
  "/home/juhaokun/ros_test/src/nvi_msgs/msg/GPSTarget.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/nvi_msgs
)
_generate_msg_cpp(nvi_msgs
  "/home/juhaokun/ros_test/src/nvi_msgs/msg/HeaderString.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/nvi_msgs
)
_generate_msg_cpp(nvi_msgs
  "/home/juhaokun/ros_test/src/nvi_msgs/msg/HeaderFloat32.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/nvi_msgs
)
_generate_msg_cpp(nvi_msgs
  "/home/juhaokun/ros_test/src/nvi_msgs/msg/TargetWaypoint.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/nvi_msgs
)
_generate_msg_cpp(nvi_msgs
  "/home/juhaokun/ros_test/src/nvi_msgs/msg/TargetPath.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/home/juhaokun/ros_test/src/nvi_msgs/msg/TargetWaypoint.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/nvi_msgs
)
_generate_msg_cpp(nvi_msgs
  "/home/juhaokun/ros_test/src/nvi_msgs/msg/RGBDImage.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/sensor_msgs/cmake/../msg/Image.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/nvi_msgs
)
_generate_msg_cpp(nvi_msgs
  "/home/juhaokun/ros_test/src/nvi_msgs/msg/CompressedRGBDImage.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/sensor_msgs/cmake/../msg/Image.msg;/opt/ros/noetic/share/sensor_msgs/cmake/../msg/CompressedImage.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/nvi_msgs
)
_generate_msg_cpp(nvi_msgs
  "/home/juhaokun/ros_test/src/nvi_msgs/msg/Destination.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/nvi_msgs
)
_generate_msg_cpp(nvi_msgs
  "/home/juhaokun/ros_test/src/nvi_msgs/msg/Location.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/nvi_msgs
)

### Generating Services

### Generating Module File
_generate_module_cpp(nvi_msgs
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/nvi_msgs
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(nvi_msgs_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(nvi_msgs_generate_messages nvi_msgs_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/juhaokun/ros_test/src/nvi_msgs/msg/stamp_float32array.msg" NAME_WE)
add_dependencies(nvi_msgs_generate_messages_cpp _nvi_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/juhaokun/ros_test/src/nvi_msgs/msg/Object.msg" NAME_WE)
add_dependencies(nvi_msgs_generate_messages_cpp _nvi_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/juhaokun/ros_test/src/nvi_msgs/msg/ObjectArray.msg" NAME_WE)
add_dependencies(nvi_msgs_generate_messages_cpp _nvi_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/juhaokun/ros_test/src/nvi_msgs/msg/Voice.msg" NAME_WE)
add_dependencies(nvi_msgs_generate_messages_cpp _nvi_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/juhaokun/ros_test/src/nvi_msgs/msg/GPSTarget.msg" NAME_WE)
add_dependencies(nvi_msgs_generate_messages_cpp _nvi_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/juhaokun/ros_test/src/nvi_msgs/msg/HeaderString.msg" NAME_WE)
add_dependencies(nvi_msgs_generate_messages_cpp _nvi_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/juhaokun/ros_test/src/nvi_msgs/msg/HeaderFloat32.msg" NAME_WE)
add_dependencies(nvi_msgs_generate_messages_cpp _nvi_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/juhaokun/ros_test/src/nvi_msgs/msg/TargetWaypoint.msg" NAME_WE)
add_dependencies(nvi_msgs_generate_messages_cpp _nvi_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/juhaokun/ros_test/src/nvi_msgs/msg/TargetPath.msg" NAME_WE)
add_dependencies(nvi_msgs_generate_messages_cpp _nvi_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/juhaokun/ros_test/src/nvi_msgs/msg/RGBDImage.msg" NAME_WE)
add_dependencies(nvi_msgs_generate_messages_cpp _nvi_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/juhaokun/ros_test/src/nvi_msgs/msg/CompressedRGBDImage.msg" NAME_WE)
add_dependencies(nvi_msgs_generate_messages_cpp _nvi_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/juhaokun/ros_test/src/nvi_msgs/msg/Destination.msg" NAME_WE)
add_dependencies(nvi_msgs_generate_messages_cpp _nvi_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/juhaokun/ros_test/src/nvi_msgs/msg/Location.msg" NAME_WE)
add_dependencies(nvi_msgs_generate_messages_cpp _nvi_msgs_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(nvi_msgs_gencpp)
add_dependencies(nvi_msgs_gencpp nvi_msgs_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS nvi_msgs_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(nvi_msgs
  "/home/juhaokun/ros_test/src/nvi_msgs/msg/stamp_float32array.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/nvi_msgs
)
_generate_msg_eus(nvi_msgs
  "/home/juhaokun/ros_test/src/nvi_msgs/msg/Object.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/nvi_msgs
)
_generate_msg_eus(nvi_msgs
  "/home/juhaokun/ros_test/src/nvi_msgs/msg/ObjectArray.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/home/juhaokun/ros_test/src/nvi_msgs/msg/Object.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/nvi_msgs
)
_generate_msg_eus(nvi_msgs
  "/home/juhaokun/ros_test/src/nvi_msgs/msg/Voice.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/nvi_msgs
)
_generate_msg_eus(nvi_msgs
  "/home/juhaokun/ros_test/src/nvi_msgs/msg/GPSTarget.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/nvi_msgs
)
_generate_msg_eus(nvi_msgs
  "/home/juhaokun/ros_test/src/nvi_msgs/msg/HeaderString.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/nvi_msgs
)
_generate_msg_eus(nvi_msgs
  "/home/juhaokun/ros_test/src/nvi_msgs/msg/HeaderFloat32.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/nvi_msgs
)
_generate_msg_eus(nvi_msgs
  "/home/juhaokun/ros_test/src/nvi_msgs/msg/TargetWaypoint.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/nvi_msgs
)
_generate_msg_eus(nvi_msgs
  "/home/juhaokun/ros_test/src/nvi_msgs/msg/TargetPath.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/home/juhaokun/ros_test/src/nvi_msgs/msg/TargetWaypoint.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/nvi_msgs
)
_generate_msg_eus(nvi_msgs
  "/home/juhaokun/ros_test/src/nvi_msgs/msg/RGBDImage.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/sensor_msgs/cmake/../msg/Image.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/nvi_msgs
)
_generate_msg_eus(nvi_msgs
  "/home/juhaokun/ros_test/src/nvi_msgs/msg/CompressedRGBDImage.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/sensor_msgs/cmake/../msg/Image.msg;/opt/ros/noetic/share/sensor_msgs/cmake/../msg/CompressedImage.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/nvi_msgs
)
_generate_msg_eus(nvi_msgs
  "/home/juhaokun/ros_test/src/nvi_msgs/msg/Destination.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/nvi_msgs
)
_generate_msg_eus(nvi_msgs
  "/home/juhaokun/ros_test/src/nvi_msgs/msg/Location.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/nvi_msgs
)

### Generating Services

### Generating Module File
_generate_module_eus(nvi_msgs
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/nvi_msgs
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(nvi_msgs_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(nvi_msgs_generate_messages nvi_msgs_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/juhaokun/ros_test/src/nvi_msgs/msg/stamp_float32array.msg" NAME_WE)
add_dependencies(nvi_msgs_generate_messages_eus _nvi_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/juhaokun/ros_test/src/nvi_msgs/msg/Object.msg" NAME_WE)
add_dependencies(nvi_msgs_generate_messages_eus _nvi_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/juhaokun/ros_test/src/nvi_msgs/msg/ObjectArray.msg" NAME_WE)
add_dependencies(nvi_msgs_generate_messages_eus _nvi_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/juhaokun/ros_test/src/nvi_msgs/msg/Voice.msg" NAME_WE)
add_dependencies(nvi_msgs_generate_messages_eus _nvi_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/juhaokun/ros_test/src/nvi_msgs/msg/GPSTarget.msg" NAME_WE)
add_dependencies(nvi_msgs_generate_messages_eus _nvi_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/juhaokun/ros_test/src/nvi_msgs/msg/HeaderString.msg" NAME_WE)
add_dependencies(nvi_msgs_generate_messages_eus _nvi_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/juhaokun/ros_test/src/nvi_msgs/msg/HeaderFloat32.msg" NAME_WE)
add_dependencies(nvi_msgs_generate_messages_eus _nvi_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/juhaokun/ros_test/src/nvi_msgs/msg/TargetWaypoint.msg" NAME_WE)
add_dependencies(nvi_msgs_generate_messages_eus _nvi_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/juhaokun/ros_test/src/nvi_msgs/msg/TargetPath.msg" NAME_WE)
add_dependencies(nvi_msgs_generate_messages_eus _nvi_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/juhaokun/ros_test/src/nvi_msgs/msg/RGBDImage.msg" NAME_WE)
add_dependencies(nvi_msgs_generate_messages_eus _nvi_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/juhaokun/ros_test/src/nvi_msgs/msg/CompressedRGBDImage.msg" NAME_WE)
add_dependencies(nvi_msgs_generate_messages_eus _nvi_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/juhaokun/ros_test/src/nvi_msgs/msg/Destination.msg" NAME_WE)
add_dependencies(nvi_msgs_generate_messages_eus _nvi_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/juhaokun/ros_test/src/nvi_msgs/msg/Location.msg" NAME_WE)
add_dependencies(nvi_msgs_generate_messages_eus _nvi_msgs_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(nvi_msgs_geneus)
add_dependencies(nvi_msgs_geneus nvi_msgs_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS nvi_msgs_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(nvi_msgs
  "/home/juhaokun/ros_test/src/nvi_msgs/msg/stamp_float32array.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/nvi_msgs
)
_generate_msg_lisp(nvi_msgs
  "/home/juhaokun/ros_test/src/nvi_msgs/msg/Object.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/nvi_msgs
)
_generate_msg_lisp(nvi_msgs
  "/home/juhaokun/ros_test/src/nvi_msgs/msg/ObjectArray.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/home/juhaokun/ros_test/src/nvi_msgs/msg/Object.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/nvi_msgs
)
_generate_msg_lisp(nvi_msgs
  "/home/juhaokun/ros_test/src/nvi_msgs/msg/Voice.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/nvi_msgs
)
_generate_msg_lisp(nvi_msgs
  "/home/juhaokun/ros_test/src/nvi_msgs/msg/GPSTarget.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/nvi_msgs
)
_generate_msg_lisp(nvi_msgs
  "/home/juhaokun/ros_test/src/nvi_msgs/msg/HeaderString.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/nvi_msgs
)
_generate_msg_lisp(nvi_msgs
  "/home/juhaokun/ros_test/src/nvi_msgs/msg/HeaderFloat32.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/nvi_msgs
)
_generate_msg_lisp(nvi_msgs
  "/home/juhaokun/ros_test/src/nvi_msgs/msg/TargetWaypoint.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/nvi_msgs
)
_generate_msg_lisp(nvi_msgs
  "/home/juhaokun/ros_test/src/nvi_msgs/msg/TargetPath.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/home/juhaokun/ros_test/src/nvi_msgs/msg/TargetWaypoint.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/nvi_msgs
)
_generate_msg_lisp(nvi_msgs
  "/home/juhaokun/ros_test/src/nvi_msgs/msg/RGBDImage.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/sensor_msgs/cmake/../msg/Image.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/nvi_msgs
)
_generate_msg_lisp(nvi_msgs
  "/home/juhaokun/ros_test/src/nvi_msgs/msg/CompressedRGBDImage.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/sensor_msgs/cmake/../msg/Image.msg;/opt/ros/noetic/share/sensor_msgs/cmake/../msg/CompressedImage.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/nvi_msgs
)
_generate_msg_lisp(nvi_msgs
  "/home/juhaokun/ros_test/src/nvi_msgs/msg/Destination.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/nvi_msgs
)
_generate_msg_lisp(nvi_msgs
  "/home/juhaokun/ros_test/src/nvi_msgs/msg/Location.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/nvi_msgs
)

### Generating Services

### Generating Module File
_generate_module_lisp(nvi_msgs
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/nvi_msgs
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(nvi_msgs_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(nvi_msgs_generate_messages nvi_msgs_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/juhaokun/ros_test/src/nvi_msgs/msg/stamp_float32array.msg" NAME_WE)
add_dependencies(nvi_msgs_generate_messages_lisp _nvi_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/juhaokun/ros_test/src/nvi_msgs/msg/Object.msg" NAME_WE)
add_dependencies(nvi_msgs_generate_messages_lisp _nvi_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/juhaokun/ros_test/src/nvi_msgs/msg/ObjectArray.msg" NAME_WE)
add_dependencies(nvi_msgs_generate_messages_lisp _nvi_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/juhaokun/ros_test/src/nvi_msgs/msg/Voice.msg" NAME_WE)
add_dependencies(nvi_msgs_generate_messages_lisp _nvi_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/juhaokun/ros_test/src/nvi_msgs/msg/GPSTarget.msg" NAME_WE)
add_dependencies(nvi_msgs_generate_messages_lisp _nvi_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/juhaokun/ros_test/src/nvi_msgs/msg/HeaderString.msg" NAME_WE)
add_dependencies(nvi_msgs_generate_messages_lisp _nvi_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/juhaokun/ros_test/src/nvi_msgs/msg/HeaderFloat32.msg" NAME_WE)
add_dependencies(nvi_msgs_generate_messages_lisp _nvi_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/juhaokun/ros_test/src/nvi_msgs/msg/TargetWaypoint.msg" NAME_WE)
add_dependencies(nvi_msgs_generate_messages_lisp _nvi_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/juhaokun/ros_test/src/nvi_msgs/msg/TargetPath.msg" NAME_WE)
add_dependencies(nvi_msgs_generate_messages_lisp _nvi_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/juhaokun/ros_test/src/nvi_msgs/msg/RGBDImage.msg" NAME_WE)
add_dependencies(nvi_msgs_generate_messages_lisp _nvi_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/juhaokun/ros_test/src/nvi_msgs/msg/CompressedRGBDImage.msg" NAME_WE)
add_dependencies(nvi_msgs_generate_messages_lisp _nvi_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/juhaokun/ros_test/src/nvi_msgs/msg/Destination.msg" NAME_WE)
add_dependencies(nvi_msgs_generate_messages_lisp _nvi_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/juhaokun/ros_test/src/nvi_msgs/msg/Location.msg" NAME_WE)
add_dependencies(nvi_msgs_generate_messages_lisp _nvi_msgs_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(nvi_msgs_genlisp)
add_dependencies(nvi_msgs_genlisp nvi_msgs_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS nvi_msgs_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(nvi_msgs
  "/home/juhaokun/ros_test/src/nvi_msgs/msg/stamp_float32array.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/nvi_msgs
)
_generate_msg_nodejs(nvi_msgs
  "/home/juhaokun/ros_test/src/nvi_msgs/msg/Object.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/nvi_msgs
)
_generate_msg_nodejs(nvi_msgs
  "/home/juhaokun/ros_test/src/nvi_msgs/msg/ObjectArray.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/home/juhaokun/ros_test/src/nvi_msgs/msg/Object.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/nvi_msgs
)
_generate_msg_nodejs(nvi_msgs
  "/home/juhaokun/ros_test/src/nvi_msgs/msg/Voice.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/nvi_msgs
)
_generate_msg_nodejs(nvi_msgs
  "/home/juhaokun/ros_test/src/nvi_msgs/msg/GPSTarget.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/nvi_msgs
)
_generate_msg_nodejs(nvi_msgs
  "/home/juhaokun/ros_test/src/nvi_msgs/msg/HeaderString.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/nvi_msgs
)
_generate_msg_nodejs(nvi_msgs
  "/home/juhaokun/ros_test/src/nvi_msgs/msg/HeaderFloat32.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/nvi_msgs
)
_generate_msg_nodejs(nvi_msgs
  "/home/juhaokun/ros_test/src/nvi_msgs/msg/TargetWaypoint.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/nvi_msgs
)
_generate_msg_nodejs(nvi_msgs
  "/home/juhaokun/ros_test/src/nvi_msgs/msg/TargetPath.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/home/juhaokun/ros_test/src/nvi_msgs/msg/TargetWaypoint.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/nvi_msgs
)
_generate_msg_nodejs(nvi_msgs
  "/home/juhaokun/ros_test/src/nvi_msgs/msg/RGBDImage.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/sensor_msgs/cmake/../msg/Image.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/nvi_msgs
)
_generate_msg_nodejs(nvi_msgs
  "/home/juhaokun/ros_test/src/nvi_msgs/msg/CompressedRGBDImage.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/sensor_msgs/cmake/../msg/Image.msg;/opt/ros/noetic/share/sensor_msgs/cmake/../msg/CompressedImage.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/nvi_msgs
)
_generate_msg_nodejs(nvi_msgs
  "/home/juhaokun/ros_test/src/nvi_msgs/msg/Destination.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/nvi_msgs
)
_generate_msg_nodejs(nvi_msgs
  "/home/juhaokun/ros_test/src/nvi_msgs/msg/Location.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/nvi_msgs
)

### Generating Services

### Generating Module File
_generate_module_nodejs(nvi_msgs
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/nvi_msgs
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(nvi_msgs_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(nvi_msgs_generate_messages nvi_msgs_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/juhaokun/ros_test/src/nvi_msgs/msg/stamp_float32array.msg" NAME_WE)
add_dependencies(nvi_msgs_generate_messages_nodejs _nvi_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/juhaokun/ros_test/src/nvi_msgs/msg/Object.msg" NAME_WE)
add_dependencies(nvi_msgs_generate_messages_nodejs _nvi_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/juhaokun/ros_test/src/nvi_msgs/msg/ObjectArray.msg" NAME_WE)
add_dependencies(nvi_msgs_generate_messages_nodejs _nvi_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/juhaokun/ros_test/src/nvi_msgs/msg/Voice.msg" NAME_WE)
add_dependencies(nvi_msgs_generate_messages_nodejs _nvi_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/juhaokun/ros_test/src/nvi_msgs/msg/GPSTarget.msg" NAME_WE)
add_dependencies(nvi_msgs_generate_messages_nodejs _nvi_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/juhaokun/ros_test/src/nvi_msgs/msg/HeaderString.msg" NAME_WE)
add_dependencies(nvi_msgs_generate_messages_nodejs _nvi_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/juhaokun/ros_test/src/nvi_msgs/msg/HeaderFloat32.msg" NAME_WE)
add_dependencies(nvi_msgs_generate_messages_nodejs _nvi_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/juhaokun/ros_test/src/nvi_msgs/msg/TargetWaypoint.msg" NAME_WE)
add_dependencies(nvi_msgs_generate_messages_nodejs _nvi_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/juhaokun/ros_test/src/nvi_msgs/msg/TargetPath.msg" NAME_WE)
add_dependencies(nvi_msgs_generate_messages_nodejs _nvi_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/juhaokun/ros_test/src/nvi_msgs/msg/RGBDImage.msg" NAME_WE)
add_dependencies(nvi_msgs_generate_messages_nodejs _nvi_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/juhaokun/ros_test/src/nvi_msgs/msg/CompressedRGBDImage.msg" NAME_WE)
add_dependencies(nvi_msgs_generate_messages_nodejs _nvi_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/juhaokun/ros_test/src/nvi_msgs/msg/Destination.msg" NAME_WE)
add_dependencies(nvi_msgs_generate_messages_nodejs _nvi_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/juhaokun/ros_test/src/nvi_msgs/msg/Location.msg" NAME_WE)
add_dependencies(nvi_msgs_generate_messages_nodejs _nvi_msgs_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(nvi_msgs_gennodejs)
add_dependencies(nvi_msgs_gennodejs nvi_msgs_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS nvi_msgs_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(nvi_msgs
  "/home/juhaokun/ros_test/src/nvi_msgs/msg/stamp_float32array.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/nvi_msgs
)
_generate_msg_py(nvi_msgs
  "/home/juhaokun/ros_test/src/nvi_msgs/msg/Object.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/nvi_msgs
)
_generate_msg_py(nvi_msgs
  "/home/juhaokun/ros_test/src/nvi_msgs/msg/ObjectArray.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/home/juhaokun/ros_test/src/nvi_msgs/msg/Object.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/nvi_msgs
)
_generate_msg_py(nvi_msgs
  "/home/juhaokun/ros_test/src/nvi_msgs/msg/Voice.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/nvi_msgs
)
_generate_msg_py(nvi_msgs
  "/home/juhaokun/ros_test/src/nvi_msgs/msg/GPSTarget.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/nvi_msgs
)
_generate_msg_py(nvi_msgs
  "/home/juhaokun/ros_test/src/nvi_msgs/msg/HeaderString.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/nvi_msgs
)
_generate_msg_py(nvi_msgs
  "/home/juhaokun/ros_test/src/nvi_msgs/msg/HeaderFloat32.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/nvi_msgs
)
_generate_msg_py(nvi_msgs
  "/home/juhaokun/ros_test/src/nvi_msgs/msg/TargetWaypoint.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/nvi_msgs
)
_generate_msg_py(nvi_msgs
  "/home/juhaokun/ros_test/src/nvi_msgs/msg/TargetPath.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/home/juhaokun/ros_test/src/nvi_msgs/msg/TargetWaypoint.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/nvi_msgs
)
_generate_msg_py(nvi_msgs
  "/home/juhaokun/ros_test/src/nvi_msgs/msg/RGBDImage.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/sensor_msgs/cmake/../msg/Image.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/nvi_msgs
)
_generate_msg_py(nvi_msgs
  "/home/juhaokun/ros_test/src/nvi_msgs/msg/CompressedRGBDImage.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/sensor_msgs/cmake/../msg/Image.msg;/opt/ros/noetic/share/sensor_msgs/cmake/../msg/CompressedImage.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/nvi_msgs
)
_generate_msg_py(nvi_msgs
  "/home/juhaokun/ros_test/src/nvi_msgs/msg/Destination.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/nvi_msgs
)
_generate_msg_py(nvi_msgs
  "/home/juhaokun/ros_test/src/nvi_msgs/msg/Location.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/nvi_msgs
)

### Generating Services

### Generating Module File
_generate_module_py(nvi_msgs
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/nvi_msgs
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(nvi_msgs_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(nvi_msgs_generate_messages nvi_msgs_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/juhaokun/ros_test/src/nvi_msgs/msg/stamp_float32array.msg" NAME_WE)
add_dependencies(nvi_msgs_generate_messages_py _nvi_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/juhaokun/ros_test/src/nvi_msgs/msg/Object.msg" NAME_WE)
add_dependencies(nvi_msgs_generate_messages_py _nvi_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/juhaokun/ros_test/src/nvi_msgs/msg/ObjectArray.msg" NAME_WE)
add_dependencies(nvi_msgs_generate_messages_py _nvi_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/juhaokun/ros_test/src/nvi_msgs/msg/Voice.msg" NAME_WE)
add_dependencies(nvi_msgs_generate_messages_py _nvi_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/juhaokun/ros_test/src/nvi_msgs/msg/GPSTarget.msg" NAME_WE)
add_dependencies(nvi_msgs_generate_messages_py _nvi_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/juhaokun/ros_test/src/nvi_msgs/msg/HeaderString.msg" NAME_WE)
add_dependencies(nvi_msgs_generate_messages_py _nvi_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/juhaokun/ros_test/src/nvi_msgs/msg/HeaderFloat32.msg" NAME_WE)
add_dependencies(nvi_msgs_generate_messages_py _nvi_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/juhaokun/ros_test/src/nvi_msgs/msg/TargetWaypoint.msg" NAME_WE)
add_dependencies(nvi_msgs_generate_messages_py _nvi_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/juhaokun/ros_test/src/nvi_msgs/msg/TargetPath.msg" NAME_WE)
add_dependencies(nvi_msgs_generate_messages_py _nvi_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/juhaokun/ros_test/src/nvi_msgs/msg/RGBDImage.msg" NAME_WE)
add_dependencies(nvi_msgs_generate_messages_py _nvi_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/juhaokun/ros_test/src/nvi_msgs/msg/CompressedRGBDImage.msg" NAME_WE)
add_dependencies(nvi_msgs_generate_messages_py _nvi_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/juhaokun/ros_test/src/nvi_msgs/msg/Destination.msg" NAME_WE)
add_dependencies(nvi_msgs_generate_messages_py _nvi_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/juhaokun/ros_test/src/nvi_msgs/msg/Location.msg" NAME_WE)
add_dependencies(nvi_msgs_generate_messages_py _nvi_msgs_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(nvi_msgs_genpy)
add_dependencies(nvi_msgs_genpy nvi_msgs_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS nvi_msgs_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/nvi_msgs)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/nvi_msgs
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(nvi_msgs_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()
if(TARGET nvi_msgs_generate_messages_cpp)
  add_dependencies(nvi_msgs_generate_messages_cpp nvi_msgs_generate_messages_cpp)
endif()
if(TARGET sensor_msgs_generate_messages_cpp)
  add_dependencies(nvi_msgs_generate_messages_cpp sensor_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/nvi_msgs)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/nvi_msgs
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(nvi_msgs_generate_messages_eus std_msgs_generate_messages_eus)
endif()
if(TARGET nvi_msgs_generate_messages_eus)
  add_dependencies(nvi_msgs_generate_messages_eus nvi_msgs_generate_messages_eus)
endif()
if(TARGET sensor_msgs_generate_messages_eus)
  add_dependencies(nvi_msgs_generate_messages_eus sensor_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/nvi_msgs)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/nvi_msgs
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(nvi_msgs_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()
if(TARGET nvi_msgs_generate_messages_lisp)
  add_dependencies(nvi_msgs_generate_messages_lisp nvi_msgs_generate_messages_lisp)
endif()
if(TARGET sensor_msgs_generate_messages_lisp)
  add_dependencies(nvi_msgs_generate_messages_lisp sensor_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/nvi_msgs)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/nvi_msgs
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(nvi_msgs_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()
if(TARGET nvi_msgs_generate_messages_nodejs)
  add_dependencies(nvi_msgs_generate_messages_nodejs nvi_msgs_generate_messages_nodejs)
endif()
if(TARGET sensor_msgs_generate_messages_nodejs)
  add_dependencies(nvi_msgs_generate_messages_nodejs sensor_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/nvi_msgs)
  install(CODE "execute_process(COMMAND \"/usr/bin/python3\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/nvi_msgs\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/nvi_msgs
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(nvi_msgs_generate_messages_py std_msgs_generate_messages_py)
endif()
if(TARGET nvi_msgs_generate_messages_py)
  add_dependencies(nvi_msgs_generate_messages_py nvi_msgs_generate_messages_py)
endif()
if(TARGET sensor_msgs_generate_messages_py)
  add_dependencies(nvi_msgs_generate_messages_py sensor_msgs_generate_messages_py)
endif()
