.. _encoder_measurement:

Central Pivot Firmware
======================

Introduction
=================

This page describes the Central Pivot Firmware, which measures the encoder position, velocity and accelerations on the
Central Pivot. This firmware is developed by the OpenSim2Real group, and a brief description of how it works is
warranted.

Firmware Description
=====================

The basic function of this firmware is as follows:

- Upon startup, the firmware initializes several peripherals such as the Controller Area Network(CAN), General Purpose
  Input-Output(GPIOs) and Encoders(QEP). The firmware then sets up several Interrupt Service Routines(ISRs) which execute
  either periodically on a timer interrupt, or on other event-driven interrupts.

- The main loop of this firmware does almost nothing. Everything is done on the Interrupt Service Routines(ISRs).

The following ISRs are used:

- Timer ISR: This executes at a fixed rate of 100Hz. Every time this ISR executes, the encoder positions are read. Using
  a finite difference method, the encoder velocity and acceleration are obtained from current and previous encoder
  positions, and smoothed to get rid of spurious jumps in value. CAN messages indicating the position,
  velocity and acceleration of each encoder are then sent.
