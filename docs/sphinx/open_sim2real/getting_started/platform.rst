.. _the_platform:

The Platform
============

The platform is a 'planarized monopod'. The design of the robot was chosen to
satisfy the following design requirements. A ideal platform must

1. Be a relatively simple, inexpensive and easily reproducible setup.
2. Poses a well-defined, but non-trivial control problem.
3. have precedent in research (Raibert hopper :footcite:`RaibertHopper`, etc).

For a more extensive explanation of the design decision chosen during the creation
of this project view the details :ref:`here <monopod_design>`.

Additional we expect an end-to-end sim2real platform to provide the following items:

1. Physical and Simulated robot.
2. Abstracted interface between real and simulation.
3. Gym reinforcement-learning framework for simulation and reality.
4. Software drivers for interfacing with physical robot.
5. Build system for physical robot back-end.
6. Comprehensive documentation for researchers to replicate the platform.

.. _what_is_our_real:

What's our Real
---------------

The physical robot was adapted from the open source robotic leg from the
`Open Dynamic Robot Initiative (ORDI) <https://open-dynamic-robot-initiative.github.io/>`_\ .

.. image:: media/monopod.png

.. _what_is_our_sim:

What's our Sim
--------------



Why our Real
------------



  .. footbibliography::
