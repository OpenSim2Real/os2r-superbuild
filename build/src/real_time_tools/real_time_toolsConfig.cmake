
####### Expanded from @PACKAGE_INIT@ by configure_package_config_file() #######
####### Any changes to this file will be overwritten by the next CMake run ####
####### The input file was Config.cmake.in                            ########

get_filename_component(PACKAGE_PREFIX_DIR "${CMAKE_CURRENT_LIST_DIR}/../../../" ABSOLUTE)

macro(set_and_check _var _file)
  set(${_var} "${_file}")
  if(NOT EXISTS "${_file}")
    message(FATAL_ERROR "File or directory ${_file} referenced by variable ${_var} does not exist !")
  endif()
endmacro()

macro(check_required_components _NAME)
  foreach(comp ${${_NAME}_FIND_COMPONENTS})
    if(NOT ${_NAME}_${comp}_FOUND)
      if(${_NAME}_FIND_REQUIRED_${comp})
        set(${_NAME}_FOUND FALSE)
      endif()
    endif()
  endforeach()
endmacro()

####################################################################################

include("${CMAKE_CURRENT_LIST_DIR}/real_time_toolsTargets.cmake")

include(CMakeFindDependencyMacro)

# we do not add the other dependencies because these are header files lib
if(${CMAKE_VERSION} VERSION_LESS "3.15.0")
  find_package(pybind11 REQUIRED)
  find_package(Eigen3 REQUIRED)
  find_package(Boost REQUIRED COMPONENTS filesystem)
  find_package(Threads REQUIRED)
else()
  find_dependency(pybind11 REQUIRED)
  find_dependency(Eigen3 REQUIRED)
  find_dependency(Boost REQUIRED COMPONENTS filesystem)
  find_dependency(Threads REQUIRED)
endif()

check_required_components(real_time_tools)
