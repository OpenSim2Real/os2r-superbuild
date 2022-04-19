cmake_minimum_required(VERSION 3.16)
project(os2r-superbuild NONE)

## we have to enable C because it is currently used
## by CMake to describe packages (in Config*.cmake files)
enable_language(C)

## FindACE requires CXX
enable_language(CXX)

# Disable in source build
if("${PROJECT_SOURCE_DIR}" STREQUAL "${PROJECT_BINARY_DIR}")
   message(FATAL_ERROR "In-source builds of os2r-superbuild are not allowed. "
                       "Please remove CMakeCache.txt and the CMakeFiles/ directory, then build out-of-source. "
                       "If you really want to do an in-source build, feel free to comment out this error.")
endif("${PROJECT_SOURCE_DIR}" STREQUAL "${PROJECT_BINARY_DIR}")

list(APPEND CMAKE_MODULE_PATH "${CMAKE_SOURCE_DIR}/cmake")
list(APPEND CMAKE_MODULE_PATH "${CMAKE_SOURCE_DIR}/cmake/cmake")

include(CTest)
include(FeatureSummary)

# Disable YCM-created install/INSTALL target (see https://github.com/robotology/robotology-superbuild/issues/356)
macro(install)
endmacro()

# Load options
include(OpenSim2RealSuperbuildOptions)

# Bootstrap YCM
set(YCM_FOLDER src)
set(YCM_COMPONENT core)
set(YCM_MINIMUM_VERSION 0.11.1)

include(YCMBootstrap)

include(FindOrBuildPackage)
include(YCMEPHelper)

# Include the logic of which packages should be built
# depending on which profiles are enabled
include(OpenSim2RealSuperbuildLogic)

if(WIN32 AND APPLE)
    message(FATAL_ERROR "Windows and mac OS are currently not supported for this project. \
    Please build using a linux based system.")
else()
    set(SHLIB_ENV_VAR "LD_LIBRARY_PATH")
endif()

set(PROJECT_SOURCE_DIR_SETUP_SH ${PROJECT_SOURCE_DIR})
set(YCM_EP_INSTALL_DIR_SETUP_SH ${YCM_EP_INSTALL_DIR})
set(SUB_PROJECTS_BUILD_DIR ${PROJECT_BINARY_DIR})

message(STATUS "PROJECT_SOURCE_DIR_SETUP_SH: ${PROJECT_SOURCE_DIR_SETUP_SH}")
message(STATUS "YCM_EP_INSTALL_DIR_SETUP_SH: ${YCM_EP_INSTALL_DIR_SETUP_SH}")
message(STATUS "SUB_PROJECTS_BUILD_DIR: ${SUB_PROJECTS_BUILD_DIR}")

include(ConfigureFileWithCMakeIf)
configure_file_with_cmakeif(${CMAKE_CURRENT_SOURCE_DIR}/cmake/template/setup.sh.in ${YCM_EP_INSTALL_DIR}/share/${PROJECT_NAME}/setup.sh @ONLY)

ycm_write_dot_file(${CMAKE_CURRENT_BINARY_DIR}/os2r-superbuild.dot)

set_package_properties(Git PROPERTIES TYPE RUNTIME)
set_package_properties(Subversion PROPERTIES TYPE RUNTIME)
set_package_properties(PkgConfig PROPERTIES TYPE RUNTIME)
set_package_properties(Doxygen PROPERTIES TYPE RUNTIME)

if(OPENSIM2REAL_ENABLE_BUILDDOCS)
    IF(NOT OPENSIM2REAL_ENABLE_ALL)
      message(FATAL_ERROR "Need to enable compilation of all components to build documentation.")
    ENDIF()
    add_subdirectory(docs)
endif()

feature_summary(WHAT ALL INCLUDE_QUIET_PACKAGES FATAL_ON_MISSING_REQUIRED_PACKAGES)
