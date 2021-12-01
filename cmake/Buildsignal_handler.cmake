
include(YCMEPHelper)
include(FindOrBuildPackage)

find_or_build_package(pybind11 QUIET)
find_or_build_package(mpi_cmake_modules QUIET)
find_or_build_package(GTest QUIET)

ycm_ep_helper(signal_handler TYPE GIT
              STYLE GITHUB
              REPOSITORY MPI-IS/signal_handler.git
              TAG master
              COMPONENT core
              FOLDER src
              # CMAKE_ARGS -DBUILD_TESTING=OFF
              DEPENDS pybind11
                      mpi_cmake_modules
                      GTest)
