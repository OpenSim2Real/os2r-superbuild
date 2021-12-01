include(YCMEPHelper)
include(FindOrBuildPackage)

ycm_ep_helper(mpi_cmake_modules TYPE GIT
              STYLE GITHUB
              REPOSITORY machines-in-motion/mpi_cmake_modules.git
              TAG master
              COMPONENT core
              FOLDER src
              CMAKE_ARGS -DBUILD_TESTING=OFF)
