.. _os2r-superbuild:

Superbuild Installation
===========================

This is a meta repository (so-called "superbuild") that uses `CMake`_
and `YCM`_ to automatically download and compile software developed in
the OpenSim2Real GitHub organization. This superbuild is based on the
`robotology-superbuild`_\ .

`CMake`_ is an open-source, cross-platform family of tools designed to
build, test and package software. A `YCM Superbuild`_ is a CMake project
whose only goal is to download and build several other projects. If you
are familiar with ROS, it is something similar to `catkin`_ or `colcon
workspace`_, but using pure CMake for portability reasons and for
customizing the build via CMake options.

.. _CMake: https://cmake.org/
.. _YCM: https://github.com/robotology/ycm
.. _robotology-superbuild: https://github.com/robotology/robotology-superbuild
.. _YCM Superbuild: http://robotology.github.io/ycm/gh-pages/git-master/index.html#superbuild
.. _catkin: http://wiki.ros.org/catkin/workspaces
.. _colcon workspace: https://colcon.readthedocs.io/en/released/user/quick-start.html


.. _superbuild_options:

Superbuild Options
------------------

All optional builds that are supported by the superbuild are listed in the table below.

+-------------------------------------------+------------+---------------------------------------+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``<CMAKE_ARG>``                           | Default    | Depends                               | Feature Description                                                                                                                                                                                                                                                                                                                                                 |
+===========================================+============+=======================================+=====================================================================================================================================================================================================================================================================================================================================================================+
| None                                      | --         | :ref:`deps <enable_monopod_sdk>`      | All the dependencies required to build :ref:`monopod_sdk` externally. Requires same dependencies as monopod sdk option.                                                                                                                                                                                                                                             |
+-------------------------------------------+------------+---------------------------------------+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``OPENSIM2REAL_ENABLE_ALL``               | ``FALSE``  | :ref:`deps <enable_all>`              | Entire Open Sim2Real software stack. Contains components for both simulation and real.  :ref:`gym-os2r` can be used to train on real and simultion monopod.                                                                                                                                                                                                         |
+-------------------------------------------+------------+---------------------------------------+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``OPENSIM2REAL_ENABLE_MONOPODSDK``        | ``FALSE``  | :ref:`deps <enable_monopod_sdk>`      | :ref:`monopod_sdk` is a realtime SDK for monopod platform. Allows user to control the monopod hardware.                                                                                                                                                                                                                                                             |
+-------------------------------------------+------------+---------------------------------------+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``OPENSIM2REAL_ENABLE_SCENARIO``          | ``FALSE``  | :ref:`deps <enable_all>`              | `ScenarIO <https://robotology.github.io/gym-ignition/master/what/what_is_scenario.html>`_ interface. This option has another sub option ``OPENSIM2REAL_ENABLE_SCENARIO_MONOPOD`` which will determine whether to install the :ref:`scenario_monopod` plugin on top of `ScenarIO <https://robotology.github.io/gym-ignition/master/what/what_is_scenario.html>`_\ .  |
+-------------------------------------------+------------+---------------------------------------+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``OPENSIM2REAL_ENABLE_SCENARIO_MONOPOD``  | ``TRUE``   | :ref:`deps <enable_all>`              | :ref:`scenario_monopod` real-time backend plugin for scenario. this plugin provides a real-time backend for the monopod platform. Enabled unless the user specifies :ref:`simulation only <enable_simulation_only>` compilation. This option should never be manually specified unless developing :ref:`scenario_monopod`. :ref:`monopod_sdk` is a dependencies.    |
+-------------------------------------------+------------+---------------------------------------+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``OPENSIM2REAL_ENABLE_GYMIGNITION``       | ``TRUE``   | :ref:`deps <enable_all>`              | `gym-ignition <https://robotology.github.io/gym-ignition/master/what/what_is_gym_ignition.html>`_ python package.                                                                                                                                                                                                                                                   |
+-------------------------------------------+------------+---------------------------------------+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``OPENSIM2REAL_ENABLE_GYMOS2R``           | ``FALSE``  | :ref:`deps <enable_all>`              | :ref:`gym-os2r` python package provides the gym environments for the monopod platform. Both real and sim is supported for training and inference.                                                                                                                                                                                                                   |
+-------------------------------------------+------------+---------------------------------------+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``OPENSIM2REAL_ENABLE_SIMULATION_ONLY``   | ``FALSE``  | :ref:`deps <enable_simulation_only>`  | Compiles only the components necessary to use the gym environments in simulation. Will only read ``OPENSIM2REAL_ENABLE_GYMOS2R`` option when enabled, all other options will be ignored.                                                                                                                                                                            |
+-------------------------------------------+------------+---------------------------------------+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``OPENSIM2REAL_ENABLE_DOC_COMPILATION``   | ``FALSE``  | :ref:`deps <enable_doc_compilation>`  | Allows developers to rebuild the projects documentation webpage.                                                                                                                                                                                                                                                                                                    |
+-------------------------------------------+------------+---------------------------------------+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``OPENSIM2REAL_USES_PYTHON``              | ``TRUE``   | --                                    | Must be enabled to compile python bindings and modules.                                                                                                                                                                                                                                                                                                             |
+-------------------------------------------+------------+---------------------------------------+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+

