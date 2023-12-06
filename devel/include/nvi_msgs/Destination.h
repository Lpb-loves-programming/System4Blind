// Generated by gencpp from file nvi_msgs/Destination.msg
// DO NOT EDIT!


#ifndef NVI_MSGS_MESSAGE_DESTINATION_H
#define NVI_MSGS_MESSAGE_DESTINATION_H


#include <string>
#include <vector>
#include <memory>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>

#include <std_msgs/Header.h>

namespace nvi_msgs
{
template <class ContainerAllocator>
struct Destination_
{
  typedef Destination_<ContainerAllocator> Type;

  Destination_()
    : header()
    , name()
    , latitude(0.0)
    , longitude(0.0)
    , start_latitude(0.0)
    , start_longitude(0.0)  {
    }
  Destination_(const ContainerAllocator& _alloc)
    : header(_alloc)
    , name(_alloc)
    , latitude(0.0)
    , longitude(0.0)
    , start_latitude(0.0)
    , start_longitude(0.0)  {
  (void)_alloc;
    }



   typedef  ::std_msgs::Header_<ContainerAllocator>  _header_type;
  _header_type header;

   typedef std::basic_string<char, std::char_traits<char>, typename std::allocator_traits<ContainerAllocator>::template rebind_alloc<char>> _name_type;
  _name_type name;

   typedef float _latitude_type;
  _latitude_type latitude;

   typedef float _longitude_type;
  _longitude_type longitude;

   typedef float _start_latitude_type;
  _start_latitude_type start_latitude;

   typedef float _start_longitude_type;
  _start_longitude_type start_longitude;





  typedef boost::shared_ptr< ::nvi_msgs::Destination_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::nvi_msgs::Destination_<ContainerAllocator> const> ConstPtr;

}; // struct Destination_

typedef ::nvi_msgs::Destination_<std::allocator<void> > Destination;

typedef boost::shared_ptr< ::nvi_msgs::Destination > DestinationPtr;
typedef boost::shared_ptr< ::nvi_msgs::Destination const> DestinationConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::nvi_msgs::Destination_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::nvi_msgs::Destination_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::nvi_msgs::Destination_<ContainerAllocator1> & lhs, const ::nvi_msgs::Destination_<ContainerAllocator2> & rhs)
{
  return lhs.header == rhs.header &&
    lhs.name == rhs.name &&
    lhs.latitude == rhs.latitude &&
    lhs.longitude == rhs.longitude &&
    lhs.start_latitude == rhs.start_latitude &&
    lhs.start_longitude == rhs.start_longitude;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::nvi_msgs::Destination_<ContainerAllocator1> & lhs, const ::nvi_msgs::Destination_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace nvi_msgs

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsMessage< ::nvi_msgs::Destination_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::nvi_msgs::Destination_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::nvi_msgs::Destination_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::nvi_msgs::Destination_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::nvi_msgs::Destination_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::nvi_msgs::Destination_<ContainerAllocator> const>
  : TrueType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::nvi_msgs::Destination_<ContainerAllocator> >
{
  static const char* value()
  {
    return "9957a16a6d36235ddf7370da61eab599";
  }

  static const char* value(const ::nvi_msgs::Destination_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x9957a16a6d36235dULL;
  static const uint64_t static_value2 = 0xdf7370da61eab599ULL;
};

template<class ContainerAllocator>
struct DataType< ::nvi_msgs::Destination_<ContainerAllocator> >
{
  static const char* value()
  {
    return "nvi_msgs/Destination";
  }

  static const char* value(const ::nvi_msgs::Destination_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::nvi_msgs::Destination_<ContainerAllocator> >
{
  static const char* value()
  {
    return "Header header\n"
"string name\n"
"float32 latitude\n"
"float32 longitude\n"
"float32 start_latitude\n"
"float32 start_longitude\n"
"================================================================================\n"
"MSG: std_msgs/Header\n"
"# Standard metadata for higher-level stamped data types.\n"
"# This is generally used to communicate timestamped data \n"
"# in a particular coordinate frame.\n"
"# \n"
"# sequence ID: consecutively increasing ID \n"
"uint32 seq\n"
"#Two-integer timestamp that is expressed as:\n"
"# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')\n"
"# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')\n"
"# time-handling sugar is provided by the client library\n"
"time stamp\n"
"#Frame this data is associated with\n"
"string frame_id\n"
;
  }

  static const char* value(const ::nvi_msgs::Destination_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::nvi_msgs::Destination_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.header);
      stream.next(m.name);
      stream.next(m.latitude);
      stream.next(m.longitude);
      stream.next(m.start_latitude);
      stream.next(m.start_longitude);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct Destination_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::nvi_msgs::Destination_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::nvi_msgs::Destination_<ContainerAllocator>& v)
  {
    s << indent << "header: ";
    s << std::endl;
    Printer< ::std_msgs::Header_<ContainerAllocator> >::stream(s, indent + "  ", v.header);
    s << indent << "name: ";
    Printer<std::basic_string<char, std::char_traits<char>, typename std::allocator_traits<ContainerAllocator>::template rebind_alloc<char>>>::stream(s, indent + "  ", v.name);
    s << indent << "latitude: ";
    Printer<float>::stream(s, indent + "  ", v.latitude);
    s << indent << "longitude: ";
    Printer<float>::stream(s, indent + "  ", v.longitude);
    s << indent << "start_latitude: ";
    Printer<float>::stream(s, indent + "  ", v.start_latitude);
    s << indent << "start_longitude: ";
    Printer<float>::stream(s, indent + "  ", v.start_longitude);
  }
};

} // namespace message_operations
} // namespace ros

#endif // NVI_MSGS_MESSAGE_DESTINATION_H
