# nvi_speech

A ROS package for speech-to-text in navigation for visually impaired person application.

This package mainly uses the [pyAudio](https://pypi.org/project/PyAudio/) & [ASET Speech](https://github.com/nl8590687/ASRT_SpeechRecognition) package. Users can conveniently use this package to create their speech-to-text application in ROS. 

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

This package requires pyAudio to make this application come true. 
```sh
$ sudo apt install python3-pyaudio portaudio19-dev
$ pip install PyAudio
```


### Compile

compile this package in your workspace
```bash
$ catkin_make
```

### Run

run the launch file to run this package node
```bash
roslaunch nvi_speech nvi_speech.launch
```
if there are some errors, running this command make give some help
```bash
chmod +x nvi_speech/scripts/nvi_speech_node.py
```


### Test

speak the command in config list in chinese, you will get the translated command message in '/speech/command' if the voice is matched.
```
rostopic echo /speech/command
```

## Author

- Name: Lixuan Zhang
- E-mail: lixuan.zhang@vipl.ict.ac.cn

This project exists thanks to the [pyAudio](https://pypi.org/project/PyAudio/) & [ASET Speech](https://github.com/nl8590687/ASRT_SpeechRecognition) support.


## License
[MIT](LICENSE) © Richard Littauer
