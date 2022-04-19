include(YCMEPHelper)
include(FindOrBuildPackage)

find_or_build_package(gym-ignition QUIET)

ycm_ep_helper(gym-os2r TYPE GIT
              STYLE GITHUB
              REPOSITORY OpenSim2Real/gym-os2r
              TAG main
              COMPONENT scenario
              FOLDER src
              DEPENDS gym-ignition
              CMAKE_ARGS -DPYTHON_INSTALL_PREFIX:PATH=${OPENSIM2REAL_SUPERBUILD_PYTHON_INSTALL_DIR}
                         -DBUILD_DOCS:BOOL=${OPENSIM2REAL_ENABLE_BUILDDOCS}
                         -DBUILD_DOCS_SUPERBUILD:BOOL=${OPENSIM2REAL_ENABLE_BUILDDOCS}
            )

IF(OPENSIM2REAL_USES_PYTHON)
  message(STATUS "Using \'${Python3_EXECUTABLE} setup.py egg_info --egg-base=${EGG_BASE_PATH_SCENARIO}\' To create each egg info for python modules gym-os2r.")
  add_custom_command(TARGET gym-os2r POST_BUILD
    COMMAND ${CMAKE_COMMAND} -E env PYTHONPATH=${PYTHONPATHS} ${Python3_EXECUTABLE}
    setup.py egg_info --egg-base=${EGG_BASE_PATH_SCENARIO}
    WORKING_DIRECTORY ${PROJECT_SOURCE_DIR}/src/gym-os2r
    COMMENT "Installing egg files for gym-os2r..."
  )
ENDIF()
