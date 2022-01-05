Introduction
============

This package contains the drivers for the brushless
motors developed in the Max Planck Institute for Intelligent System. The original
source code can be found `here <https://github.com/open-dynamic-robot-initiative/blmc_drivers>`_\ .
This package has been included in the monopod drivers package to simplify the build process and allow a few
modifications to be done to the blmc_drivers source files.

The BLMC stands for **B**\ rush\ **L**\ ess **M**\ otor **C**\ ontrol.

This package provides guidelines on how a device should
be implemented (see also the DeviceInterface class).

generally, we expect the following functions to be implemented:

1.  a set function for each input (several inputs may share a set function
    which takes an index argument).
2.  a send_if_input_changed() function which will send the inputs to the
    device if any of them have changed.
3.  functions to access the current inputs and outputs, as well as the
    inputs which have been sent to the device. Rather than just returning
    the latest elements, these function should return a time series
    of these objects, such that the user can synchronize (e.g. wait for
    the next element or step through them one by one such that none of them is
    missed)

This package provide a very simple API in order to acquire the sensors and send
the controls to the actuators.
Example of use of this package can be seen in the different demos
(PROJECT_SOURCE_DIR/demos) or in different unittests (PROJECT_SOURCE_DIR/tests).
The demos contains the documentation inside the code. The unittests should be
simple enough to understand without additional documentation.
