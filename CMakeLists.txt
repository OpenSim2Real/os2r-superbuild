cmake_minimum_required(VERSION 3.16)
project(bb-superbuild NONE)

## we have to enable C because it is currently used
## by CMake to describe packages (in Config*.cmake files)
enable_language(C)

## FindACE requires CXX
enable_language(CXX)

# Disable in source build
if("${PROJECT_SOURCE_DIR}" STREQUAL "${PROJECT_BINARY_DIR}")
   message(FATAL_ERROR "In-source builds of bb-superbuild are not allowed. "
                       "Please remove CMakeCache.txt and the CMakeFiles/ directory, then build out-of-source. "
                       "If you really want to do an in-source build, feel free to comment out this error.")
endif("${PROJECT_SOURCE_DIR}" STREQUAL "${PROJECT_BINARY_DIR}")

list(APPEND CMAKE_MODULE_PATH "${CMAKE_SOURCE_DIR}/cmake")

include(CTest)
include(FeatureSummary)

# Disable YCM-created install/INSTALL target (see https://github.com/robotology/robotology-superbuild/issues/356)
macro(install)
endmacro()

# Load options
include(BaesianBalancerSuperbuildOptions)

# Bootstrap YCM
set(YCM_FOLDER src)
set(YCM_COMPONENT core)
set(YCM_MINIMUM_VERSION 0.11.1)

include(YCMBootstrap)

include(FindOrBuildPackage)
include(YCMEPHelper)

# Python-related logic
if(BAESIANBALANCER_USES_PYTHON)
  # check for swig/pybind11 dependency for bindings
  find_package(SWIG 4.0 REQUIRED)
  find_package(pybind11 REQUIRED)
  # For iDynTree linking
  find_package(Python3 COMPONENTS Interpreter Development REQUIRED)
  execute_process(COMMAND ${Python3_EXECUTABLE} -c "from distutils import sysconfig; print(sysconfig.get_python_lib(1,0,prefix=''))"
     OUTPUT_VARIABLE _PYTHON_INSTDIR)
  string(STRIP ${_PYTHON_INSTDIR} IDYNTREE_PYTHON_INSTALL_DIR)
  file(TO_CMAKE_PATH "${IDYNTREE_PYTHON_INSTALL_DIR}" IDYNTREE_PYTHON_INSTALL_DIR)
  set(IDYNTREE_PYTHON_INSTALL_DIR_SETUP_SH ${IDYNTREE_PYTHON_INSTALL_DIR})
  message(STATUS "IDYNTREE_PYTHON_INSTALL_DIR_SETUP_SH: ${IDYNTREE_PYTHON_INSTALL_DIR_SETUP_SH}")

  # For other packages installation
  set(_python_code
    "from distutils.sysconfig import get_python_lib"
    "import os"
    "install_path = '${YCM_EP_INSTALL_DIR}'"
    "python_lib = get_python_lib(prefix=install_path)"
    "rel_path = os.path.relpath(python_lib, start=install_path)"
    "print(rel_path.replace(os.sep, '/'))")
  execute_process(
    COMMAND "${Python3_EXECUTABLE}" "-c" "${_python_code}"
    OUTPUT_VARIABLE _output
    RESULT_VARIABLE _result
    OUTPUT_STRIP_TRAILING_WHITESPACE)
  if(NOT _result EQUAL 0)
    message(
      FATAL_ERROR
        "execute_process(${Python_EXECUTABLE} -c '${_python_code}') returned "
        "error code ${_result}")
  endif()
  string(STRIP ${_output} BAESIANBALANCER_SUPERBUILD_PYTHON_INSTALL_DIR)
  file(TO_CMAKE_PATH "${BAESIANBALANCER_SUPERBUILD_PYTHON_INSTALL_DIR}" BAESIANBALANCER_SUPERBUILD_PYTHON_INSTALL_DIR)
  set(BAESIANBALANCER_SUPERBUILD_PYTHON_INSTALL_DIR_SETUP_SH ${BAESIANBALANCER_SUPERBUILD_PYTHON_INSTALL_DIR})
  message(STATUS "BAESIANBALANCER_SUPERBUILD_PYTHON_INSTALL_DIR_SETUP_SH: ${BAESIANBALANCER_SUPERBUILD_PYTHON_INSTALL_DIR_SETUP_SH}")

endif()


# Include the logic of which packages should be built
# depending on which profiles are enabled
include(BaesianBalancerSuperbuildLogic)

if(WIN32 AND APPLE)
    message(FATAL_ERROR "Windows and mac OS are currently not supported for this project. Please build using a linux based system.")
else()
    set(SHLIB_ENV_VAR "LD_LIBRARY_PATH")
endif()

set(PROJECT_SOURCE_DIR_SETUP_SH ${PROJECT_SOURCE_DIR})
set(YCM_EP_INSTALL_DIR_SETUP_SH ${YCM_EP_INSTALL_DIR})

message("PROJECT_SOURCE_DIR_SETUP_SH: ${PROJECT_SOURCE_DIR_SETUP_SH}")
message("YCM_EP_INSTALL_DIR_SETUP_SH: ${YCM_EP_INSTALL_DIR_SETUP_SH}")

include(ConfigureFileWithCMakeIf)
configure_file_with_cmakeif(${CMAKE_CURRENT_SOURCE_DIR}/cmake/template/setup.sh.in ${YCM_EP_INSTALL_DIR}/share/${PROJECT_NAME}/setup.sh @ONLY)

ycm_write_dot_file(${CMAKE_CURRENT_BINARY_DIR}/bb-superbuild.dot)

set_package_properties(Git PROPERTIES TYPE RUNTIME)
set_package_properties(Subversion PROPERTIES TYPE RUNTIME)
set_package_properties(PkgConfig PROPERTIES TYPE RUNTIME)
set_package_properties(Doxygen PROPERTIES TYPE RUNTIME)

feature_summary(WHAT ALL INCLUDE_QUIET_PACKAGES FATAL_ON_MISSING_REQUIRED_PACKAGES)
