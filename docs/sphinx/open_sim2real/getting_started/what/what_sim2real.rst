What's Sim2Real
===============

The interest and appeal of simulation to reality transfer stems from the risks and costs associated with poor performance during training.
Crashing in real will break physical hardware, while inefficient control can overheat motors and strain other electrical components.
Due to the current era of compute, the safe, low-cost, and fast training that simulation provides has made the topic popular in research.


Some examples of successful sim2real transfer include the :cite:`sadeghi2016cad2rl` system of Sadeghi and Levine, deployed
to a collision avoiding drone; the paper by Muller et al. :cite:`muller2018driving`, with their remote-controlled cars that leveraged modularity
and abstraction in the control policy; the results of Tan et al. :cite:`tan2018sim`, who trained a quadruped to have robust locomotion in real
by leveraging domain randomization; and finally, Mysore et al. :cite:`mysore2021regularizing`, with a framework that regularizes the objective
function of the algorithm to promote smooth control around neighbouring and sequential observation states.


.. bibliography::
   :list: enumerated
   :enumtype: upperroman

..
  bibliography::
  :labelprefix: A
  :keyprefix: a-
