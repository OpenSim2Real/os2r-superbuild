include(YCMEPHelper)
include(FindOrBuildPackage)

find_or_build_package(gym-ignition QUIET)

ycm_ep_helper(SIM TYPE GIT
              STYLE GITHUB
              REPOSITORY Baesian-Balancer/SIM
              TAG master
              COMPONENT scenario
              FOLDER src
              CMAKE_ARGS -DSCENARIO_ENABLE_BINDINGS:BOOL=${BAESIANBALANCER_USES_PYTHON}
                         -DBINDINGS_INSTALL_PREFIX:PATH=${BAESIANBALANCER_SUPERBUILD_PYTHON_INSTALL_DIR}
              DEPENDS gym-ignition)
