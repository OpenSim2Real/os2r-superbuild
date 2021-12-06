
include(YCMEPHelper)
include(FindOrBuildPackage)

find_or_build_package(mpi_cmake_modules QUIET)
find_or_build_package(GTest QUIET)

ycm_ep_helper(real_time_tools TYPE GIT
              STYLE GITHUB
              REPOSITORY machines-in-motion/real_time_tools.git
              TAG master
              COMPONENT core
              FOLDER src
              CMAKE_ARGS -DBUILD_TESTING:BOOL=${BUILD_TESTING}
              DEPENDS mpi_cmake_modules
                      GTest)
