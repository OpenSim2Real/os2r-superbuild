.. _open_sim2real:

Open Sim2Real
=============

.. include open_sim2real/getting_started/what/what_is_opensim2real


.. include open_sim2real/getting_started/why/why_opensim2real



Open Sim2Real
-------------

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
