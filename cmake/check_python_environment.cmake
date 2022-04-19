
# Need Swig for bindings
find_package(Python3 COMPONENTS Interpreter Development REQUIRED)
find_package(SWIG 4.0 QUIET)

execute_process(COMMAND ${Python3_EXECUTABLE} -c "from distutils import sysconfig; \
   print(sysconfig.get_python_lib(1,0,prefix=''))"
   OUTPUT_VARIABLE _PYTHON_INSTDIR
 )
string(STRIP ${_PYTHON_INSTDIR} IDYNTREE_PYTHON_INSTALL_DIR)
file(TO_CMAKE_PATH "${IDYNTREE_PYTHON_INSTALL_DIR}" IDYNTREE_PYTHON_INSTALL_DIR)
set(IDYNTREE_PYTHON_INSTALL_DIR_SETUP_SH ${IDYNTREE_PYTHON_INSTALL_DIR})
message(STATUS "IDYNTREE_PYTHON_INSTALL_DIR_SETUP_SH: ${IDYNTREE_PYTHON_INSTALL_DIR_SETUP_SH}")

# This is a helper variable to be able to set pythpath for the executed processes.
set(PYTHONPATHS "${YCM_EP_INSTALL_DIR}/${OPENSIM2REAL_SUPERBUILD_PYTHON_INSTALL_DIR_SETUP_SH}:\
${YCM_EP_INSTALL_DIR}/${IDYNTREE_PYTHON_INSTALL_DIR_SETUP_SH}")

# If scenario is enabled. make sure gym ignition and scenario are uninstalled
# Make sure idyntree is uninstalled before running
execute_process(
    COMMAND ${CMAKE_COMMAND} -E env PYTHONPATH=${PYTHONPATHS} "${Python3_EXECUTABLE}" -c "import sys; \
    import os; import importlib.util; PYPATHS = [] if 'PYTHONPATH' not in os.environ else os.environ['PYTHONPATH'].split(':'); \
    sys.path = [p for p in sys.path if p not in [os.path.abspath(x) for x in PYPATHS]]; \
    print(importlib.util.find_spec('idyntree'))"
    OUTPUT_VARIABLE idyntree_OUT_PATH
    OUTPUT_STRIP_TRAILING_WHITESPACE
    ERROR_QUIET
)
# Make sure Scenario is uninstalled before Runinng
execute_process(
    COMMAND ${CMAKE_COMMAND} -E env PYTHONPATH=${PYTHONPATHS} "${Python3_EXECUTABLE}" -c "import sys; \
    import os; import importlib.util; PYPATHS = [] if 'PYTHONPATH' not in os.environ else os.environ['PYTHONPATH'].split(':'); \
    sys.path = [p for p in sys.path if p not in [os.path.abspath(x) for x in PYPATHS]]; \
    print(importlib.util.find_spec('scenario'))"
    OUTPUT_VARIABLE Scenario_OUT_PATH
    OUTPUT_STRIP_TRAILING_WHITESPACE
    ERROR_QUIET
)
# Make sure gym-ignition and scenario is uninstalled before running
execute_process(
    COMMAND ${CMAKE_COMMAND} -E env PYTHONPATH=${PYTHONPATHS} "${Python3_EXECUTABLE}" -c "import sys; \
    import os; import importlib.util; PYPATHS = [] if 'PYTHONPATH' not in os.environ else os.environ['PYTHONPATH'].split(':'); \
    sys.path = [p for p in sys.path if p not in [os.path.abspath(x) for x in PYPATHS]]; \
    print(importlib.util.find_spec('gym_ignition'))"
    OUTPUT_VARIABLE gym_ignition_OUT_PATH
    OUTPUT_STRIP_TRAILING_WHITESPACE
    ERROR_QUIET
)
if (NOT "${gym_ignition_OUT_PATH}" STREQUAL "None" )
  message(FATAL_ERROR
  "
  unexpected: Found gym-ignition python package already installed at ${gym_ignition_OUT_PATH} \
  despite having Scenario enabled. Please uninstall and try again.
  ")
endif()
if (NOT "${Scenario_OUT_PATH}" STREQUAL "None" )
  message(FATAL_ERROR
  "
  unexpected: Found scenario python package already installed at ${Scenario_OUT_PATH} \
  despite having Scenario enabled. Please uninstall and try again.
  ")
endif()
if (NOT "${idyntree_OUT_PATH}" STREQUAL "None" )
  message(FATAL_ERROR
  "
  unexpected: Found idyntree python package already installed at ${idyntree_OUT_PATH} \
  despite having Scenario enabled. Please uninstall and try again.
  ")
endif()
