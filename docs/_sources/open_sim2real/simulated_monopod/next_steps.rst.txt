.. _sim_next_steps:

Next Steps
==========

Training Implementation
-----------------------

We have implemented PPO/SAC following the OpenAI spinning :footcite:`SpinningUp2018` up examples. The code
for our training scripts can be found `here <https://github.com/OpenSim2Real/rl-algorithm-exploration>`_.

.. note::

  Many algorithms such as SAC might not be suitable to train on real without modification or
  large compute. On policy training may cause issues for the robots real-time schedule. There
  are a few creative work arounds that may be interesting avenues for future research.


|

  .. footbibliography::
