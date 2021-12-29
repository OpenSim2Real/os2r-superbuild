# Copyright (C) 2021 iCub Facility, Istituto Italiano di Tecnologia
# Authors: Diego Ferigo <diego.ferigo@iit.it>
# CopyPolicy: Released under the terms of the LGPLv2.1 or later, see LGPL.TXT

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
                         -DSCENARIO_ENABLE_BINDINGS:BOOL=${BAESIANBALANCER_USES_PYTHON}
                         -DBINDINGS_INSTALL_PREFIX:PATH=${BAESIANBALANCER_SUPERBUILD_PYTHON_INSTALL_DIR}
              DEPENDS iDynTree)

if(BAESIANBALANCER_USES_PYTHON)
  # Status message

  # Install the egg-info files
  set(EGG_BASE_PATH_SCENARIO "${YCM_EP_INSTALL_DIR}/${BAESIANBALANCER_SUPERBUILD_PYTHON_INSTALL_DIR_SETUP_SH}")
  message(STATUS "Using \'${Python3_EXECUTABLE} setup.py egg_info --egg-base=${EGG_BASE_PATH_SCENARIO}\' To create each egg info for python modules sceanrio and gym-ignition.")
  add_custom_command(TARGET gym-ignition POST_BUILD
      COMMAND ${Python3_EXECUTABLE} setup.py egg_info --egg-base=${EGG_BASE_PATH_SCENARIO}
      WORKING_DIRECTORY ${PROJECT_SOURCE_DIR}/src/gym-ignition/scenario
      COMMENT "Installing egg files for scenario..."
  )


  # add_custom_command(TARGET gym-ignition POST_BUILD
  #                   COMMAND ${CMAKE_COMMAND} -E copy_directory
  #                   ${PROJECT_SOURCE_DIR}/src/gym-ignition/python/gym_ignition ${EGG_BASE_PATH_SCENARIO}/gym_ignition
  #                   COMMENT "Moving gym-ignition into build python directory ${EGG_BASE_PATH_SCENARIO}...")
  # add_custom_command(TARGET gym-ignition POST_BUILD
  #   COMMAND ${Python3_EXECUTABLE} setup.py egg_info --egg-base=${EGG_BASE_PATH_SCENARIO}
  #   # COMMAND ${Python3_EXECUTABLE} -m pip install -e .
  #   WORKING_DIRECTORY ${PROJECT_SOURCE_DIR}/src/gym-ignition
  #   COMMENT "Installing egg files for gym-ignition..."
  # )

  set(gym_ignition_install_dir ${EGG_BASE_PATH_SCENARIO}/gym_ignition)
  add_custom_command(TARGET gym-ignition POST_BUILD
    COMMAND ${CMAKE_COMMAND} -E copy_directory ${PROJECT_SOURCE_DIR}/src/gym-ignition ${gym_ignition_install_dir}
    COMMENT "Moving gym-ignition into build python directory ${gym_ignition_install_dir}...")

  add_custom_command(TARGET gym-ignition POST_BUILD
    VERBATIM COMMAND ${Python3_EXECUTABLE} -c "import setuptools;import site;import sys;site.ENABLE_USER_SITE = 1;sys.argv[1:]=[\"develop\",\"--user\"];setuptools.setup()"
    WORKING_DIRECTORY ${gym_ignition_install_dir}
    COMMENT "Installing egg files link for gym-ignition..."
  )

endif()
