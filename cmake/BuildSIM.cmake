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


set(EASY_INSTALL_PATH
    "${YCM_EP_INSTALL_DIR}/${BAESIANBALANCER_SUPERBUILD_PYTHON_INSTALL_DIR_SETUP_SH}")
message(STATUS "${Python3_EXECUTABLE} setup.py egg_info --egg-base=${EASY_INSTALL_PATH}")

add_custom_command(TARGET SIM POST_BUILD
    COMMAND ${Python3_EXECUTABLE} setup.py egg_info --egg-base=${EASY_INSTALL_PATH}
    WORKING_DIRECTORY ${PROJECT_SOURCE_DIR}/src/gym-ignition/scenario
    COMMENT "Installing egg files for scenario..."
)

add_custom_command(TARGET SIM POST_BUILD
    COMMAND ${Python3_EXECUTABLE} setup.py egg_info --egg-base=${EASY_INSTALL_PATH}
    WORKING_DIRECTORY ${PROJECT_SOURCE_DIR}/src/iDynTree
    COMMENT "Installing egg files for idyntree..."
)