Building and Installation
-------------------------

After selecting the desired :ref:`build option <superbuild_options>` and
installing the corresponding dependencies you can build the superbuild. To configure
and build any of the above options follow the general steps below.

.. code-block:: bash

  cd <Install Dir>
  git clone git@github.com:OpenSim2Real/os2r-superbuild.git
  cd os2r-superbuild
  cmake -S . -B build <CMAKE_OPTIONS>
  cmake --build build

The ``<CMAKE_OPTIONS>`` will be a list of arguments formatted in the following way,

1. Single arg: ``-D<CMAKE_ARG>:BOOL=TRUE/FALSE``
2. Multiple args: ``-D<CMAKE_ARG1>:BOOL=TRUE/FALSE -D<CMAKE_ARG2>:BOOL=TRUE/FALSE ...``

For example to install all components and compile the documentation the command will become.

.. code-block:: bash

  cmake -S . -B build -DOPENSIM2REAL_ENABLE_ALL:BOOL=TRUE -DOPENSIM2REAL_ENABLE_DOC_COMPILATION:BOOL=TRUE

To update the repos in the superbuild make sure you are in the build
directory of the os2r-superbuild and run:

.. code-block:: bash

   make update-all
   make

.. tip::

  To update the superbuild (change the build option or update the repos) it
  might be necessary to remove the ``os2r-superbuild/build`` and ``os2r-superbuild/src``
  folders then reconfigure and build the project. Sometimes update is not sufficient.

.. warning::

  **Before building any option that requires python please make sure the following
  pip/python packages are uninstalled:** ``gym-ignition``, ``scenario``, and ``idyntree``.

.. attention::

  **You might need to restart your computer after installing the dependencies
  before building the superbuild.**

.. attention::

  **If you are having issues with dependencies and building try installing ignition
  even if you are only using hardware build options.**

.. _superbuild_sourcing:

Sourcing Environment
--------------------

To use the installed superbuild there are two ways to source the environment with
the ``setup.sh``. Either source the script each time you open a new terminal that
needs access to the superbuild or add the ``setup.sh`` script to your ``~/.bashrc``.
For both options make sure to replace ``<Install Dir>`` with the corresponding absolute path.

1. Sourcing the script after launching a new terminal can be
   done with the following command:

.. code-block:: bash

   source <Install Dir>/os2r-superbuild/build/install/share/os2r-superbuild/setup.sh

2. Automatically source the environment every time the terminal is launched by calling
   the following commands a single time.

.. code-block:: bash

   echo 'source <Install Dir>/os2r-superbuild/build/install/share/os2r-superbuild/setup.sh' >> ~/.bashrc
   source ~/.bashrc


Options Dependencies
--------------------

