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

**Superbuild Options**
----------------------

All optional builds that are supported by the superbuild are listed in the table below.

+-------------------------------------------+------------+---------------------------------------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``<CMAKE_ARG>``                           | Default    | Depends                               | Feature Description                                                                                                                                                           |
+===========================================+============+=======================================+===============================================================================================================================================================================+
| None                                      | --         | :ref:`deps <enable_monopod_sdk>`      | All the dependencies required to build :ref:`monopod_sdk` externally. Requires same dependencies as monopod sdk option.                                                       |
+-------------------------------------------+------------+---------------------------------------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``OPENSIM2REAL_ENABLE_ALL``               | ``FALSE``  | :ref:`deps <enable_all>`              | Entire Open Sim2Real software stack. Contains components for both simulation and real.  :ref:`gym-os2r`can be used to train on real and simultion monopod.                    |
+-------------------------------------------+------------+---------------------------------------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``OPENSIM2REAL_ENABLE_MONOPODSDK``        | ``FALSE``  | :ref:`deps <enable_monopod_sdk>`      | :ref:`monopod_sdk` is a realtime SDK for monopod platform. Allows user to control the monopod hardware.                                                                       |
+-------------------------------------------+------------+---------------------------------------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``OPENSIM2REAL_ENABLE_SCENARIO``          | ``FALSE``  | :ref:`deps <enable_scenario>`         | `ScenarIO <https://robotology.github.io/gym-ignition/master/what/what_is_scenario.html>`_ interface. By default :ref:`scenario_monopod` plugin will extend vanilla scenarIO.  |
+-------------------------------------------+------------+---------------------------------------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``OPENSIM2REAL_ENABLE_SCENARIO_MONOPOD``  | ``TRUE``   | :ref:`deps <enable_scenario>`         | :ref:`scenario_monopod` real-time backend plugin for scenario. this plugin provides a real-time backend for the monopod platform.                                             |
+-------------------------------------------+------------+---------------------------------------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``OPENSIM2REAL_ENABLE_GYMIGNITION``       | ``TRUE``   | :ref:`deps <enable_gym-ignition>`     | `gym-ignition <https://robotology.github.io/gym-ignition/master/what/what_is_gym_ignition.html>`_ python package.                                                             |
+-------------------------------------------+------------+---------------------------------------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``OPENSIM2REAL_ENABLE_GYMOS2R``           | ``FALSE``  | :ref:`deps <enable_gym-os2r>`         | :ref:`gym-os2r` python package provides the gym environments for the monopod platform. Both real and sim is supported for training and inference.                             |
+-------------------------------------------+------------+---------------------------------------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``OPENSIM2REAL_ENABLE_SIMULATION_ONLY``   | ``FALSE``  | :ref:`deps <enable_simulation_only>`  | Compiles only the components necessary to use the gym environments in simulation.                                                                                             |
+-------------------------------------------+------------+---------------------------------------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``OPENSIM2REAL_ENABLE_DOC_COMPILATION``   | ``FALSE``  | :ref:`deps <enable_doc_compilation>`  | Allows developers to rebuild the projects documentation webpage.                                                                                                              |
+-------------------------------------------+------------+---------------------------------------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``OPENSIM2REAL_USES_PYTHON``              | ``TRUE``   | --                                    | Must be enabled to compile python bindings and modules.                                                                                                                       |
+-------------------------------------------+------------+---------------------------------------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+

**Building and Installation**
-----------------------------

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

.. warning::

  **Before building any option that requires python please make sure the following
  pip/python packages are uninstalled: ``gym-ignition``, ``scenario``, and ``idyntree``.**


To update the repos in the superbuild make sure you are in the build
directory of the os2r-superbuild and run:

::

   make update-all
   make

.. note::

  To update the superbuild (change the build option or update the repos) it
  might be necessary to remove the ``os2r-superbuild/build`` and ``os2r-superbuild/src``
  folders then reconfigure and build the project. Sometimes update is not sufficient.

.. warning::

  **You might need to restart your computer after installing the dependencies
  before building the superbuild.**

