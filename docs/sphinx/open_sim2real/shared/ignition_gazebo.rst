Ignition Gazebo Installation
----------------------------

Required ignition gazebo version can be found in the :ref:`support_policy_sim_only`.
Please install ignition gazebo following binary installation instructions on the
`ignition`_ website (Installing from source also works but is unnecessary).

.. _`ignition`: https://ignitionrobotics.org/docs/fortress/install

.. note::

  It maybe be necessary to add the following to your bashrc.

  .. code-block:: bash

    export IGN_GAZEBO_PHYSICS_ENGINE_PATH=${IGN_GAZEBO_PHYSICS_ENGINE_PATH}:/usr/lib/x86_64-linux-gnu/ign-physics-5/engine-plugins/

  To add it you can simply run the following code.

  .. code-block:: bash

    echo 'export IGN_GAZEBO_PHYSICS_ENGINE_PATH=${IGN_GAZEBO_PHYSICS_ENGINE_PATH}:/usr/lib/x86_64-linux-gnu/ign-physics-5/engine-plugins/' >> ~/.bashrc

.. note::

  **If you had an old version of ignition installed prior you might
  need to remove the config folder**: Ignition should create a new one the next
  time it starts.

  .. code-block:: bash

     mv $HOME/.ignition $HOME/.ignition_bak

  If there are still folder errors, try to create the folder yourself

  .. code-block:: bash

     mkdir -p $HOME/.ignition/gazebo/6
