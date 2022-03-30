
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

#include("${CMAKE_CURRENT_LIST_DIR}/mpi_cmake_modulesTargets.cmake")

# Common imports
include(${CMAKE_CURRENT_LIST_DIR}/global_calls.cmake)
include(${CMAKE_CURRENT_LIST_DIR}/get_python_install_dir.cmake)
include(${CMAKE_CURRENT_LIST_DIR}/documentation.cmake)
include(${CMAKE_CURRENT_LIST_DIR}/install_scripts.cmake)
include(${CMAKE_CURRENT_LIST_DIR}/generate_cmake_package.cmake)

# Used by some dependencies
include(${CMAKE_CURRENT_LIST_DIR}/boost_python.cmake)
include(${CMAKE_CURRENT_LIST_DIR}/pybind11.cmake)
include(${CMAKE_CURRENT_LIST_DIR}/find_modules.cmake)
include(${CMAKE_CURRENT_LIST_DIR}/dynamic_graph.cmake)


set(MPI_CMAKE_MODULES_RESOURCES_DIR "${CMAKE_CURRENT_LIST_DIR}/../resources/")

check_required_components(mpi_cmake_modules)

