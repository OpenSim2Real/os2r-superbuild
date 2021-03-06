Developer Installation
======================

We encourage anyone to contribute to this project. There are currently two ways
to install :ref:`gym-os2r` which allow the user to develop.

1. Editable pip installation
2. Superbuild installation

.. include:: ../../shared/ignition_gazebo.rst

Pip Installation
----------------

.. code-block:: bash

  cd <Install Dir>
  git clone git@github.com:OpenSim2Real/gym-os2r.git
  cd gym-os2r
  pip install -e .


Superbuild Installation
-----------------------

The super build is a convenient way to build all required packages for different
build types from source. The superbuild provides a bash script which is then
sourced to set up the environment for the superbuild. It is necessary to install
a lot of the dependencies manually to use the super build. The complete superbuild dependencies list for every
build option and additional info on what the superbuild is can be found :ref:`here <os2r-superbuild>`.

There are no provided instructions on how to use the superbuild as a developer for only simulation components.
However, the easiest way to use the superbuild as a developer will be to install all packages that are a dependency
of the current package you wish to develop for then clone and develop that repo separate from the superbuild.
