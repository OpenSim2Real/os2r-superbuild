include(YCMEPHelper)
include(FindOrBuildPackage)

find_or_build_package(gym-ignition QUIET)

ycm_ep_helper(gym-os2r TYPE GIT
              STYLE GITHUB
              REPOSITORY OpenSim2Real/gym-os2r
              TAG main
              COMPONENT gym_os2r
              FOLDER src
              DEPENDS gym-ignition gym-ignition_move
              CMAKE_ARGS -DPYTHON_INSTALL_PREFIX:PATH=${OPENSIM2REAL_SUPERBUILD_PYTHON_INSTALL_DIR}
                         -DBUILD_DOCS:BOOL=${OPENSIM2REAL_ENABLE_BUILDDOCS}
                         -DBUILD_DOCS_SUPERBUILD:BOOL=${OPENSIM2REAL_ENABLE_BUILDDOCS}
            )
