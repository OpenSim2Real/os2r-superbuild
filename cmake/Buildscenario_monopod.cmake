include(YCMEPHelper)
include(FindOrBuildPackage)

find_or_build_package(gym-ignition QUIET)
find_or_build_package(monopod_sdk QUIET)

ycm_ep_helper(scenario_monopod TYPE GIT
              STYLE GITHUB
              REPOSITORY OpenSim2Real/scenario_monopod
              TAG master
              COMPONENT scenario
              FOLDER src
              CMAKE_ARGS -DSCENARIO_ENABLE_BINDINGS:BOOL=${OPENSIM2REAL_USES_PYTHON}
                         -DBINDINGS_INSTALL_PREFIX:PATH=${OPENSIM2REAL_SUPERBUILD_PYTHON_INSTALL_DIR}
                         -DBUILD_DOCS:BOOL=${OPENSIM2REAL_ENABLE_BUILDDOCS}
                         -DBUILD_DOCS_SUPERBUILD:BOOL=${OPENSIM2REAL_ENABLE_BUILDDOCS}
              DEPENDS gym-ignition monopod_sdk)
