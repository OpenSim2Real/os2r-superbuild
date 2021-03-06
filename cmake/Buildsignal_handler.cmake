
include(YCMEPHelper)
include(FindOrBuildPackage)

find_or_build_package(pybind11 QUIET)
find_or_build_package(mpi_cmake_modules QUIET)

ycm_ep_helper(signal_handler TYPE GIT
              STYLE GITHUB
              REPOSITORY MPI-IS/signal_handler.git
              TAG master
              COMPONENT core
              FOLDER src
              DEPENDS mpi_cmake_modules)
