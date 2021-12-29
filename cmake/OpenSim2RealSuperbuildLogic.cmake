
# # Detect if robotology-superbuild is being configured under a conda environment
# if(DEFINED ENV{CONDA_PREFIX})
#   set(ROBOTOLOGY_CONFIGURING_UNDER_CONDA ON)
# else()
#   set(ROBOTOLOGY_CONFIGURING_UNDER_CONDA OFF)
# endif()

# Core
if(OPENSIM2REAL_ENABLE_CORE)
  find_or_build_package(mpi_cmake_modules)
  find_or_build_package(real_time_tools)
  find_or_build_package(signal_handler)
  find_or_build_package(shared_memory)
  find_or_build_package(time_series)
endif()

if(OPENSIM2REAL_ENABLE_MONOPODSDK)
  find_or_build_package(monopod_sdk)
endif()

# Robot scenario packages
if(OPENSIM2REAL_ENABLE_SCENARIO)
  find_or_build_package(iDynTree)
  find_or_build_package(gym-ignition)
  # find_or_build_package(scenario_monopod)
endif()
