Standard Installation
=====================

This project may not be perfectly stable at this moment and may require modifications
to get the installation to work. Hopefully in the near future we will create a stable
version to accompany the unstable rapidly developing version. We provide three semi-stable
ways to install :ref:`gym-os2r` for reinforcement learning.

1. :ref:`pip_install_sim_only`.
2. :ref:`singularity_container`.
3. :ref:`os2r-superbuild_sim_only`.

.. include:: ../../shared/ignition_gazebo.rst

.. _pip_install_sim_only:

Pip Installation
----------------

.. code-block:: bash

  pip install git+https://github.com/OpenSim2Real/gym-os2r.git

.. _os2r-superbuild_sim_only:

Superbuild Installation
-----------------------

The super build is a convenient way to build all required packages from source. The
superbuild provides a bash script which is then sourced to access all the components
outside the superbuild. It is necessary to install a lot of the dependencies
manually to use the super build. The complete superbuild dependencies list for every
build option and additional info on what the superbuild is can be found
:ref:`here <os2r-superbuild>`.

To use superbuild to compile and build the simulation only option please install all
dependencies listed for simulation only following the instructions
:ref:`enable_simulation_only`. Building the simulation only superbuild.

.. code-block:: bash

  cd <Install Dir>
  git clone git@github.com:OpenSim2Real/os2r-superbuild.git
  cd os2r-superbuild
  cmake -S . -B build -DOPENSIM2REAL_ENABLE_SIMULATION_ONLY:BOOL=TRUE
  cmake --build build

Now to access the superbuild components you need to
:ref:`source the superbuild <superbuild_sourcing>` environment.
