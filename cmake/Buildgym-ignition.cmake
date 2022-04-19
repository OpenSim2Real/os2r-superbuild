include(YCMEPHelper)
include(FindOrBuildPackage)

find_or_build_package(iDynTree QUIET)

ycm_ep_helper(gym-ignition TYPE GIT
              STYLE GITHUB
              REPOSITORY robotology/gym-ignition.git
              TAG master
              COMPONENT scenario
              FOLDER src
              CMAKE_ARGS -DSCENARIO_USE_IGNITION:BOOL=ON
                         -DSCENARIO_ENABLE_BINDINGS:BOOL=${OPENSIM2REAL_USES_PYTHON}
                         -DBINDINGS_INSTALL_PREFIX:PATH=${OPENSIM2REAL_SUPERBUILD_PYTHON_INSTALL_DIR}
                         -DSCENARIO_USE_IGNITION:BOOL=${OPENSIM2REAL_ENABLE_SIMULATION}
              DEPENDS iDynTree)
