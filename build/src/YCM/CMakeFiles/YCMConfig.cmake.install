# SPDX-FileCopyrightText: 2012-2021 Istituto Italiano di Tecnologia (IIT)
# SPDX-License-Identifier: BSD-3-Clause


set(YCM_VERSION 0.13.20210831.3-20210831.3+git1860bad)
set(YCM_VERSION_MAJOR 0)
set(YCM_VERSION_MINOR 13)
set(YCM_VERSION_PATCH 20210831.3)
set(YCM_VERSION_REVISION 13)
set(YCM_VERSION_DATE 2021-08-31)
set(YCM_VERSION_DATE_REVISION 3)
set(YCM_VERSION_API 0.13)
set(YCM_VERSION_SHORT 0.13.20210831.3)
set(YCM_VERSION_SOURCE 20210831.3+git1860bad)
set(YCM_VERSION_DIRTY )


####### Expanded from @PACKAGE_INIT@ by configure_package_config_file() #######
####### Any changes to this file will be overwritten by the next CMake run ####
####### The input file was YCMConfig.cmake.in                            ########

get_filename_component(PACKAGE_PREFIX_DIR "${CMAKE_CURRENT_LIST_DIR}/../../../" ABSOLUTE)

macro(set_and_check _var _file)
  set(${_var} "${_file}")
  if(NOT EXISTS "${_file}")
    message(FATAL_ERROR "File or directory ${_file} referenced by variable ${_var} does not exist !")
  endif()
endmacro()

####################################################################################

set_and_check(YCM_MODULE_DIR "${PACKAGE_PREFIX_DIR}/share/YCM")

unset(YCM_MODULE_PATH)
list(APPEND YCM_MODULE_PATH "${YCM_MODULE_DIR}/modules")
list(APPEND YCM_MODULE_PATH "${YCM_MODULE_DIR}/find-modules")
list(APPEND YCM_MODULE_PATH "${YCM_MODULE_DIR}/build-modules")
list(APPEND YCM_MODULE_PATH "${YCM_MODULE_DIR}/style-modules")

# "Newer modules should be found earlier in case of files with the same name,
# therefore the order is
#  - proposed
#  - next
#  - old releases (newer releases first)
#  - 3rd party
#  - deprecated

# Use modules from CMake (default ON)
if(NOT DEFINED YCM_USE_CMAKE OR YCM_USE_CMAKE)

  # Use modules including unmerged CMake patches (default OFF)
  if(YCM_USE_CMAKE_PROPOSED)
    list(APPEND YCM_MODULE_PATH "${YCM_MODULE_DIR}/cmake-proposed/Modules")
  endif()

  # Use modules from unreleased CMake (default ON)
  if(NOT DEFINED YCM_USE_CMAKE_NEXT OR YCM_USE_CMAKE_NEXT)
    list(APPEND YCM_MODULE_PATH "${YCM_MODULE_DIR}/cmake-next/Modules")
  endif()

  # Use modules from specific CMake versions (default ON)
  foreach(_version 3.15
                   3.14
                   3.13)
    if(EXISTS "${YCM_MODULE_DIR}/cmake-${_version}"
      AND CMAKE_MINIMUM_REQUIRED_VERSION VERSION_LESS ${_version}
      AND CMAKE_VERSION VERSION_LESS ${_version})
      string(REPLACE "." "_" _VERSION ${_version})
      if(NOT DEFINED YCM_USE_CMAKE_${_VERSION} OR YCM_USE_CMAKE_${_VERSION})
        list(APPEND YCM_MODULE_PATH "${YCM_MODULE_DIR}/cmake-${_version}/Modules")
      endif()
    endif()
  endforeach()

endif()

# Use YCM 3rd party modules (default ON)
if(EXISTS "${YCM_MODULE_DIR}/3rdparty")
  if(NOT DEFINED YCM_USE_3RDPARTY OR YCM_USE_3RDPARTY)
    list(APPEND YCM_MODULE_PATH "${YCM_MODULE_DIR}/3rdparty")
  endif()
endif()

# Use YCM deprecated modules (default ON)
if(EXISTS "${YCM_MODULE_DIR}/deprecated")
  if(NOT DEFINED YCM_USE_DEPRECATED OR YCM_USE_DEPRECATED)
    list(APPEND YCM_MODULE_PATH "${YCM_MODULE_DIR}/deprecated")
    set(YCM_NO_DEPRECATED 0)
  endif()
endif()

list(APPEND CMAKE_MODULE_PATH "${YCM_MODULE_PATH}")


if(COMMAND set_package_properties)
  set_package_properties(YCM PROPERTIES DESCRIPTION "A collection of CMake modules and utilities for YARP and friends"
                                        URL "https://github.com/robotology/ycm")
endif()


if(NOT YCM_FIND_QUIETLY)
  message(STATUS "Found YCM: ${YCM_DIR} (found version \"${YCM_VERSION}\")")
endif()
