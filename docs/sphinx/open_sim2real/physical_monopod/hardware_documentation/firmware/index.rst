.. _robot_firmware:

Firmware
========

Introduction
===============

The Monopod hardware platform must run several processes such as encoder measurement and motor control rapidly and on a
real-time basis. This is best done with microcontrollers running both novel firmware, as well as firmware adapted from
the Open Dynamic Robot Initiative's work.

This section describes the firmware running on the Monopod hardware platform.

System Description
==================

The Monopod consists of a Robotic Leg, the object of control, and a Central Pivot, which keeps the Robotic Leg on a
2D plane and measures its horizontal and vertical position with encoders. The Robotic Leg and the Central Pivot both
have a dedicated microcontroller each, operating independently.

The Robotic Leg Firmware was adapted from existing firmware produced by ODRI, and runs on a TI LAUNCHXL microcontroller
board. It runs Field Oriented Control to control the 2 BLDC motors on the Robotic Leg, with position, velocity and
acceleration measurements from the 2 encoders on the Robotic Leg.

The Central Pivot Firmware is novel and developed by the OpenSim2Real group. It also runs on a TI LAUNCHXL
microcontroller board. It periodically reads the horizontal angle encoder and the vertical angle encoder on the Central
Pivot to measure the position of the Robotic Leg.

Both encoders communicate with a computer via CAN protocol.

.. figure::fulldiagram.png

   The firmware-level description of the hardware platform

The firmware used is described comprehensively in the following sections:

- :ref:`Monopod Firmware Setup <monopod_firmware>`

- :ref:`Robotic Leg Firmware <dual_motor_control>`

- :ref:`Central Pivot Firmware <encoder_measurement>`

- :ref:`Connecting to CAN <can_connection>`

- :ref:`CAN Protocol <can_protocol>`:

System Description Specifics
=============================

The TI LAUNCHXL microcontroller board was chosen to run all of the firmware for the Monopod hardware platform, because it is
the microcontroller board used by ODRI. A simple Arduino Uno board with an ATMEGA328 microcontroller is not sufficient
to run the high-speed encoder measurement required for the Central Pivot Firmware, as it lacks dedicated encoder
peripherals and must rely on crude bit-bashing techniques. Hence, simplicity favors using a TI LAUNCHXL board to run
the Central Pivot Firmware as well, allowing the same development tools and SDKs to be used for both the Robotic Leg and
the Central Pivot.

We considered merging the encoder measurement firmware with the motor control firmware so that all the firmware could
run on a single board. However, this proved to be impractical as the microcontroller on the TI LAUNCHXL board only has
2 dedicated encoder peripherals. Therefore, we decided to use 2 TI LAUNCHXL microcontroller boards, each running
seperate firmware.

This means that adding additional measurement encoders to the hardware platform in the future to increase the complexity
of the system will require adding additional TI LAUNCHXL boards running similar encoder measurement firmware. We decided
that adding more TI LAUNCHXL boards is less complex than constantly modifying firmware whenever new encoders are being
added. With our architecture, adding additional measurment encoders will only require adding more nodes to a CAN network.

ODRI provides a design for a dedicated PCB with all of the functionality of a TI LAUNCHXL microcontroller board, but
lighter and with a smaller footprint. We decided not to use this dedicated PCB due to the complexity of sourcing this
PCB and its components, and because space and mass is not a concern for mounting on the Central Pivot.


.. toctree::
  :hidden:
  :caption: Firmware

  monopod_firmware
  can_connection
  can_protocol
  encoder_measurement
  dual_motor_control
