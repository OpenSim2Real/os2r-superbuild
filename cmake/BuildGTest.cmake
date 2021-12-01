
include(YCMEPHelper)
include(FindOrBuildPackage)

ycm_ep_helper(GTest TYPE GIT
              STYLE GITHUB
              REPOSITORY google/googletest
              TAG master
              COMPONENT core
              FOLDER src
              # CMAKE_ARGS -DPYBIND11_TEST=OFF
              )
