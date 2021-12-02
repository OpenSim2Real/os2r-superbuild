include(YCMEPHelper)
include(FindOrBuildPackage)

find_or_build_package(real_time_tools QUIET)

ycm_ep_helper(monopod_sdk TYPE GIT
              STYLE GITHUB
              REPOSITORY Baesian-Balancer/monopod_sdk
              TAG dawson/dev
              COMPONENT monopod_sdk
              FOLDER src
              DEPENDS real_time_tools)
