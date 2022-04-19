include(YCMEPHelper)
include(FindOrBuildPackage)

find_or_build_package(gym-os2r QUIET)
find_or_build_package(scenario_monopod QUIET)

ycm_ep_helper(gym-os2r-real TYPE GIT
              STYLE GITHUB
              REPOSITORY OpenSim2Real/gym-os2r-real
              TAG main
              COMPONENT real
              FOLDER src
              DEPENDS gym-os2r scenario_monopod
              CMAKE_ARGS -DPYTHON_INSTALL_PREFIX:PATH=${OPENSIM2REAL_SUPERBUILD_PYTHON_INSTALL_DIR}
                         -DBUILD_DOCS:BOOL=${OPENSIM2REAL_ENABLE_BUILDDOCS}
                         -DBUILD_DOCS_SUPERBUILD:BOOL=${OPENSIM2REAL_ENABLE_BUILDDOCS}
            )
IF(OPENSIM2REAL_USES_PYTHON)
  message(STATUS "Using \'${Python3_EXECUTABLE} setup.py egg_info --egg-base=${EGG_BASE_PATH_SCENARIO}\' To create each egg info for python modules gym-os2r-real.")
  add_custom_command(TARGET gym-os2r-real POST_BUILD
    COMMAND ${CMAKE_COMMAND} -E env PYTHONPATH=${PYTHONPATHS} ${Python3_EXECUTABLE}
    setup.py egg_info --egg-base=${EGG_BASE_PATH_SCENARIO}
    WORKING_DIRECTORY ${PROJECT_SOURCE_DIR}/src/gym-os2r-real
    COMMENT "Installing egg files for gym-os2r-real..."
  )
ENDIF()
