Getting Started
===============

This section contains all the information required to reproduce our platform.
There are two main components to this platform: the simulation gym environments,
and the real robot with its own gym environments.

* The simulation platform has been completely based around the work done on
  `gym-ignition <https://robotology.github.io/gym-ignition>`\ . Using the framework
  provided we have built the open sim2real stack as wrapper or plugin for the
  gym-ignition framework. The packages we provide that are built around gym-ignition
  are: `gym-os2r`\ , `scenario_monopod`\ ,and `os2r-superbuild`\ . The superbuilt is
  not based based on gym-ignition but instead
  `robotology-superbuild <https://github.com/robotology/robotology-superbuild>` by the same group.

* The hardware platform has been completely based around the work done by the
  `Open Dynamic Robot Initiative (ORDI) <https://open-dynamic-robot-initiative.github.io/>`\ .
  The packages we provide that are built around ORDI are: `monopod_sdk`\ , and all the hardware.
