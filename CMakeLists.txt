cmake_minimum_required(VERSION 3.16)
project(bb_superbuild NONE)

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

# Python-related logic
if(BAESIANBALANCER_USES_PYTHON)
  find_package(Python3 COMPONENTS Interpreter Development REQUIRED)
  execute_process(COMMAND ${Python3_EXECUTABLE} -c "from distutils import sysconfig; print(sysconfig.get_python_lib(1,0,prefix=''))"
     OUTPUT_VARIABLE _PYTHON_INSTDIR)
  string(STRIP ${_PYTHON_INSTDIR} BAESIANBALANCER_SUPERBUILD_PYTHON_INSTALL_DIR)
  file(TO_CMAKE_PATH "${BAESIANBALANCER_SUPERBUILD_PYTHON_INSTALL_DIR}" BAESIANBALANCER_SUPERBUILD_PYTHON_INSTALL_DIR)
endif()

# Bootstrap YCM
set(YCM_FOLDER src)
set(YCM_COMPONENT core)
set(YCM_MINIMUM_VERSION 0.11.1)


include(YCMBootstrap)

include(FindOrBuildPackage)
include(YCMEPHelper)

# Include the logic of which packages should be built
# depending on which profiles are enabled
include(BaesianBalancerSuperbuildLogic)


if(WIN32)
    set(SHLIB_ENV_VAR "PATH")
elseif(APPLE)
    set(SHLIB_ENV_VAR "DYLD_LIBRARY_PATH")
else()
    set(SHLIB_ENV_VAR "LD_LIBRARY_PATH")
endif()

if(WIN32)
  # On Git Bash on Windows, C: is rendered as /c
  string(REGEX MATCH "^([A-Z])" PROJECT_SOURCE_DIR_DRIVE ${PROJECT_SOURCE_DIR})
  string(TOLOWER ${PROJECT_SOURCE_DIR_DRIVE} PROJECT_SOURCE_DIR_DRIVE_LOWER)
  string(REGEX REPLACE "^([A-Z]:)" "/${PROJECT_SOURCE_DIR_DRIVE_LOWER}" PROJECT_SOURCE_DIR_SETUP_SH ${PROJECT_SOURCE_DIR})
  string(REGEX MATCH "^([A-Z])" YCM_EP_INSTALL_DIR_DRIVE ${YCM_EP_INSTALL_DIR})
  string(TOLOWER ${YCM_EP_INSTALL_DIR_DRIVE} YCM_EP_INSTALL_DIR_DRIVE_LOWER)
  string(REGEX REPLACE "^([A-Z]:)" "/${YCM_EP_INSTALL_DIR_DRIVE_LOWER}" YCM_EP_INSTALL_DIR_SETUP_SH ${YCM_EP_INSTALL_DIR})
  if(BAESIANBALANCER_USES_PYTHON)
    string(REPLACE "\\" "/" BAESIANBALANCER_SUPERBUILD_PYTHON_INSTALL_DIR_SETUP_SH ${BAESIANBALANCER_SUPERBUILD_PYTHON_INSTALL_DIR})
  endif()
else()
  set(PROJECT_SOURCE_DIR_SETUP_SH ${PROJECT_SOURCE_DIR})
  set(YCM_EP_INSTALL_DIR_SETUP_SH ${YCM_EP_INSTALL_DIR})
  if(BAESIANBALANCER_USES_PYTHON)
    set(BAESIANBALANCER_SUPERBUILD_PYTHON_INSTALL_DIR_SETUP_SH ${BAESIANBALANCER_SUPERBUILD_PYTHON_INSTALL_DIR})
  endif()
endif()
message(STATUS "BAESIANBALANCER_SUPERBUILD_PYTHON_INSTALL_DIR_SETUP_SH: ${BAESIANBALANCER_SUPERBUILD_PYTHON_INSTALL_DIR_SETUP_SH}")
#

include(ConfigureFileWithCMakeIf)
configure_file_with_cmakeif(${CMAKE_CURRENT_SOURCE_DIR}/cmake/template/setup.sh.in ${YCM_EP_INSTALL_DIR}/share/${PROJECT_NAME}/setup.sh @ONLY)

# if(WIN32)
#   file(TO_NATIVE_PATH ${PROJECT_SOURCE_DIR} PROJECT_SOURCE_DIR_NATIVE_PATH)
#   file(TO_NATIVE_PATH ${YCM_EP_INSTALL_DIR} YCM_EP_INSTALL_DIR_NATIVE_PATH)
#   configure_file_with_cmakeif(${CMAKE_CURRENT_SOURCE_DIR}/cmake/template/setup.bat.in ${YCM_EP_INSTALL_DIR}/share/${PROJECT_NAME}/setup.bat @ONLY)
#   configure_file_with_cmakeif(${CMAKE_CURRENT_SOURCE_DIR}/cmake/template/addPathsToUserEnvVariables.ps1.in
#                               ${YCM_EP_INSTALL_DIR}/share/${PROJECT_NAME}/addPathsToUserEnvVariables.ps1 @ONLY)
#   configure_file_with_cmakeif(${CMAKE_CURRENT_SOURCE_DIR}/cmake/template/removePathsFromUserEnvVariables.ps1.in
#                               ${YCM_EP_INSTALL_DIR}/share/${PROJECT_NAME}/removePathsFromUserEnvVariables.ps1 @ONLY)
# endif()

ycm_write_dot_file(${CMAKE_CURRENT_BINARY_DIR}/bb-superbuild.dot)

set_package_properties(Git PROPERTIES TYPE RUNTIME)
set_package_properties(Subversion PROPERTIES TYPE RUNTIME)
set_package_properties(PkgConfig PROPERTIES TYPE RUNTIME)
set_package_properties(Doxygen PROPERTIES TYPE RUNTIME)

feature_summary(WHAT ALL INCLUDE_QUIET_PACKAGES FATAL_ON_MISSING_REQUIRED_PACKAGES)
