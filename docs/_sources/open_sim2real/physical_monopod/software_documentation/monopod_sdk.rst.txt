.. _monopod_sdk_software_docs:

===========
Monopod Sdk
===========

Introduction
============

This package contains the drivers for the planarized monopod sim2real platform
designed by `OpenSim2Real`. These drivers provide an interface to send commands and
receive observations. The drivers will automatically detect if your system has the
real-time kernel enabled and will enable it inside the communication thread.

This package is directly derived from the drivers for the brushless
motors developed in the Max Planck Institute for Intelligent System. The original
source code can be found `here <https://github.com/open-dynamic-robot-initiative/blmc_drivers>`_\ .

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

Homing Implementation
=====================

Joint Position Calibration

What is “Homing” and Why is it Needed?
--------------------------------------

When using relative encoders (like the quadrature encoders, we are
using), we only get relative position changes (e.g. “motor moved by 13
degree”). By accumulating these changes, the position can be computed.
However, when turning the robot on, the motor controller does not know
the absolute position of the motor so it just defines the current
position to be zero. This means that while the position is consistent
while the robot is running, the same physical position can get different
position values when the robot is turned off in between.

To solve this problem, the so called “homing” is performed in the
beginning when turning the robot on. The idea is to search for a fixed
physical position that can always be found, independent of where the
joint is located when turned on (e.g. by having a switch that is
triggered when the joint gets at that position). Once this “home
position” is found, it can be set as zero position. This way, the same
physical position will always correspond to the same position value,
even if the robot is turned off between runs.

How is the Homing Implemented for the BLMC Robots?
--------------------------------------------------

In the ``MotorJointModule[s]`` class, the following procedure is
implemented:

1. From the current position move slowly in one direction (depending on
   parameters) until the next occurrence of the encoder index is
   reached.
2. Set this position as home position.
3. Set the zero position to home_position + home_offset.

The *encoder index* is a special tick on the encoder wheel that appears
only once per motor revolution. This means once the encoder index is
found, the absolute position of the motor is known. However, there is
typically a gear box so that multiple motor revolutions are needed for
one joint revolution. So while the motor position is now known, the
absolute position of the joint is still unknown as there are multiple
occurrences of the encoder index within the range of the joint.

To solve this issue, it needs to be ensured that the “correct” encoder
index is found. For robots with joint end-stops (e.g. the Finger robot)
this is done by first moving in one direction until the end-stop is
reached (detected by waiting for the velocity to become zero). Then the
encoder index search is started from the end-stop position, thus
guaranteeing that always the same index is found. For robots without
end-stops (e.g. Solo) this can be solved by first moving the robot
manually to a defined position before starting the homing.

Home Position vs Zero Position – Meaning of the Home Offset
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The home position is typically given by the mechanics (e.g. based on
where the encoder index is located) and can not be influenced by the
user. This position is often not the one where the user wants to have
the zero position. To place the zero at a different position, the “home
offset” parameter can be used. Once the home position is found, the zero
is set to

::

   zero_position = home_position + home_offset

This means, the zero can be placed wherever is best for the application
by simply setting the home offset accordingly.

How to Determine the Home Offset
--------------------------------

To determine the desired home offset value (e.g. when setting up a new
robot), simply follow these steps:

1. First set the home offset to zero.
2. Start the robot and perform the homing.
3. Manually move the robot to the desired zero position and print the
   position of the joints (after homing these positions are now relative
   to the home position).
4. Set the joint positions of the desired zero position as home offset.

When restarting now, the actual zero position after homing should be at
the desired one.
