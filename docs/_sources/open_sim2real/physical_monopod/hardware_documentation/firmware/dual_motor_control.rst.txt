.. _dual_motor_control:

====================
Robotic Leg Firmware
====================

Introduction
=============

This page describes the Robotic Leg Firmware, which controls the BLDC motors on the Robotic Leg. The information here is
mostly derived from the ODRI-provided firmware, of which the description of the program structure can be found here:

- `ODRI Program Structure and Frequencies <https://open-dynamic-robot-initiative.github.io/mw_dual_motor_torque_ctrl/program_structure_and_frequencies.html>`_

However, our team made several changes to this firmware which must be discussed. Further documentation of how this
firmware works is also warrented.

Firmware Description
=====================

The basic function of this firmware is as follows:

- Upon startup, the firmware initializes several peripherals such as the Controller Area Network(CAN), General Purpose
  Input-Output(GPIO) and Encoders(ENC and QEP). The firmware reads user-defined constants that describe the motors and
  encoders used on our physical platform, and uses this information to set up the data structures and peripherals to run
  motor control. The firmware then sets up several Interrupt Service Routines(ISRs), which are functions which execute
  periodically on a timer interrupt, or on other event-driven interrupts.

- The firmware idles until it receives a CAN message to enable the system and CAN messages to enable each of the motors.
  After receiving said CAN messages, it runs through an infinite loop which updates an internal state estimator, checks
  for errors, toggles LEDs, and writes motor control commands to the motor driver boards based on the current state of
  the system. The ISRs run independently from the main loop on their own frequency, and they can update the state of
  the system.

- The firmware goes back to idling when CAN messages are sent that disables the motors and the system.

Most of the work in this firmware is done by Interrupt Service Routines(ISRs). The following ISRs are used:

- QEP Index ISRs: There are 2 QEP Index ISRs, each corresponding to 1 encoder on the Robotic Leg. The encoders used in the
  Robotic Leg can detect when an encoder has executed a full revolution, and the microcontroller can use this as an
  interrupt. When this ISR is called, the microcontroller can compare the number of encoder counts it took to go a full
  revolution, compared to the number of encoder counts it took to do the last revolution. If number of encoder counts
  are different, then it means that the encoders are missing counts, and an error flag is set which stops the motor and
  sends an error flag in a CAN message.

- Timer ISR: This executes at a fixed rate of 1000Hz. Every time this ISR executes, CAN messages indicating the position,
  velocity, acceleration and current of each motor is sent.

- CAN ISR: This executes whenever a CAN message is received. This ISR checks the ID and contents of the CAN message, and
  uses it to update the desired state of the system. This ISR is used to enable or disable the system, or to set target
  currents.

- Motor ISRs: There are 2 Motor ISRs, each corresponding to 1 motor on the Robotic Leg. Each of these ISRs executes on a
  fixed rate of 10kHz. Every time this ISR executes, a Field Oriented Control algorithm is run that compares the current
  state of the motors and the desired state of the motors, and uses this to command a torque to each motor.
