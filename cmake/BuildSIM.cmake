include(YCMEPHelper)
include(FindOrBuildPackage)

find_or_build_package(gym-ignition QUIET)

ycm_ep_helper(SIM TYPE GIT
              STYLE GITHUB
              REPOSITORY Baesian-Balancer/SIM
              TAG master
              COMPONENT scenario
              FOLDER src
              CMAKE_ARGS -DSCENARIO_ENABLE_BINDINGS:BOOL=${BAESIANBALANCER_USES_PYTHON}
                         -DBINDINGS_INSTALL_PREFIX:PATH=${BAESIANBALANCER_SUPERBUILD_PYTHON_INSTALL_DIR}
              DEPENDS gym-ignition)


# Status message
message(STATUS "Using \'${Python3_EXECUTABLE} setup.py egg_info --egg-base=${EGG_BASE_PATH}\' To create each egg info for python modules.")

# Install the egg-info files
set(EGG_BASE_PATH_SCENARIO "${YCM_EP_INSTALL_DIR}/${BAESIANBALANCER_SUPERBUILD_PYTHON_INSTALL_DIR_SETUP_SH}")
add_custom_command(TARGET SIM POST_BUILD
    COMMAND ${Python3_EXECUTABLE} setup.py egg_info --egg-base=${EGG_BASE_PATH_SCENARIO}
    WORKING_DIRECTORY ${PROJECT_SOURCE_DIR}/src/gym-ignition/scenario
    COMMENT "Installing egg files for scenario..."
)

set(EGG_BASE_PATH_IDYNTREE "${YCM_EP_INSTALL_DIR}/${IDYNTREE_PYTHON_INSTALL_DIR_SETUP_SH}")
add_custom_command(TARGET SIM POST_BUILD
    COMMAND ${Python3_EXECUTABLE} setup.py egg_info --egg-base=${EGG_BASE_PATH_IDYNTREE}
    WORKING_DIRECTORY ${PROJECT_SOURCE_DIR}/src/iDynTree
    COMMENT "Installing egg files for idyntree..."
)
