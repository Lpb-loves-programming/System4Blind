# nvi_voice

A ROS package for text-to-speech in navigation for visually impaired person application.

This package mainly uses the [espeak](http://espeak.sourceforge.net/) & pyttsx3 package. Users can conveniently use this package to create their text-to-speech application in ROS. 

## Table of Contents

- [Environment](#Environment)
- [Usage](#Usage)
    - [Install](#Install)
    - [Compile](#Compile)
    - [Run](#Run)
    - [Test](#Test)
- [Author](#Author)
- [License](#license)

## Environment
- Linux
- ROS noetic
- Python3

## Usage

Firstly install this package and move it to your workspace.

### Install

This package requires espeak & pyttsx3 to make this application come true. Espeak is an open-source package to convert text to speech.
```sh
$ pip install sounddevice
$ pip3 install pyttsx3 
$ sudo apt install espeak
```


### Compile

compile this package in your workspace
```bash
$ catkin_make
```

### Run

run the launch file to run this package node
```bash
roslaunch nvi_voice nvi_voice.launch
```
if there are some errors, running this command make give some help
```bash
chmod +x nvi_voice/scripts/nvi_voice_node.py
```

Note: the type in .launch can be replaced with nvi_tfvoice_node.py. The tts module in nvi_tfvoice_node.py is achieved by [zhtts](https://github.com/Jackiexiao/zhtts).

The tf version has been updated in blind-alpha anaconda environment.

### Test

publish a topic to nvi_voice node to convert the text to speech 
```bash
rostopic pub /voice/tts_voice_topic std_msgs/String "${MODE}|${ACTION}|${DESCRIPTION}"
```

note that the param in ./config/*.yaml can be modified to satisfy personal requirements. 

## Author

- Name: Lixuan Zhang
- E-mail: lixuan.zhang@vipl.ict.ac.cn

This project exists thanks to the [espeak](http://espeak.sourceforge.net/) support.


## License
[MIT](LICENSE) © Richard Littauer
