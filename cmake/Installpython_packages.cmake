# Scenario and gym packages
# Install the egg-info files


IF(OPENSIM2REAL_ENABLE_SCENARIO OR OPENSIM2REAL_ENABLE_SCENARIO_MONOPOD OR OPENSIM2REAL_ENABLE_ALL)

  # Idyntree and Scenario are required if scenario orscenario_monopod is installed.
  # iDynTree
  set(EGG_BASE_PATH_IDYNTREE "${YCM_EP_INSTALL_DIR}/${IDYNTREE_PYTHON_INSTALL_DIR_SETUP_SH}")
  message(STATUS "Using \'${Python3_EXECUTABLE} setup.py egg_info --egg-base=${EGG_BASE_PATH_IDYNTREE}\' To create each egg info for idyntree python modules.")
  add_custom_command(TARGET iDynTree POST_BUILD
      COMMAND ${Python3_EXECUTABLE} setup.py egg_info --egg-base=${EGG_BASE_PATH_IDYNTREE}
      WORKING_DIRECTORY ${PROJECT_SOURCE_DIR}/src/iDynTree
      COMMENT "Installing egg files for idyntree..."
  )

  # Scenario
  set(EGG_BASE_PATH_SCENARIO "${YCM_EP_INSTALL_DIR}/${OPENSIM2REAL_SUPERBUILD_PYTHON_INSTALL_DIR_SETUP_SH}")
  message(STATUS "Using \'${Python3_EXECUTABLE} setup.py egg_info --egg-base=${EGG_BASE_PATH_SCENARIO}\' To create each egg info for python modules sceanrio and gym-ignition.")
  add_custom_command(TARGET gym-ignition POST_BUILD
      COMMAND  ${CMAKE_COMMAND} -E env PYTHONPATH=${PYTHONPATHS} ${Python3_EXECUTABLE} setup.py egg_info --egg-base=${EGG_BASE_PATH_SCENARIO}
      WORKING_DIRECTORY ${PROJECT_SOURCE_DIR}/src/gym-ignition/scenario
      COMMENT "Installing egg files for scenario..."
  )

  # Nested to make easier to read.
  IF(OPENSIM2REAL_ENABLE_GYMIGNITION OR OPENSIM2REAL_ENABLE_ALL)
      # gym_ignition
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

      IF(OPENSIM2REAL_ENABLE_GYMOS2R OR OPENSIM2REAL_ENABLE_ALL)
          # Build gym-os2r if enabled for if simulation only is selected.
          find_or_build_package(gym-os2r)

          add_custom_command(TARGET gym-os2r POST_BUILD
            COMMAND ${CMAKE_COMMAND} -E env PYTHONPATH=${PYTHONPATHS} ${Python3_EXECUTABLE}
            setup.py egg_info --egg-base=${EGG_BASE_PATH_SCENARIO}
            WORKING_DIRECTORY ${PROJECT_SOURCE_DIR}/src/gym-os2r
            COMMENT "Installing egg files for gym-os2r..."
          )

          IF(OPENSIM2REAL_ENABLE_GYMOS2R_REAL OR OPENSIM2REAL_ENABLE_ALL)
              # Build gym-os2r if enabled for if simulation only is selected.
              find_or_build_package(gym-os2r-real)
              add_custom_command(TARGET gym-os2r-real POST_BUILD
                COMMAND ${CMAKE_COMMAND} -E env PYTHONPATH=${PYTHONPATHS} ${Python3_EXECUTABLE}
                setup.py egg_info --egg-base=${EGG_BASE_PATH_SCENARIO}
                WORKING_DIRECTORY ${PROJECT_SOURCE_DIR}/src/gym-os2r-real
                COMMENT "Installing egg files for gym-os2r-real..."
              )
          ENDIF()
      ENDIF()
  ENDIF()
ENDIF()
