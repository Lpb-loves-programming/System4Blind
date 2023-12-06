// Generated by gencpp from file nvi_msgs/TargetWaypoint.msg
// DO NOT EDIT!


#ifndef NVI_MSGS_MESSAGE_TARGETWAYPOINT_H
#define NVI_MSGS_MESSAGE_TARGETWAYPOINT_H


#include <string>
#include <vector>
#include <memory>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace nvi_msgs
{
template <class ContainerAllocator>
struct TargetWaypoint_
{
  typedef TargetWaypoint_<ContainerAllocator> Type;

  TargetWaypoint_()
    : x(0.0)
    , y(0.0)
    , z(0.0)  {
    }
  TargetWaypoint_(const ContainerAllocator& _alloc)
    : x(0.0)
    , y(0.0)
    , z(0.0)  {
  (void)_alloc;
    }



   typedef float _x_type;
  _x_type x;

   typedef float _y_type;
  _y_type y;

   typedef float _z_type;
  _z_type z;





  typedef boost::shared_ptr< ::nvi_msgs::TargetWaypoint_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::nvi_msgs::TargetWaypoint_<ContainerAllocator> const> ConstPtr;

}; // struct TargetWaypoint_

typedef ::nvi_msgs::TargetWaypoint_<std::allocator<void> > TargetWaypoint;

typedef boost::shared_ptr< ::nvi_msgs::TargetWaypoint > TargetWaypointPtr;
typedef boost::shared_ptr< ::nvi_msgs::TargetWaypoint const> TargetWaypointConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::nvi_msgs::TargetWaypoint_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::nvi_msgs::TargetWaypoint_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::nvi_msgs::TargetWaypoint_<ContainerAllocator1> & lhs, const ::nvi_msgs::TargetWaypoint_<ContainerAllocator2> & rhs)
{
  return lhs.x == rhs.x &&
    lhs.y == rhs.y &&
    lhs.z == rhs.z;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::nvi_msgs::TargetWaypoint_<ContainerAllocator1> & lhs, const ::nvi_msgs::TargetWaypoint_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace nvi_msgs

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsMessage< ::nvi_msgs::TargetWaypoint_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::nvi_msgs::TargetWaypoint_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::nvi_msgs::TargetWaypoint_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::nvi_msgs::TargetWaypoint_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::nvi_msgs::TargetWaypoint_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::nvi_msgs::TargetWaypoint_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::nvi_msgs::TargetWaypoint_<ContainerAllocator> >
{
  static const char* value()
  {
    return "cc153912f1453b708d221682bc23d9ac";
  }

  static const char* value(const ::nvi_msgs::TargetWaypoint_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xcc153912f1453b70ULL;
  static const uint64_t static_value2 = 0x8d221682bc23d9acULL;
};

template<class ContainerAllocator>
struct DataType< ::nvi_msgs::TargetWaypoint_<ContainerAllocator> >
{
  static const char* value()
  {
    return "nvi_msgs/TargetWaypoint";
  }

  static const char* value(const ::nvi_msgs::TargetWaypoint_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::nvi_msgs::TargetWaypoint_<ContainerAllocator> >
{
  static const char* value()
  {
    return "float32 x\n"
"float32 y\n"
"float32 z \n"
;
  }

  static const char* value(const ::nvi_msgs::TargetWaypoint_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::nvi_msgs::TargetWaypoint_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.x);
      stream.next(m.y);
      stream.next(m.z);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct TargetWaypoint_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::nvi_msgs::TargetWaypoint_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::nvi_msgs::TargetWaypoint_<ContainerAllocator>& v)
  {
    s << indent << "x: ";
    Printer<float>::stream(s, indent + "  ", v.x);
    s << indent << "y: ";
    Printer<float>::stream(s, indent + "  ", v.y);
    s << indent << "z: ";
    Printer<float>::stream(s, indent + "  ", v.z);
  }
};

} // namespace message_operations
} // namespace ros

#endif // NVI_MSGS_MESSAGE_TARGETWAYPOINT_H
