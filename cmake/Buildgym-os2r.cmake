include(YCMEPHelper)
include(FindOrBuildPackage)

find_or_build_package(gym-ignition QUIET)

ycm_ep_helper(gym-os2r TYPE GIT
              STYLE GITHUB
              REPOSITORY OpenSim2Real/gym-os2r
              TAG dawson/dev
              COMPONENT gym_os2r
              FOLDER src
              DEPENDS gym-ignition
              CMAKE_ARGS -DPYTHON_INSTALL_PREFIX:PATH=${OPENSIM2REAL_SUPERBUILD_PYTHON_INSTALL_DIR}
            )