Each build option has different required dependencies. Please refer to the
dependencies that match your build configuration. Alternatively you can install all dependencies
following the :ref:`enable_all`.

.. _enable_all:

All Dependencies
^^^^^^^^^^^^^^^^

Dependencies required to build the superbuild options: ``OPENSIM2REAL_ENABLE_ALL``,
``OPENSIM2REAL_ENABLE_SCENARIO``, ``OPENSIM2REAL_ENABLE_SCENARIO_MONOPOD``,
``OPENSIM2REAL_ENABLE_GYMIGNITION``, ``OPENSIM2REAL_ENABLE_GYMOS2R``.

1. :ref:`Install Ignition Gazebo <ignition_installation_superbuild>`

2. Apt dependencies

::

   sudo apt-add-repository universe
   sudo apt update
   sudo apt upgrade
   sudo apt-get install -y build-essential \
                           cmake \
                           python3-sphinx \
                           doxygen \
                           python3-breathe \
                           python3-pybind11 \
                           libboost-all-dev \
                           freeglut3-dev \
                           libedit-dev \
                           libxmu-dev \
                           libncurses-dev \
                           libcereal-dev \
                           coinor-libipopt-dev \
                           libirrlicht-dev \
                           libassimp-dev \
                           swig

3. Further Dependencies

.. code-block:: bash

  sudo apt update
  sudo apt install python3-pip
  pip3 install cmake_build_extension gym gym_ignition_models scipy numpy

.. _enable_monopod_sdk:

Monopod Sdk
^^^^^^^^^^^

Dependencies required to build the superbuild options: ``OPENSIM2REAL_ENABLE_MONOPODSDK``,
``Default``.

::

   sudo apt-add-repository universe
   sudo apt update
   sudo apt upgrade
   sudo apt-get install -y build-essential \
                           cmake \
                           python3-sphinx \
                           doxygen \
                           python3-breathe \
                           python3-pybind11 \
                           libboost-all-dev \
                           freeglut3-dev \
                           libedit-dev \
                           libxmu-dev \
                           libncurses-dev \
                           libcereal-dev

.. _enable_simulation_only:

Simulation Only
^^^^^^^^^^^^^^^

Dependencies required to build the superbuild options: ``OPENSIM2REAL_ENABLE_SIMULATION_ONLY``.

1. :ref:`Install Ignition Gazebo <ignition_installation_superbuild>`

2. Apt dependencies

.. code-block:: bash

   sudo apt-add-repository universe
   sudo apt update
   sudo apt upgrade
   sudo apt-get install -y build-essential \
                           cmake \
                           libxml2-dev \
                           libboost-all-dev \
                           libeigen3-dev \
                           coinor-libipopt-dev \
                           libirrlicht-dev \
                           libassimp-dev \
                           swig

3. Further Dependencies

.. code-block:: bash

  sudo apt update
  sudo apt install python3-pip
  pip3 install cmake_build_extension gym gym_ignition_models scipy numpy

.. _enable_doc_compilation:

Documentation Compilation
^^^^^^^^^^^^^^^^^^^^^^^^^

Dependencies required to build the superbuild options:
``OPENSIM2REAL_ENABLE_DOC_COMPILATION`` Requires ``OPENSIM2REAL_ENABLE_ALL``
to also be enabled. To compile the docs all dependencies of ``OPENSIM2REAL_ENABLE_ALL``
are required alongside the additional dependencies below.

.. code-block:: bash

   pip install sphinx-multiversion sphinx_autodoc_typehints sphinx_fontawesome sphinx_book_theme sphinx_tabs lxml sphinx-copybutton
   pip install -U breathe

To update the published docs to the new built docs use the below
commands,

.. code-block:: bash

  cd <Install Dir>/os2r-superbuild
  git checkout gh-pages
  git rm -r -f .
  mv  -v ./build/html/* ./
  rm -f -r build src
  echo '' >> .nojekyll
  git add .
  git commit -m "publish new docs"
  git push

.. _ignition_installation_superbuild:

.. include:: ../../shared/ignition_gazebo.rst
