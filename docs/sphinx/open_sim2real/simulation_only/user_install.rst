Regular Installation
====================

This project may not be perfectly stable at this moment and may require modifications
to get the installation to work. Hopefully in the near future we will create a stable
version to accompany the unstable rapidly developing version. We provide three semi-stable
ways to install :ref:`gym-os2r` for reinforcement learning.

1. Pip installation.
2. :ref:`singularity_container`.
3. :ref:`os2r-superbuild_sim_only`.

Ignition Gazebo
---------------
Install ignition version found in the :ref:`support_policy_sim_only`.

.. note::
  It maybe be necessary to add the following to your bashrc

  .. code-block:: bash
  
    export IGN_GAZEBO_PHYSICS_ENGINE_PATH=${IGN_GAZEBO_PHYSICS_ENGINE_PATH}:/usr/lib/x86_64-linux-gnu/ign-physics-5/engine-plugins/


pip Installation
-------------------

.. code-block:: bash

  pip install git+https://github.com/OpenSim2Real/gym-os2r.git

.. _os2r-superbuild_sim_only:

Superbuild Installation
-----------------------

The super build is a convenient way to build all required packages from source.
It is necessary to install a lot of the dependencies from source to use the super build.
The complete superbuild dependencies list for every build option and additional info on what
the superbuild is can be found :ref:`here <os2r-superbuild>`.

Dependencies
^^^^^^^^^^^^

.. code-block:: bash

  sudo apt install swig
