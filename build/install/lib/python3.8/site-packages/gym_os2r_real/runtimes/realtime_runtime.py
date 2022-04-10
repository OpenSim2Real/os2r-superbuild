from gym_ignition.base import runtime, task
from gym_ignition.utils.typing import Action, Done, Info, Observation, State
from gym_ignition.utils import logger

from scenario import monopod as scenario
import real_time_tools as rt
import numpy as np
import time

import sys
def eprint(*args, **kwargs):
    print('\033[93m',"[Warn] ", *args, '\033[0m', file=sys.stderr, **kwargs)

class RealTimeRuntime(runtime.Runtime):
    """
    Implementation of :py:class:`~gym_ignition.base.runtime.Runtime` for
    real-time execution.

    Warning:
        This class is not yet complete.
    """

    def __init__(self, task_cls: type, agent_rate: float, task_mode: str,
                 **kwargs):

        self.task_mode = task_mode
        # World attributes
        self._world = None
        self._model = None

        # Build the environment
        task_object = task_cls(agent_rate=agent_rate, task_mode=task_mode,
         **kwargs)

        assert isinstance(
            task_object, task.Task
        ), "'task_cls' object must inherit from Task"

        super().__init__(task=task_object, agent_rate=agent_rate)

        # Initialize the scenario world through property decorator
        _ = self.world
        _ = self.model

        # Initialize the spaces
        self.action_space, self.observation_space = self.task.create_spaces()

        # Store the spaces also in the task
        self.task.action_space = self.action_space
        self.task.observation_space = self.observation_space

        self.spinner = rt.FrequencyManager(agent_rate)  # real time spinner.
        self.missed_rt = 0
        self.steps_elapsed = 0

    # =================
    # Runtime interface
    # =================

    def timestamp(self) -> float:

        raise NotImplementedError

    # =================
    # gym.Env interface
    # =================

    def step(self, action: Action) -> State:

        # Validate action and robot
        assert self.action_space.contains(action), "%r (%s) invalid" % (
            action,
            type(action),
        )

        # Set the action
        ok_action = self.task.set_action(action)
        assert ok_action, "Failed to set the action"

        # TODO: check real time loop speed to make sure it is possible.
        self.missed_rt = self.missed_rt  - self.spinner.wait() + 1
        self.steps_elapsed = self.steps_elapsed + 1

        # Get the observation
        observation = self.task.get_observation()

        # Todo: make sure we do not want to assert here.

        # assert self.observation_space.contains(observation), "%r (%s) invalid" % (
        #     observation,
        #     type(observation),
        # )

        if not self.observation_space.contains(observation):
            eprint("The observation does not belong to the observation space")

        # Get the reward
        reward = self.task.get_reward()

        # Check termination
        done = self.task.is_done()

        # Verify robot is not in safemode.
        done = done or not self.model.valid()

        return State((observation, reward, Done(done), Info({})))

    def reset(self) -> Observation:

        if self.missed_rt:
            eprint(f"Realtime_Runtime missed Realtime {self.agent_rate} Hz controller rate."
            f" The real time controller missed '{self.missed_rt}' steps over "
            f" {self.steps_elapsed} steps. This means {self.missed_rt/self.steps_elapsed *100:.2f}%"
            " of steps failed to maintain schedule. Make sure that the agent_rate is suitable"
            " for realtime schedule.")

        self.steps_elapsed = 0
        self.missed_rt = 0
        # Reset the task
        self.task.reset_task()

        # Todo: Reset moves the robot to zero position. Make sure this is known
        # and that the user is ready for it
        input("Press enter when monopod is safe to move back to home.\n")

        # Resets safemode, goes to zero, sets control to zero
        scenario.ToMonopodModel(self.model).reset()

        # # # TODO: add pause (for manual reset)
        # # Wait for external input before continuing.
        # input("Press Enter when robot is in its reset position...")

        # Get the observation
        observation = self.task.get_observation()
        assert isinstance(observation, np.ndarray)

        if not self.observation_space.contains(observation):
            eprint("The observation does not belong to the observation space")


        input("Press enter when robot is safe to move.\n")

        # Spin here to avoid warning in step.
        self.spinner.wait()

        return Observation(observation)

    def render(self, mode: str = "human", **kwargs) -> None:
        raise NotImplementedError

    def close(self) -> None:
        raise NotImplementedError

    def get_state_info(self, state: Observation, action: Action):
        return self.task.get_state_info(state, action)

    def calibrate(self):
        # 1. Place the robot boom on a custom stand. Fixes the Planarizer pitch joint
        # 2. Ensure all non-actuated joints are in the fixed consistent location - This is especially important for the pelvis joint.
        # 3. Calibrate Leg with no offset (finds the first index and sets it to be new zero) Note: (make sure the leg is close to straight).
        # 4. Use jig to hold robot knee and hip joints at proper zero and record the position of the hip and knee. This will then be the new offset used during calibration.
        # 5. Run calibration again with new offset values (make sure the leg is close to straight).
        # 6. Values will not change unless the robot has been changed mechanically (encoders rotated etc).
        scenario.ToMonopodModel(self._model).calibrate(0 , 0)

    @property
    def world(self) -> scenario.World:

        if self._world is not None:
            # assert self._world.valid()
            return self._world

        # Create the world
        world = scenario.World()
        modes = {
            "free_hip" : scenario.Mode_free,
            "fixed_hip" : scenario.Mode_fixed_connector,
            "fixed" : scenario.Mode_fixed,
            "simple" : scenario.Mode_motor_board
        }

        # TODO: Remove the dummy mode
        world.initialize(modes[self.task_mode])
        # world.initialize(modes[self.task_mode], True)

        # Set the world in the task
        self.task.world = world

        # Store the world in runtime
        self._world = world

        return self._world

    @property
    def model(self) -> scenario.Model:

        if self._model is not None:
            return self._model

        # Create the model
        model_name = self._world.model_names()[0]
        model = self._world.get_model(model_name)

        # Set the model in the task
        self.task.model = model
        assert model.valid(), "Model is not in a valid state on initialization."

        # Set the model name in the task.
        self.task.model_name = model.name()

        # Store the model in runtime
        self._model = model

        # TODO: Set joint limits here from the config file. This should match
        # the gym_os2r configs for each task_mode
        for joint in model.joints():
            # name = joint.name()
            max = 3.14
            min = -3.14
            scenario.ToMonopodJoint(joint).set_joint_position_limit(max, min)
            # scenario.ToMonopodJoint(joint).set_joint_velocity_limit(max, min)

        return self._model
