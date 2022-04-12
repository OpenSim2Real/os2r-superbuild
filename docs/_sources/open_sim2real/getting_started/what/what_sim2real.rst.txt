What's Sim2Real
===============

The interest and appeal of simulation to reality transfer stems from the risks and costs associated with poor performance during training.
Crashing in real will break physical hardware, while inefficient control can overheat motors and strain other electrical components.
Due to the current era of compute, the safe, low-cost, and fast training that simulation provides has made the topic popular in research.


Some examples of successful sim2real transfer include the :footcite:`sadeghi2016cad2rl` system of Sadeghi and Levine, deployed
to a collision avoiding drone; the paper by Muller et al. :footcite:`muller2018driving`, with their remote-controlled cars that leveraged modularity
and abstraction in the control policy; the results of Tan et al. :footcite:`tan2018sim`, who trained a quadruped to have robust locomotion in real
by leveraging domain randomization; and finally, Mysore et al. :footcite:`mysore2021regularizing`, with a framework that regularizes the objective
function of the algorithm to promote smooth control around neighbouring and sequential observation states.

Our work follows from the above by focusing on robustness, generality, and promoting smooth control. This is achieved through the use of a randomizer,
to generalize among a distribution of values of physical parameters; exploration methods, to provide robustness over the state space; and the latest
framework described by Mysore et al. :footcite:`mysore2021regularizing`, which aids in producing a smoother and more efficient control. Further explanation
of these techniques are described below.

 .. footbibliography::
