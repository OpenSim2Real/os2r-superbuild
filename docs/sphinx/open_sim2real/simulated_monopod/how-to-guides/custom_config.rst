


Custom Model Configs
--------------------

The model configuration handles the following items:
1. Defines the joint action and observation limits
2. Defines joints as periodic or linear observations.
3. Defines ``task_mode`` (Which model is being used i.e fixed_hip, free_hip, etc)
4. Allows observation masking (Omit specified observation from observation space)
5. Defines robot dimensions. Used to calculate leg angles to match specific reset height

.. warning::

  I do not recommend changing the model config file without a complete understanding
  of the projects software stack. Configuration files might be fragile and will be
  updated in future along with :ref:`gym-os2r`.

If you still want to update the model config here is a short explanation on
what to expect. Firstly It is recommended to be have ``gym-os2r`` installed as a
developer. The config implementation can be found :py:mod:`here <gym_os2r.models.config>`.


The default configuration file is found in ``gym_os2r/models/config/default/settings.yaml``.
The example showing how to update or add reset positions :ref:`here <custom_reset>`, shows how the configuration can be
updated externally (be careful, there aren't many safe guards for bad modifications).

Alternatively you can update the ``settings.yaml`` file directly. This is the recommended method for larger
changes. The settings file has a little bit of documentation describing what changing each
variable represents.

.. note::

  If you have a better idea on how to structure the model configuration
  (joint information and reset information) or more generally ``gym-os2r`` I
  would gladly attempt to implement/reformat the package structure.


.. _custom_reset:

Custom Reset Position
---------------------

The information defining each reset position is below. Each item is defined as a
xpath. Lay implies the robot will be horizontal in a 'laying' position. 'planarizer_pitch_joint'
defines the angle of the planarizer pitch from horizontal.

.. code-block:: yaml

  resets:
    name_reset:
      laying_down: True
      planarizer_pitch_joint: 0.4

We can set/modify the value for a new/existing reset position following the
method below.

.. code-block:: python

  from gym_os2r import randomizers
  from gym_os2r.common import make_env_from_id
  from gym_os2r.models.config import SettingsConfig

  reset_position = 'name_reset'

  cfg = SettingsConfig()
  xpath = 'resets/' + reset_position

  new_pitch = 0.4
  laying_down = True

  cfg.set_config(laying_down, xpath + '/laying_down')
  cfg.set_config(new_pitch, xpath + '/planarizer_pitch_joint')


  env_id = "Monopod-stand-v1"
  kwargs = {
  'reset_positions': ['name_reset'],
  'config': cfg
  }

  make_env = functools.partial(make_env_from_id, env_id=env_id, **kwargs)
  env = randomizers.monopod_no_rand.MonopodEnvNoRandomizer(env=make_env)
