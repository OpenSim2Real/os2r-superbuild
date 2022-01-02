
include(YCMEPHelper)
include(FindOrBuildPackage)

find_or_build_package(real_time_tools QUIET)

ycm_ep_helper(monopod_sdk TYPE GIT
              STYLE GITHUB
              REPOSITORY OpenSim2Real/monopod_sdk
              TAG main
              COMPONENT monopod_sdk
              FOLDER src
              CMAKE_ARGS -DBUILD_DOCS:BOOL=${OPENSIM2REAL_ENABLE_DOC_COMPILATION}
              DEPENDS real_time_tools)
