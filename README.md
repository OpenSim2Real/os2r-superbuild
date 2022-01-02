# Open Sim2Real superbuild for the monopod platform

This is a meta repository (so-called "superbuild") that uses [CMake](https://cmake.org/) and [YCM](https://github.com/robotology/ycm) to automatically
download and compile software developed in the OpenSim2Real GitHub organization. This superbuild is based on the [robotology-superbuild](https://github.com/robotology/robotology-superbuild)

[CMake](https://cmake.org/) is an open-source, cross-platform family of tools designed to build, test and package software.
A [YCM Superbuild](http://robotology.github.io/ycm/gh-pages/git-master/index.html#superbuild) is a CMake project whose only goal is to download and build several other projects.
If you are familiar with ROS, it is something similar to [catkin](http://wiki.ros.org/catkin/workspaces) or [colcon workspace](https://colcon.readthedocs.io/en/released/user/quick-start.html), but using pure CMake for portability reasons and for customizing the build via CMake options.

<!-- Furthermore, the `robotology-superbuild` also contains some infrastructure to build **binaries** of the contained projects for some platforms.
You can read more about the superbuild concept in [YCM documentation](http://robotology.github.io/ycm/gh-pages/latest/index.html) or in the [related IRC paper](http://lornat75.github.io/papers/2018/domenichelli-irc.pdf). -->
# Support
Currently ubuntu 20.04 is the only tested version.

# Dependencies

## Dependencies for Core and Monopod Sdk

```
sudo apt-add-repository universe
sudo apt update
sudo apt upgrade
```

```
sudo apt-get install -y build-essential \
                        cmake \
                        python3-sphinx \
                        doxygen \
                        python3-breathe \
                        python3-pybind11 \
                        libboost-all-dev \
                        freeglut3-dev \
                        libedit-dev \
                        libxmu-dev \
                        libncurses-dev \
                        libcereal-dev \
```

## Dependencies for Sim2Real

```
sudo apt-get update
sudo apt-get install lsb-release wget gnupg
```

```
sudo wget https://packages.osrfoundation.org/gazebo.gpg -O /usr/share/keyrings/pkgs-osrf-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/pkgs-osrf-archive-keyring.gpg] http://packages.osrfoundation.org/gazebo/ubuntu-stable $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/gazebo-stable.list > /dev/null
sudo apt-get update
sudo apt-get install ignition-fortress
```

**add this to your bashrc**

```
echo 'export IGN_GAZEBO_PHYSICS_ENGINE_PATH=${IGN_GAZEBO_PHYSICS_ENGINE_PATH}:/usr/lib/x86_64-linux-gnu/ign-physics-5/engine-plugins/' >> ~/.bashrc
```

:warning: **If you had an old version of ignition installed prior you might need to remove the config folder**: Ignition creates a new one the next time it starts
```
mv $HOME/.ignition $HOME/.ignition_bak
```
If there are still folder errors, try to create the folder yourself
```
mkdir -p $HOME/.ignition/gazebo/6
```

```
sudo apt-get install -y  coinor-libipopt-dev \
                         libirrlicht-dev \
                         libassimp-dev
```

```
sudo apt install python3-pip
pip3 install cmake_build_extension gym gym_ignition_models scipy numpy
```

If you have ubuntu 20.04 you can install swig with apt
```
sudo apt update
sudo apt install swig
```

Otherwise you must do the following to install `swig 4.0`
1. Download swig from [here](https://sourceforge.net/projects/swig/files/swigwin/swigwin-4.0.2/swigwin-4.0.2.zip/download?use_mirror=newcontinuum) or follow the links from the swig web page [here](http://www.swig.org/download.html)
2. Extract swig where ever
3. Install following the below methods,

Install in `/usr/local/`
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

:warning: **You might need to restart your computer before continuing**: If you are having issues with dependencies and building try installing ignition even if you are only using superbuild core.

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
option(OPENSIM2REAL_ENABLE_MONOPODSDK "Enable compilation of monopod_sdk." FALSE)
option(OPENSIM2REAL_ENABLE_SCENARIO "Enable compilation of scenario." FALSE)
option(OPENSIM2REAL_ENABLE_GYMIGNITION "Install gym_ignition python module if scenario is enabled. Requires python to be enabled." TRUE)
option(OPENSIM2REAL_ENABLE_GYMOS2R "Install gym_os2r python module if scenario/gym-ignition is enabled. Requires python to be enabled." FALSE)
option(OPENSIM2REAL_ENABLE_ALL "Enable compilation of scenario." FALSE)

option(OPENSIM2REAL_USES_PYTHON "Enable compilation of software that depend on Python" TRUE)
```
#### Other useful cmake args:

1. `-DOPENSIM2REAL_PROJECT_TAGS="Stable"/"Unstable"/"LatestRelease"/"Custom" ("custom" requires OPENSIM2REAL_PROJECT_TAGS_CUSTOM_FILE to be set)`

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


# Dependencies required to compile docs

```
pip install sphinx-multiversion sphinx_autodoc_typehints sphinx_fontawesome sphinx_book_theme sphinx_tabs lxml
pip install -U breathe
```

# Can update the repos using the below commands

To do this, make sure to be in the build directory of the OpenSim2Real-superbuild and run:
```
make update-all
make
```
