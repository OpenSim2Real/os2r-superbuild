Next Steps
==========


Custom Reward Class
-------------------

Example of creating a custom reward function for training some task. This reward will
simply read the angle of the boom relative to the ground and check if it is between some bounds
if it is between the bounds the reward equals one, otherwise zero. This reward function can then be
injected into a training environment using the ``kwargs``. This provides an abstracted approach to reward
functions making development of new control algorithms for the monopod faster.

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

          # Observation array can be indexed using the name of the observation you wish to index.
          # This is done using the observation_index dictionary which has indexes in the format
          # '<jointname>_pos', and '<jointname>_vel'. The example below gets the position of the planarizer_pitch_joint.
          cur_pitch_pos = obs[self.observation_index['planarizer_pitch_joint_pos']]

          # tolerance is a helper function to scale and bound the observation.
          return tolerance(cur_pitch_pos, (_LOW, _HIGH))

Custom Reset Position
---------------------



Sac Training Example
--------------------
