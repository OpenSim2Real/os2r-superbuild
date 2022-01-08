Next Steps
==========
Next steps explains how to work with some of the more advanced features ``gym-os2r``
has to offer. Many of these features have minimal testing and would appreciate any
feedback on errors encountered. Additionally there is a small example on how to
implement SAC using gym-os2r.

Custom Reward Class
-------------------

Example of creating a custom reward function for training some task. This reward will
simply read the angle of the boom relative to the ground and check if it is between some bounds
if it is between the bounds the reward equals one, otherwise zero. This reward function can then be
injected into a training environment using the ``kwargs``. This provides an abstracted approach to
reward functions making development of new control algorithms for the monopod faster.

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

Custom Reset Position
---------------------

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
  cfg.set_config(new_pitch, xpath + '/planarizer_pitch_joint_pos')


  env_id = "Monopod-stand-v1"
  kwargs = {
    'reset_positions': ['name_reset']
  }

  make_env = functools.partial(make_env_from_id, env_id=env_id, **kwargs)
  env = randomizers.monopod_no_rand.MonopodEnvNoRandomizer(env=make_env)


The form of each reset position is below. The xpath above sets the following variables.

.. code-block:: yaml

  resets:
    name_reset:
      laying_down: True
      planarizer_pitch_joint: 0.4

More on Custom Model Configs
----------------------------

.. note::

  I do not recommend changing the model config file much. This is a
  fairly fragile component in this project. If there was a better way to encode
  the model joint information and reset information I would gladly attempt to
  implement it instead.

If you still desire to update the model config here is a short explanation on
what to expect. Firstly It is recommended to be have ``gym-os2r`` installed as a
developer. The config implementation can be found :py:mod:`here <gym_os2r.models.config>`.

Sac Training Example
--------------------

.. note::

  Sac will not be suitable to train on real without modification. The update steps
  done at each time step means that it is unable to handle real-time. This issue does
  not affect simulation. There is a few creative work arounds I am sure you can think of.
