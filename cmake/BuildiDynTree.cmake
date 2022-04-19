include(YCMEPHelper)
include(FindOrBuildPackage)

find_or_build_package(OsqpEigen QUIET)
# find_or_build_package(Eigen3 QUIET)

set(iDynTree_DEPENDS "")
list(APPEND iDynTree_DEPENDS OsqpEigen)

ycm_ep_helper(iDynTree TYPE GIT
              STYLE GITHUB
              REPOSITORY robotology/idyntree.git
              TAG master
              COMPONENT core
              FOLDER src
              CMAKE_ARGS -DIDYNTREE_USES_IPOPT:BOOL=ON
                         -DIDYNTREE_USES_OSQPEIGEN:BOOL=ON
                         -DIDYNTREE_USES_IRRLICHT:BOOL=ON
                         -DIDYNTREE_USES_ASSIMP:BOOL=ON
                         -DIDYNTREE_USES_MATLAB:BOOL=OFF
                         -DIDYNTREE_USES_PYTHON:BOOL=${OPENSIM2REAL_USES_PYTHON}
                         -DIDYNTREE_USES_OCTAVE:BOOL=OFF
                         -DIDYNTREE_COMPILES_YARP_TOOLS:BOOL=OFF
              DEPENDS ${iDynTree_DEPENDS})

IF(OPENSIM2REAL_USES_PYTHON)
  message(STATUS "Using \'${Python3_EXECUTABLE} setup.py egg_info --egg-base=${EGG_BASE_PATH_IDYNTREE}\' To create each egg info for idyntree python modules.")
  add_custom_command(TARGET iDynTree POST_BUILD
      COMMAND ${Python3_EXECUTABLE} setup.py egg_info --egg-base=${EGG_BASE_PATH_IDYNTREE}
      WORKING_DIRECTORY ${PROJECT_SOURCE_DIR}/src/iDynTree
      COMMENT "Installing egg files for idyntree..."
  )
ENDIF()
