Developer Installation
======================

We encourage anyone to contribute to this project. There are currently two ways
to install :ref:`gym-os2r` which allow the user to develop.

1. Editiable pip installation
2. Superbuild installation


Ignition Gazebo
---------------
Install ignition version found in the :ref:`support_policy_sim_only`.

.. note::

  It maybe be necessary to add the following to your bashrc

  .. code-block:: bash

    export IGN_GAZEBO_PHYSICS_ENGINE_PATH=${IGN_GAZEBO_PHYSICS_ENGINE_PATH}:/usr/lib/x86_64-linux-gnu/ign-physics-5/engine-plugins/

Pip Installation
-------------------

Dependencies
^^^^^^^^^^^^

Install ignition gazebo.

Installation
^^^^^^^^^^^^

.. code-block:: bash

  cd location/you/want/repo
  git clone git@github.com:OpenSim2Real/gym-os2r.git
  cd gym-os2r
  pip install -e .


Superbuild Installation
-----------------------

The super build is a convenient way to build all required packages from source.
It is necessary to install a lot of the dependencies from source to use the super build.
The complete superbuild dependencies list for every build option and additional info on what
the superbuild is can be found :ref:`here <os2r-superbuild>`.
