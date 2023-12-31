// Generated by gencpp from file nvi_msgs/Object.msg
// DO NOT EDIT!


#ifndef NVI_MSGS_MESSAGE_OBJECT_H
#define NVI_MSGS_MESSAGE_OBJECT_H


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
struct Object_
{
  typedef Object_<ContainerAllocator> Type;

  Object_()
    : semantic()
    , direction(0)
    , distance(0.0)  {
    }
  Object_(const ContainerAllocator& _alloc)
    : semantic(_alloc)
    , direction(0)
    , distance(0.0)  {
  (void)_alloc;
    }



   typedef std::basic_string<char, std::char_traits<char>, typename std::allocator_traits<ContainerAllocator>::template rebind_alloc<char>> _semantic_type;
  _semantic_type semantic;

   typedef int8_t _direction_type;
  _direction_type direction;

   typedef float _distance_type;
  _distance_type distance;





  typedef boost::shared_ptr< ::nvi_msgs::Object_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::nvi_msgs::Object_<ContainerAllocator> const> ConstPtr;

}; // struct Object_

typedef ::nvi_msgs::Object_<std::allocator<void> > Object;

typedef boost::shared_ptr< ::nvi_msgs::Object > ObjectPtr;
typedef boost::shared_ptr< ::nvi_msgs::Object const> ObjectConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::nvi_msgs::Object_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::nvi_msgs::Object_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::nvi_msgs::Object_<ContainerAllocator1> & lhs, const ::nvi_msgs::Object_<ContainerAllocator2> & rhs)
{
  return lhs.semantic == rhs.semantic &&
    lhs.direction == rhs.direction &&
    lhs.distance == rhs.distance;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::nvi_msgs::Object_<ContainerAllocator1> & lhs, const ::nvi_msgs::Object_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace nvi_msgs

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsMessage< ::nvi_msgs::Object_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::nvi_msgs::Object_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::nvi_msgs::Object_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::nvi_msgs::Object_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::nvi_msgs::Object_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::nvi_msgs::Object_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::nvi_msgs::Object_<ContainerAllocator> >
{
  static const char* value()
  {
    return "4029a610397d831f579f9e308ca4493c";
  }

  static const char* value(const ::nvi_msgs::Object_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x4029a610397d831fULL;
  static const uint64_t static_value2 = 0x579f9e308ca4493cULL;
};

template<class ContainerAllocator>
struct DataType< ::nvi_msgs::Object_<ContainerAllocator> >
{
  static const char* value()
  {
    return "nvi_msgs/Object";
  }

  static const char* value(const ::nvi_msgs::Object_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::nvi_msgs::Object_<ContainerAllocator> >
{
  static const char* value()
  {
    return "string semantic\n"
"int8 direction\n"
"float32 distance\n"
;
  }

  static const char* value(const ::nvi_msgs::Object_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::nvi_msgs::Object_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.semantic);
      stream.next(m.direction);
      stream.next(m.distance);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct Object_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::nvi_msgs::Object_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::nvi_msgs::Object_<ContainerAllocator>& v)
  {
    s << indent << "semantic: ";
    Printer<std::basic_string<char, std::char_traits<char>, typename std::allocator_traits<ContainerAllocator>::template rebind_alloc<char>>>::stream(s, indent + "  ", v.semantic);
    s << indent << "direction: ";
    Printer<int8_t>::stream(s, indent + "  ", v.direction);
    s << indent << "distance: ";
    Printer<float>::stream(s, indent + "  ", v.distance);
  }
};

} // namespace message_operations
} // namespace ros

#endif // NVI_MSGS_MESSAGE_OBJECT_H
