.. _overlord_docs:

Open Sim2Real
=============

What's Open Sim2Real?
---------------------

Open Sim2Real is a open source project striving to develop a simple cheap
platform for :ref:`Sim2Real <what_is_sim2real>` research.

The platform consists of a cheap :ref:`single leg robot <what_is_our_real>` constrained
to an approximate plane, and the corresponding simulation. Both the sim and real
components support training within the gym framework (limited by real-time constraints
on physical robot). In other words this project provides an open source, simple foundation
for future Sim2Real platforms to build on top of.

There are well documented `build instructions <building_the_robot>` for
the physical monopod, additionally instructions on how to install the software stack, set up
:ref:`training on cloud <training_on_cloud>` (with container or source), basic tasks and
reward functions, and much more. The project builds on top of many tools researchers are already
familiar with making the transition into real natural (those dang simulations need to touch grass).

Why Open Sim2Real?
------------------

The ability to do Sim2Real research is currently heavily limited by the lack of cheap,
low barrier of entry physical platforms. Currently most modern :ref:`Sim2Real <what_is_sim2real>`
involves expensive, large robots that are custom made by the research group. For most RL groups
manufacturing a custom robot is either too cumbersome or expensive, or limited by the knowledge gap
between robotics and machine learning.

By providing an open source complete platform for Sim2Real research that is relatively inexpensive we believe
it will open doors for research groups otherwise limited to simulation.

|
|

This project provides three main features:

1. :ref:`Physical Robot <physical_monopod_introduction>` with corresponding :ref:`monopod_sdk`

2. Simulation of the robot using ignition gazebo with corresponding openAI gym environment, :ref:`gym-os2r`.

3. Real-time link, :ref:`scenario_monopod`, between simulation and real components with the ability to train in real.

Check the sections :ref:`What is open Sim2Real <what>`, :ref:`why open Sim2Real <why>`, and
:ref:`high level architecture <high_level_architecture>` for a more detailed look into the
motivation, and structure of the project.

For a practical introduction into our platform, visit the :ref:`simulated monopod <simulated_monopod_introduction>`
and :ref:`physical monopod <physical_monopod_introduction>` sections.

If you use this project for your research, please check :ref:`how to cite <how_to_cite>`.

.. toctree::
  :hidden:
  :caption: Getting Started

  open_sim2real/getting_started/what/index
  open_sim2real/getting_started/why/index
  open_sim2real/getting_started/highlevel_architecture/index
  open_sim2real/getting_started/copyright_and_license
  open_sim2real/getting_started/how_to_cite

.. toctree::
  :hidden:
  :caption: Simulated Monopod

  open_sim2real/simulated_monopod/introduction
  open_sim2real/simulated_monopod/installation/index
  open_sim2real/simulated_monopod/singularity_container
  open_sim2real/simulated_monopod/quick_start
  open_sim2real/simulated_monopod/training_on_cloud
  open_sim2real/simulated_monopod/next_steps

.. toctree::
  :hidden:
  :caption: Physical Monopod

  open_sim2real/physical_monopod/introduction
  open_sim2real/physical_monopod/superbuild/index
  open_sim2real/physical_monopod/monopod/index
  open_sim2real/physical_monopod/quick_start
  open_sim2real/physical_monopod/next_steps

.. toctree::
  :hidden:
  :maxdepth: 5
  :caption: Open Sim2Real Apidocs

  monopod_sdk_index
  scenario_monopod_index
  gym-os2r_index
