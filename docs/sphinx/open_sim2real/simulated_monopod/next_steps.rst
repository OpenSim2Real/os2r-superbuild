.. _sim_next_steps:

Next Steps
==========

Next steps explains how to work with the more advanced features ``gym-os2r``
has to offer. Many of these features are still in developed and have not been
extensively tested. If you encountered any issues or questions while using our
package please provide feedback or suggestions. Additionally, this page provides
references to examples on using the gym-os2r environment with PPO/SAC.

Custom Reward Class
-------------------

Example of how to creating a custom reward function. This reward will
simply read the angle of the boom relative to the ground and check if it is between some bounds
if it is between the bounds the reward equals one, otherwise zero. This reward function can then be
injected into a training environment using the ``kwargs``. This provides an abstracted approach to
reward functions making development of new control algorithms for the monopod easier.

.. code-block:: python

  from gym_os2r.rewards import RewardBase
  from gym_os2r.reward.rewards_utils import tolerance

  # Example custom Reward
  class CustomReward(RewardBase):
  """
  Custom example reward.
  """

      def __init__(self, observation_index: dict):
          super().__init__(observation_index)

          # Set the 'task_mode' that are supported y the reward as a safety check.
          # in the form self.supported_task_modes = ['free_hip', 'fixed_hip', 'fixed', ... ]
          self.supported_task_modes = self._all_task_modes

      def calculate_reward(self, obs: Observation, action: Action) -> Reward:
          _LOW = 0.2
          _HIGH = 0.4

          # Observation array can be indexed using the name of the observation you wish to
          # index. This is done using the observation_index dictionary which has indexes in
          # the format '<jointname>_pos', and '<jointname>_vel'. The example below gets
          # the position of the planarizer_pitch_joint.
          cur_pitch_pos = obs[self.observation_index['planarizer_pitch_joint_pos']]

          # tolerance is a helper function to scale and bound the observation.
          return tolerance(cur_pitch_pos, (_LOW, _HIGH))

  kwargs = {'reward_class': ExampleV0}
  make_env = functools.partial(make_env_from_id, env_id=env_id, **kwargs)
  env = randomizers.monopod.MonopodEnvRandomizer(env=make_env)

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
The default configuration file is found in "gym_os2r/models/config/default/settings.yaml".
The example showing how to update reset positions above shows how the configuration can be
updated externally (be very careful because there are minimal safe guards). Alternatively
you can update the "settings.yaml" file directly. This is the recommended method for larger
changes. The settings file has a little bit of documentation describing what changing each
variable represents.

.. note::

  If you have a better idea on how to structure the model configuration
  (joint information and reset information) or more generally ``gym-os2r`` I
  would gladly attempt to implement/reformat the package structure.

Training Implementation
-----------------------

We have implemented PPO/SAC following the OpenAI spinning up examples. The code
for our training scripts can be found `here <https://github.com/OpenSim2Real/rl-algorithm-exploration>`_.

.. note::

  Many algorithms such as SAC might not be suitable to train on real without modification or
  large compute. On policy training may cause issues for the robots real-time schedule. There
  are a few creative work arounds that may be interesting avenues for future research.
