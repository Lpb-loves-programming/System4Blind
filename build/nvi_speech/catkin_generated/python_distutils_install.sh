#!/bin/sh

if [ -n "$DESTDIR" ] ; then
    case $DESTDIR in
        /*) # ok
            ;;
        *)
            /bin/echo "DESTDIR argument must be absolute... "
            /bin/echo "otherwise python's distutils will bork things."
            exit 1
    esac
fi

echo_and_run() { echo "+ $@" ; "$@" ; }

echo_and_run cd "/home/juhaokun/ros_test/src/nvi_speech"

# ensure that Python install destination exists
echo_and_run mkdir -p "$DESTDIR/home/juhaokun/ros_test/install/lib/python3/dist-packages"

# Note that PYTHONPATH is pulled from the environment to support installing
# into one location when some dependencies were installed in another
# location, #123.
echo_and_run /usr/bin/env \
    PYTHONPATH="/home/juhaokun/ros_test/install/lib/python3/dist-packages:/home/juhaokun/ros_test/build/lib/python3/dist-packages:$PYTHONPATH" \
    CATKIN_BINARY_DIR="/home/juhaokun/ros_test/build" \
    "/usr/bin/python3" \
    "/home/juhaokun/ros_test/src/nvi_speech/setup.py" \
     \
    build --build-base "/home/juhaokun/ros_test/build/nvi_speech" \
    install \
    --root="${DESTDIR-/}" \
    --install-layout=deb --prefix="/home/juhaokun/ros_test/install" --install-scripts="/home/juhaokun/ros_test/install/bin"
