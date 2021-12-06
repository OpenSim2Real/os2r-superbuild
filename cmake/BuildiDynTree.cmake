include(YCMEPHelper)
include(FindOrBuildPackage)

find_or_build_package(OsqpEigen QUIET)
# find_or_build_package(Eigen3 QUIET)

set(iDynTree_DEPENDS "")
list(APPEND iDynTree_DEPENDS OsqpEigen Eigen3)

ycm_ep_helper(iDynTree TYPE GIT
              STYLE GITHUB
              REPOSITORY robotology/idyntree.git
              TAG master
              COMPONENT dynamics
              FOLDER src
              CMAKE_ARGS -DIDYNTREE_USES_IPOPT:BOOL=ON
                         -DIDYNTREE_USES_OSQPEIGEN:BOOL=ON
                         -DIDYNTREE_USES_IRRLICHT:BOOL=ON
                         -DIDYNTREE_USES_ASSIMP:BOOL=ON
                         -DIDYNTREE_USES_MATLAB:BOOL=OFF
                         -DIDYNTREE_USES_PYTHON:BOOL=${BAESIANBALANCER_USES_PYTHON}
                         -DIDYNTREE_USES_OCTAVE:BOOL=OFF
                         -DIDYNTREE_COMPILES_YARP_TOOLS:BOOL=OFF
              DEPENDS ${iDynTree_DEPENDS})
