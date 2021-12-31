# Open Sim2Real superbuild for the monopod platform

This is a meta repository (so-called "superbuild") that uses [CMake](https://cmake.org/) and [YCM](https://github.com/robotology/ycm) to automatically
download and compile software developed in the OpenSim2Real GitHub organization. This superbuild is based on the [robotology-superbuild](https://github.com/robotology/robotology-superbuild)

[CMake](https://cmake.org/) is an open-source, cross-platform family of tools designed to build, test and package software.
A [YCM Superbuild](http://robotology.github.io/ycm/gh-pages/git-master/index.html#superbuild) is a CMake project whose only goal is to download and build several other projects.
If you are familiar with ROS, it is something similar to [catkin](http://wiki.ros.org/catkin/workspaces) or [colcon workspace](https://colcon.readthedocs.io/en/released/user/quick-start.html), but using pure CMake for portability reasons and for customizing the build via CMake options.

<!-- Furthermore, the `robotology-superbuild` also contains some infrastructure to build **binaries** of the contained projects for some platforms.
You can read more about the superbuild concept in [YCM documentation](http://robotology.github.io/ycm/gh-pages/latest/index.html) or in the [related IRC paper](http://lornat75.github.io/papers/2018/domenichelli-irc.pdf). -->
# Supported
Currently ubuntu 20.04 is the only tested version. To use ubuntu < 20.04 make sure python is >=3.8 and swig>=4.0

# Dependencies

```
sudo apt-get install -y  build-essential \
                         libxml2-dev \
                         coinor-libipopt-dev \
                         libassimp-dev \
                         libirrlicht-dev \
                         freeglut3-dev \
                         libedit-dev \
                         libxmu-dev \
                         libncurses-dev \
                         libcereal-dev \
                         python3-dev \
                         python3-numpy \
                         python3-pybind11 \
                         pybind11-dev \ 
                         libboost-all-dev \
                         cmake
```

<!-- might need this libeigen3-dev -->

```
sudo apt-add-repository universe
sudo apt-get update
sudo apt-get install doxygen
sudo apt-get install python3-sphinx
sudo apt-get install python3-breathe
```

```
pip3 install breathe
pip3 install cmake_build_extension gym gym_ignition_models lxml numpy scipy
```

If you have ubuntu 20.04 you can install swig with apt
```
sudo apt update
sudo apt install swig
```

Otherwise you must do the following to install swig 4.0
1. Download swig from [here](https://sourceforge.net/projects/swig/files/swigwin/swigwin-4.0.2/swigwin-4.0.2.zip/download?use_mirror=newcontinuum) or follow the links from the swig web page [here](http://www.swig.org/download.html)
2. Extract swig where ever
3. Install following the below methods,

Install in /usr/local/
```
./configure
make
make install
```

Install at different location
```
./configure --prefix=/home/yourname/projects
make
make install
```

Note you must then append the path to the swig library onto the `CMAKE_PREFIX_PATH` environment variable so cmake can find swig.

## Update and upgrade
```
sudo apt update
sudo apt upgrade --fix-missing
```

# Installation

```
cd <repo location>
git clone git@github.com:OpenSim2Real/os2r-superbuild.git
cd os2r-superbuild
cmake -S . -B build <CMAKE_ARGS>
cmake --build build
```

`<CMAKE_ARGS>` can define the options you want for the build. Available options

#### Build types:

```
option(OPENSIM2REAL_ENABLE_CORE "Enable compilation of core software libraries." TRUE)
option(OPENSIM2REAL_ENABLE_MONOPODSDK "Enable compilation of monopod_sdk." FALSE)
option(OPENSIM2REAL_ENABLE_SCENARIO "Enable compilation of scenario." FALSE)
```
#### Other useful cmake args:

1. `-DOPENSIM2REAL_USES_IGNITION:BOOL= ON/OFF (does scenario use ignition gazebo?)`
2. `-DOPENSIM2REAL_PROJECT_TAGS="Stable"/"Unstable"/"LatestRelease"/"Custom" ("custom" requires OPENSIM2REAL_PROJECT_TAGS_CUSTOM_FILE to be set)`

By default CORE is always installed. To set the other options to install as well replace `<CMAKE_ARGS>` with
```
cmake -S . -B build -DOPENSIM2REAL_ENABLE_MONOPODSDK:BOOL=TRUE -DOPENSIM2REAL_ENABLE_SCENARIO:BOOL=TRUE
```

Include which ever options you want.

## Sourcing environment

either source the setup.sh script each time you open a new termnal you want to run this code with,
```
source <Install Dir>/os2r-superbuild/build/install/share/os2r-superbuild/setup.sh
```

```
echo 'source <Install Dir>/os2r-superbuild/build/install/share/os2r-superbuild/setup.sh' >> ~/.bashrc
```
