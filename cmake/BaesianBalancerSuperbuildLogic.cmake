
# # Detect if robotology-superbuild is being configured under a conda environment
# if(DEFINED ENV{CONDA_PREFIX})
#   set(ROBOTOLOGY_CONFIGURING_UNDER_CONDA ON)
# else()
#   set(ROBOTOLOGY_CONFIGURING_UNDER_CONDA OFF)
# endif()

# Core
if(BAESIANBALANCER_ENABLE_CORE)
  find_or_build_package(cereal)
  find_or_build_package(pybind11)
  find_or_build_package(Eigen3)
  find_or_build_package(mpi_cmake_modules)
  find_or_build_package(real_time_tools)
  find_or_build_package(signal_handler)
  find_or_build_package(shared_memory)
  find_or_build_package(time_series)
  # find_or_build_package(monopod_sdk)
endif()

# Robot Testing
if(BAESIANBALANCER_ENABLE_SCENARIO)
  if(BAESIANBALANCER_USES_IGNITION)
    find_or_build_package(gym-ignition)
  endif()
  find_or_build_package(SIM)
endif()
