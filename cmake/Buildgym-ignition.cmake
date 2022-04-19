include(YCMEPHelper)
include(FindOrBuildPackage)

find_or_build_package(iDynTree QUIET)

ycm_ep_helper(gym-ignition TYPE GIT
              STYLE GITHUB
              REPOSITORY robotology/gym-ignition.git
              TAG master
              COMPONENT scenario
              FOLDER src
              CMAKE_ARGS -DSCENARIO_USE_IGNITION:BOOL=ON
                         -DSCENARIO_ENABLE_BINDINGS:BOOL=${OPENSIM2REAL_USES_PYTHON}
                         -DBINDINGS_INSTALL_PREFIX:PATH=${OPENSIM2REAL_SUPERBUILD_PYTHON_INSTALL_DIR}
                         -DSCENARIO_USE_IGNITION:BOOL=${OPENSIM2REAL_ENABLE_SIMULATION}
              DEPENDS iDynTree)


# THis handles the egg file installation for pip to be able to recognize the packages. Additionally it controls if gym-ignition part is installed
IF(OPENSIM2REAL_USES_PYTHON)
  message(STATUS "Using \'${Python3_EXECUTABLE} setup.py egg_info --egg-base=${EGG_BASE_PATH_SCENARIO}\' To create each egg info for python modules sceanrio.")
  add_custom_command(TARGET gym-ignition POST_BUILD
      COMMAND  ${CMAKE_COMMAND} -E env PYTHONPATH=${PYTHONPATHS} ${Python3_EXECUTABLE} setup.py egg_info --egg-base=${EGG_BASE_PATH_SCENARIO}
      WORKING_DIRECTORY ${PROJECT_SOURCE_DIR}/src/gym-ignition/scenario
      COMMENT "Installing egg files for scenario..."
  )
  IF(INSTALL_GYMIGNITION)
      add_custom_target(gym-ignition_move ALL DEPENDS gym-ignition
        COMMAND ${CMAKE_COMMAND} -E copy_directory
        ${PROJECT_SOURCE_DIR}/src/gym-ignition/python/gym_ignition ${EGG_BASE_PATH_SCENARIO}/gym_ignition
        COMMENT "Moving gym-ignition into build python directory ${EGG_BASE_PATH_SCENARIO}..."
      )
      add_custom_command(TARGET gym-ignition POST_BUILD
        COMMAND ${CMAKE_COMMAND} -E env PYTHONPATH=${PYTHONPATHS} ${Python3_EXECUTABLE}
        setup.py egg_info --egg-base=${EGG_BASE_PATH_SCENARIO}
        WORKING_DIRECTORY ${PROJECT_SOURCE_DIR}/src/gym-ignition
        COMMENT "Installing egg files for gym-ignition..."
      )
  ENDIF()
ENDIF()
