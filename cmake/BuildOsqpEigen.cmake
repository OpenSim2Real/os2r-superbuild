include(YCMEPHelper)
include(FindOrBuildPackage)

find_or_build_package(osqp QUIET)

ycm_ep_helper(OsqpEigen TYPE GIT
              STYLE GITHUB
              REPOSITORY robotology/osqp-eigen.git
              TAG master
              COMPONENT core
              FOLDER src
              CMAKE_ARGS -DBUILD_TESTING:BOOL=OFF
              DEPENDS osqp)
