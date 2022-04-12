.. _monopod_resources:

Further Resources
============================

Introduction
============

This is a list of useful resources for assembling and operating the Monopod.

Core Resources
==============

The Open Dynamic Hardware Initiative(ODRI) is a project by the Max Planck Institute for Intelligent Systems, New York
University's Tandon School of Engineering, and the LAAS/CNRS. Its goal is to develop an inexpensive, open-source
robotics platform for robotics research. ODRI has developed several versions of an actuator module which can be put
together into more complex robots. ODRI maintains several online resources, as follows:

- `ODRI Main Website <https://open-dynamic-robot-initiative.github.io/>`_: This is the main landing page for their project.
- `An Open Torque-Controlled Modular Robot Architecture for Legged Locomotion Research <https://arxiv.org/pdf/1910.00093.pdf>`_: The introduction paper written by ODRI
- `ODRI Discourse Group <https://odri.discourse.group/>`_: This is the help forum for users of ODRI's robotic platform.
- `Open Dynamic Robot Initiative Github <https://github.com/open-dynamic-robot-initiative>`_: The GitHub organization
  for ODRI. The most important repository here is the `Open Robot Actuator Hardware <https://github.com/open-dynamic-robot-initiative/open_robot_actuator_hardware>`_
  repository, which contains detailed build instructions.

The `OpenSim2Real <https://github.com/OpenSim2Real>`_ organization on Github has a number of repositories. The
following repositories within the OpenSim2Real project are important for assembling the Monopod:

- `Motorware Dual Motor Control Firmware <https://github.com/OpenSim2Real/mw_dual_motor_torque_ctrl>`_: This firmware is developed for the TI LAUNCHXL development board, and it does motor control for the Robotic Leg segment of the Monopod.
- `Encoder Measurement Firmware <https://github.com/OpenSim2Real/encoder_measurement>`_: This firmware is developed for the TI LAUNCHXL development board, and it reads encoder measurements for the Central Pivot segment of the Monopod.
- `Hardware Repository <https://github.com/OpenSim2Real/hardware_repository>`_: This is a hardware repository containing both STEP and STL files for the parts required to manufacture the entire Monopod

The following 3D assemblies of the Monopod were developed on OnShape, a cloud-based 3D CAD platform. The public link
to the OnShape document is found here:

- `OpenSim2Real Planar Monopod <https://cad.onshape.com/documents/13d38c57dee40a129dc0750d/w/a2c92239a21f174507c126a9/e/ad58cf7803bde854f21ba4a8?renderMode=0&uiState=62412e63e5b16f1cf00cc962>`_
- The --Central_Pivot-- folder within this document contains the --central-pivot-4-assembly-- assembly, the current version of the Central Pivot we have developed.
- The --Robotic_Leg-- folder within this document contains the --complete-leg-assembly-- assembly, the current version of the Robotic Leg we have modified from the base design provided by ODRI.
- This OnShape document can be copied to a private OnShape account, if further modifications are warranted.

Learning Materials
==================

The following video links provide a good introduction into Field Oriented Control, which the TI Launchpad
microcontroller board uses to do current control for the actuators on the Robotic Leg. Part 2 is the most
relevant to Field Oriented Control, but the whole series is worth watching.

- `Teaching Old Motors New Tricks Part 1

  ..  youtube:: fpTvZlnrsP0

- `Teaching Old Motors New Tricks Part 2

  ..  youtube:: VI7pdKrchM0

- `Teaching Old Motors New Tricks Part 3

  ..  youtube:: 5eQyoVMz1dY

- `Teaching Old Motors New Tricks Part 4

  ..  youtube:: bZwLFpXhFbI

- `Teaching Old Motors New Tricks Part 5

  ..  youtube:: qWkaJu6o7lI

The Controller Area Network(CAN) Protocol is a widely used communications protocol in the automotive and
marine industries. Vector is a major supplier of CAN signal analyzers, and they have a good introduction
to the protocol:

- `Vector Learning Module for CAN <https://elearning.vector.com/mod/page/view.php?id=333>`_

The Texas Instruments LAUNCHXL-F28069M is the microcontroller evaluation board used for motor control on
the Robotic Leg, and encoder measurement on the Central Pivot. Here are several useful links:

- `LAUNCHXL Product Link <https://www.ti.com/tool/LAUNCHXL-F28069M>`_
- `LAUNCHXL General User Guide <https://www.ti.com/lit/ug/sprui11b/sprui11b.pdf>`_
- `LAUNCHXL Quick Start Guide <https://www.ti.com/lit/ml/sprui02/sprui02.pdf>`_

The Texas Instruments BOOSTXL-DRV8305EVM is an evaluation board for the DRV8305 motor gate driver. It drives
3-phase motors, such as the two BLDC motors used on the Robotic Leg. 2 of these motor driver evaluation boards
can be connected to the TI LAUNCHXL evaluation board. Here are several useful links:

- `BOOSTXL Product Link <https://www.ti.com/tool/BOOSTXL-DRV8305EVM>`_
- `BOOSTXL General User Guide <https://www.ti.com/lit/ug/slvuai8a/slvuai8a.pdf>`_

An Onshape document is a repository for all CAD models for a single project. OnShape has a learning portal with
several courses to get familiar with the software platform:

- `OnShape Learning <https://learn.onshape.com/>`_
