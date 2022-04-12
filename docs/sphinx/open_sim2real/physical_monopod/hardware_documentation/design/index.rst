.. _monopod_design:

Design Decisions
================

Introduction
------------

This page describes the overarching design of the Monopod hardware platform.

Design Requirements
-------------------

The following requirements drive the design of the Monopod hardware platform:

- The system must pose a non-trivial control problem, to be of interest to control system researchers. However, the
  hardware must allow the control problem to be reductible to a simpler form for testing and software validation
  purposes.

- All components of the system, both software and hardware, must be released under permissive licenses such that this
  hardware platform can also be released under a permissive license for others to build on top of.

- This system must be inexpensive and within the budgetary constraints of a small lab or to a hobbyist.

- The system must also be easily assembled and reproduced with mostly off-shelf, 3D printed, waterjet or laser-cut
  parts. This ensures that all parts of this hardware platform can be either manufactured in situ, or contracted
  out to an external service without much expense.

- The system must be widely used in robotics and controls research, so that there will be many research papers
  describing the dynamics of the system.

Considered Designs
------------------

Inverted Pendulum
+++++++++++++++++

We considered basing our system out of an inverted pendulum configuration. An inverted pendulum essentially tries to
maintain a mass at a high position without it falling, by actuating several joints. An inverted pendulum has some
precedent in research.

- `Example Inverted Pendulum <https://www.youtube.com/watch?v=4kIrcELC79o>`_

- `Example Inverted Pendulum with multiple degrees of freedom <https://www.youtube.com/watch?v=cyN-CRNrb3E>`_

However, an inverted pendulum configuration is not very extensible. It is quite difficult to attach an additional
degree of freedom to a two-wheeled inverted pendulum, as a second "pendulum" attached to the first pendulum will
interfere physically with the first pendulum. There is also significant doubt as to how fast the base of the first
pendulum must move to swing the second pendulum to an upright position, potentially making this problem unsolvable for a
given hardware.

3D Hopper
+++++++++

A 3D Hopper is best characterized by the MIT Hopper, which has 2 actuators to tilt a pogo-stick, and a single actuator
to compress the pogo-stick.

.. figure:: design/design_images/mithopper.PNG

   An image of the MIT hopper. More information about this hopper can be found on their website `here <http://www.ai.mit.edu/projects/leglab/robots/3D_hopper/3D_hopper.html>`_

While a 3D hopper poses an interesting control problem on its own due to its inability to balance on its own without
constant adjustment, the 3D hopper does not provide an easier control problem which can be used to validate the OpenSim2Real
software stack. Therefore, there is signficant risk in building a 3D hopper, only to possibly have it be uncontrollable.

2D Hopper
+++++++++

A 2D Hopper is a robotic leg which can hop in 2 dimensions, while the 3rd dimension must be constrained externally. Many
robotics research groups start with the 2D Hopper, before progressing over systems with higher dimensionality. A 2D hopper
can also be easily modified to include additional degrees of freedom.

Therefore, the OpenSim2Real group decided to use a 2D Hopper as a design pattern for our hardware platform.

The Open Dynamic Robot Initiative
---------------------------------

The Open Dynamic Robot Initiative provides open-source actuator designs which can be used to build a 2D Hopper. Due to the
adequate quality of the documentation provided, as well as the significant technical support provided by ODRI to potential
users, we have decided to adapt an ODRI design to build our 2D Hopper.

Conclusion
----------

Our team has decided to build a 2D Hopper and a corresponding constraining device for the 2D Hopper.

.. toctree::
  :hidden:
  :caption: Design Decisions

  hardware_design
  electrical_design
