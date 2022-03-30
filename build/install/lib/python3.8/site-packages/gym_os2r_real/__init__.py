import numpy
from . import runtimes
from gym_os2r import tasks

__all__ = ['runtimes']

from gym.envs.registration import register
from gym_os2r.rewards import *

register(
    id = 'Real-monopod-simple-v1',
    entry_point = 'gym_os2r_real.runtimes.realtime_runtime:RealTimeRuntime',
    max_episode_steps = 100000,
    kwargs={'task_cls': tasks.monopod.MonopodTask,
            'agent_rate': 1000,
            'task_mode': 'simple',
            'reward_class': StraightV1,
            'reset_positions': ['real']
            })


register(
    id = 'Real-monopod-hop-v1',
    entry_point = 'gym_os2r_real.runtimes.realtime_runtime:RealTimeRuntime',
    max_episode_steps = 100000,
    kwargs={'task_cls': tasks.monopod.MonopodTask,
            'agent_rate': 1000,
            'task_mode': 'fixed_hip',
            'reward_class': HoppingV1,
            'reset_positions': ['real']
            })


register(
    id = 'Real-monopod-balance-v1',
    entry_point = 'gym_os2r_real.runtimes.realtime_runtime:RealTimeRuntime',
    max_episode_steps = 100000,
    kwargs={'task_cls': tasks.monopod.MonopodTask,
            'agent_rate': 1000,
            'task_mode': 'fixed_hip',
            'reward_class': BalancingV2,
            'reset_positions': ['real']
            })

register(
    id = 'Real-monopod-balance-v2',
    entry_point = 'gym_os2r_real.runtimes.realtime_runtime:RealTimeRuntime',
    max_episode_steps = 100000,
    kwargs={'task_cls': tasks.monopod.MonopodTask,
        'agent_rate': 1000,
        'task_mode': 'fixed_hip_torque',
        'reward_class': BalancingV3,
        'reset_positions': ['real']
        })
