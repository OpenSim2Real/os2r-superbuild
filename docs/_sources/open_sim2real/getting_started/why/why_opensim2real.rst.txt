Why Open Sim2Real
=================

The ability to do Sim2Real research is currently heavily limited by the lack of inexpensive,
low barrier of entry physical platforms. Currently most modern :ref:`Sim2Real <sim2real>`
involves expensive, large robots that are custom made by the research group. For most RL groups
manufacturing a custom robot is either too cumbersome or expensive, or limited by the knowledge gap
between robotics and machine learning.

By providing an open source complete platform for Sim2Real research that is relatively inexpensive we believe
it will open doors for research groups otherwise limited to simulation.

This project provides three main features:

1. :ref:`Physical Robot <physical_monopod_introduction>` with corresponding :ref:`low-level drivers <monopod_sdk>`

2. Simulation of the robot using ignition gazebo with corresponding openAI gym environment, :ref:`gym-os2r`.

3. Real-time backend, :ref:`scenario_monopod`, that links between simulation and real components with the ability to train in real.

Check the sections :ref:`What is open Sim2Real <what>`, and
:ref:`high level architecture <system_level_diagram>` for a more detailed look into the
motivation, and structure of the project.

For a practical introduction into our platform, visit the :ref:`simulated monopod <simulated_monopod_introduction>`
and :ref:`physical monopod <physical_monopod_introduction>` sections.

If you use this project for your research, please check :ref:`how to cite <how_to_cite>`.
