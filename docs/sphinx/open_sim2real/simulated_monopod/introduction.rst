Introduction
============

This section contains all the information required to set up the gym simulation environment
for our monopod platform. This section assumes that the full :ref:`superbuild <os2r-superbuild>` will
not be set up on the same system (the superbuild is able to build the simulation as well, if desired).

The simulator used for our simulation is `ignition gazebo <https://ignitionrobotics.org/>`_. For
a explanation on some of the advantages of this simulator please read further
`here <https://robotology.github.io/gym-ignition/master/why/why_ignition_gazebo.html>`_.

The simulation platform has been completely based around the work done on
`gym-ignition <https://robotology.github.io/gym-ignition>`_. Using the framework
provided we have built the open sim2real stack as wrapper or plugin for the
gym-ignition framework. The packages we provide that are built around gym-ignition
are: :ref:`gym-os2r`, and :ref:`scenario_monopod`.
