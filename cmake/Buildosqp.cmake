
include(YCMEPHelper)

ycm_ep_helper(osqp TYPE GIT
              STYLE GITHUB
              REPOSITORY oxfordcontrol/osqp.git
              TAG master
              COMPONENT external
              FOLDER src
              CMAKE_ARGS -DUNITTESTS:BOOL=OFF)