.. warning::

  **If you are having issues with dependencies and building try installing ignition
  even if you are only using hardware build options.**

.. _superbuild_sourcing:

**Sourcing Environment**
------------------------

Now to use the installed packages either source the ``setup.sh`` script each time
you open a new terminal and need to run the packages or add the setup
script to your ``~/.bashrc``. Make sure to replace ``<Install Dir>``
with the corresponding absolute path.

1. Sourcing the script and single time after terminal is launch can be
   done by running the code below in your terminal:

  .. code-block:: bash

     source <Install Dir>/os2r-superbuild/build/install/share/os2r-superbuild/setup.sh

2. To automatically source the environment each time the terminal is launched run
   the following code in your terminal then restart the terminal.

  .. code-block:: bash

     echo 'source <Install Dir>/os2r-superbuild/build/install/share/os2r-superbuild/setup.sh' >> ~/.bashrc


**Options Dependencies**
------------------------

Each build option has different required dependencies. Please refer to the
dependencies that match your build configuration. Alternatively you can install all dependencies
following the :ref:`enable_all`.

.. _enable_all:

**ALL**
^^^^^^^^^^^^^^^^^^^^^^^^^^^

Dependencies required to build the super with ``OPENSIM2REAL_ENABLE_ALL`` option enabled.

.. code-block:: bash

   sudo apt-add-repository universe
   sudo apt update
   sudo apt upgrade

.. code-block:: bash

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
.. code-block:: bash

  sudo apt update
  sudo apt install python3-pip
  pip3 install cmake_build_extension gym gym_ignition_models scipy numpy

.. _enable_monopod_sdk:

**MONOPODSDK**
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Dependencies required to build the super with ``OPENSIM2REAL_ENABLE_MONOPODSDK`` option enabled.

.. _enable_scenario:

**SCENARIO**
^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Dependencies required to build the super with ``OPENSIM2REAL_ENABLE_SCENARIO`` option enabled.
This option has another sub option ``OPENSIM2REAL_ENABLE_SCENARIO_MONOPOD`` which will determine
whether to install the ``scenario_monopod`` plugin on top of ``scenario``.

.. note::

  By default ``OPENSIM2REAL_ENABLE_SCENARIO_MONOPOD`` is enabled unless the user specifies
  :ref:`only simulation <enable_simulation_only>` compilation. This option should never be
  manually specified unless developing :ref:`scenario_monopod`.

.. _enable_gym-ignition:

**GYMIGNITION**
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Dependencies required to build the super with ``OPENSIM2REAL_ENABLE_GYMIGNITION`` option enabled.

.. _enable_gym-os2r:

**GYMOS2R**
^^^^^^^^^^^^^^^^^^^^^^^^^^^

Dependencies required to build the super with ``OPENSIM2REAL_ENABLE_GYMOS2R`` option enabled.


.. _enable_simulation_only:

**SIMULATION_ONLY**
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Dependencies required to build the super with ``OPENSIM2REAL_ENABLE_SIMULATION_ONLY`` option
enabled. Will only read ``OPENSIM2REAL_ENABLE_GYMOS2R`` option when enabled, all other options
will be ignored.


.. _enable_doc_compilation:

**DOC_COMPILATION**
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Dependencies required to build the super with ``OPENSIM2REAL_ENABLE_DOC_COMPILATION`` option
enabled. Requires ``OPENSIM2REAL_ENABLE_ALL`` to be enabled.

::

   pip install sphinx-multiversion sphinx_autodoc_typehints sphinx_fontawesome sphinx_book_theme sphinx_tabs lxml
   pip install -U breathe

To update the docs on the webpage after building the docs use the below
sequence,

::

   git checkout gh-pages
   git rm -r -f .
   mv  -v ./build/html/* ./
   rm -f -r build src
   echo '' >> .nojekyll
   git add .
   git commit -m "publish new docs"
   git push


.. _ignition_installation_superbuild:

.. include:: ../../general_includes/ignition_gazebo.rst
