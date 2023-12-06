// Generated by gencpp from file nvi_msgs/GPSTarget.msg
// DO NOT EDIT!


#ifndef NVI_MSGS_MESSAGE_GPSTARGET_H
#define NVI_MSGS_MESSAGE_GPSTARGET_H


#include <string>
#include <vector>
#include <memory>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>

#include <std_msgs/Header.h>
#include <geometry_msgs/Point.h>

namespace nvi_msgs
{
template <class ContainerAllocator>
struct GPSTarget_
{
  typedef GPSTarget_<ContainerAllocator> Type;

  GPSTarget_()
    : header()
    , status(0)
    , direction()
    , distance(0.0)  {
    }
  GPSTarget_(const ContainerAllocator& _alloc)
    : header(_alloc)
    , status(0)
    , direction(_alloc)
    , distance(0.0)  {
  (void)_alloc;
    }



   typedef  ::std_msgs::Header_<ContainerAllocator>  _header_type;
  _header_type header;

   typedef int8_t _status_type;
  _status_type status;

   typedef  ::geometry_msgs::Point_<ContainerAllocator>  _direction_type;
  _direction_type direction;

   typedef float _distance_type;
  _distance_type distance;





  typedef boost::shared_ptr< ::nvi_msgs::GPSTarget_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::nvi_msgs::GPSTarget_<ContainerAllocator> const> ConstPtr;

}; // struct GPSTarget_

typedef ::nvi_msgs::GPSTarget_<std::allocator<void> > GPSTarget;

typedef boost::shared_ptr< ::nvi_msgs::GPSTarget > GPSTargetPtr;
typedef boost::shared_ptr< ::nvi_msgs::GPSTarget const> GPSTargetConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::nvi_msgs::GPSTarget_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::nvi_msgs::GPSTarget_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::nvi_msgs::GPSTarget_<ContainerAllocator1> & lhs, const ::nvi_msgs::GPSTarget_<ContainerAllocator2> & rhs)
{
  return lhs.header == rhs.header &&
    lhs.status == rhs.status &&
    lhs.direction == rhs.direction &&
    lhs.distance == rhs.distance;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::nvi_msgs::GPSTarget_<ContainerAllocator1> & lhs, const ::nvi_msgs::GPSTarget_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace nvi_msgs

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsMessage< ::nvi_msgs::GPSTarget_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::nvi_msgs::GPSTarget_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::nvi_msgs::GPSTarget_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::nvi_msgs::GPSTarget_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::nvi_msgs::GPSTarget_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::nvi_msgs::GPSTarget_<ContainerAllocator> const>
  : TrueType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::nvi_msgs::GPSTarget_<ContainerAllocator> >
{
  static const char* value()
  {
    return "acf0cdadcfb95c9af35e46b027089605";
  }

  static const char* value(const ::nvi_msgs::GPSTarget_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xacf0cdadcfb95c9aULL;
  static const uint64_t static_value2 = 0xf35e46b027089605ULL;
};

template<class ContainerAllocator>
struct DataType< ::nvi_msgs::GPSTarget_<ContainerAllocator> >
{
  static const char* value()
  {
    return "nvi_msgs/GPSTarget";
  }

  static const char* value(const ::nvi_msgs::GPSTarget_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::nvi_msgs::GPSTarget_<ContainerAllocator> >
{
  static const char* value()
  {
    return "Header header\n"
"int8 status\n"
"geometry_msgs/Point direction # target under vio coordinate  \n"
"# float32 direction_x \n"
"# float32 direction_y # target under vio coordinate\n"
"float32 distance # target\n"
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
"\n"
"================================================================================\n"
"MSG: geometry_msgs/Point\n"
"# This contains the position of a point in free space\n"
"float64 x\n"
"float64 y\n"
"float64 z\n"
;
  }

  static const char* value(const ::nvi_msgs::GPSTarget_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::nvi_msgs::GPSTarget_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.header);
      stream.next(m.status);
      stream.next(m.direction);
      stream.next(m.distance);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct GPSTarget_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::nvi_msgs::GPSTarget_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::nvi_msgs::GPSTarget_<ContainerAllocator>& v)
  {
    s << indent << "header: ";
    s << std::endl;
    Printer< ::std_msgs::Header_<ContainerAllocator> >::stream(s, indent + "  ", v.header);
    s << indent << "status: ";
    Printer<int8_t>::stream(s, indent + "  ", v.status);
    s << indent << "direction: ";
    s << std::endl;
    Printer< ::geometry_msgs::Point_<ContainerAllocator> >::stream(s, indent + "  ", v.direction);
    s << indent << "distance: ";
    Printer<float>::stream(s, indent + "  ", v.distance);
  }
};

} // namespace message_operations
} // namespace ros

#endif // NVI_MSGS_MESSAGE_GPSTARGET_H