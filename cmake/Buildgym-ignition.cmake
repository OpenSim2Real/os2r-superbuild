# Copyright (C) 2021 iCub Facility, Istituto Italiano di Tecnologia
# Authors: Diego Ferigo <diego.ferigo@iit.it>
# CopyPolicy: Released under the terms of the LGPLv2.1 or later, see LGPL.TXT

include(YCMEPHelper)
include(FindOrBuildPackage)

find_package(Python3 COMPONENTS Interpreter Development REQUIRED)
execute_process(
    COMMAND "${Python3_EXECUTABLE}" -c "import scenario; print(scenario.__path__[0])"
    OUTPUT_VARIABLE Scenario_OUT_PATH
    OUTPUT_STRIP_TRAILING_WHITESPACE
)
message(STATUS "found scenario root path: ${Scenario_OUT_PATH}")

if (NOT "${Scenario_OUT_PATH}" STREQUAL "")
  message(FATAL_ERROR
  "
  unexpected: Found scenario python package already installed. Please uninstall and try again.
  ")
endif()
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
