# bb-superbuild

This is a meta repository (so-called "superbuild") that uses [CMake](https://cmake.org/) and [YCM](https://github.com/robotology/ycm) to automatically
download and compile software developed in the baesian balancer GitHub organization. This superbuild is based on the [robotology-superbuild](https://github.com/robotology/robotology-superbuild)

[CMake](https://cmake.org/) is an open-source, cross-platform family of tools designed to build, test and package software.
A [YCM Superbuild](http://robotology.github.io/ycm/gh-pages/git-master/index.html#superbuild) is a CMake project whose only goal is to download and build several other projects.
If you are familiar with ROS, it is something similar to [catkin](http://wiki.ros.org/catkin/workspaces) or [colcon workspace](https://colcon.readthedocs.io/en/released/user/quick-start.html), but using pure CMake for portability reasons and for customizing the build via CMake options.

<!-- Furthermore, the `robotology-superbuild` also contains some infrastructure to build **binaries** of the contained projects for some platforms.
You can read more about the superbuild concept in [YCM documentation](http://robotology.github.io/ycm/gh-pages/latest/index.html) or in the [related IRC paper](http://lornat75.github.io/papers/2018/domenichelli-irc.pdf). -->





<!-- Cmake deps -->
```
sudo apt-get install freeglut3-dev
sudo apt-get install libedit-dev
sudo apt-get install -y libxmu-dev
sudo apt-get install libncurses-dev
```

<!-- doxygen and sphinx -->
```
sudo apt-add-repository universe
sudo apt-get update
sudo apt-get install doxygen
sudo apt-get install python3-sphinx
```

<!-- extra doc dep -->
```
pip3 install breathe
```

<!-- For shared_memory -->
<!-- Second one replaces the first? -->
```
sudo apt install libcereal-dev
```

<!-- For iDynTree -->
```
sudo apt-get install build-essential libeigen3-dev libxml2-dev coinor-libipopt-dev libassimp-dev libirrlicht-dev
```


<!-- Maybe stuff -->
<!-- ```
<!-- sudo apt-get install gcc-multilib g++-multilib -->
<!-- sudo apt-get install build-essential flex libelf-dev libc6-dev-amd64 binutils-dev libdwarf-dev -->
``` -->
