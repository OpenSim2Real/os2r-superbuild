
include(YCMEPHelper)
include(FindOrBuildPackage)


find_or_build_package(Eigen3 QUIET)
find_or_build_package(mpi_cmake_modules QUIET)
find_or_build_package(signal_handler QUIET)
find_or_build_package(shared_memory QUIET)
find_or_build_package(real_time_tools QUIET)

ycm_ep_helper(time_series TYPE GIT
              STYLE GITHUB
              REPOSITORY machines-in-motion/time_series.git
              TAG master
              COMPONENT core
              FOLDER src
              # CMAKE_ARGS -DBUILD_TESTING=OFF
              DEPENDS shared_memory
                      Eigen3
                      mpi_cmake_modules
                      signal_handler
                      real_time_tools)
