include(YCMEPHelper)
include(FindOrBuildPackage)

find_or_build_package(gym-os2r QUIET)

ycm_ep_helper(gym-os2r-real TYPE GIT
              STYLE GITHUB
              REPOSITORY OpenSim2Real/gym-os2r-real
              TAG main
              COMPONENT scenario
              FOLDER src
              DEPENDS gym-os2r
              CMAKE_ARGS -DPYTHON_INSTALL_PREFIX:PATH=${OPENSIM2REAL_SUPERBUILD_PYTHON_INSTALL_DIR}
                         -DBUILD_DOCS:BOOL=${OPENSIM2REAL_ENABLE_BUILDDOCS}
                         -DBUILD_DOCS_SUPERBUILD:BOOL=${OPENSIM2REAL_ENABLE_BUILDDOCS}
            )
