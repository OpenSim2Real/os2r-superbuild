#----------------------------------------------------------------
# Generated CMake target import file for configuration "Release".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "ScenarioControllers::ComputedTorqueFixedBase" for configuration "Release"
set_property(TARGET ScenarioControllers::ComputedTorqueFixedBase APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(ScenarioControllers::ComputedTorqueFixedBase PROPERTIES
  IMPORTED_LINK_DEPENDENT_LIBRARIES_RELEASE "iDynTree::idyntree-core;iDynTree::idyntree-model;iDynTree::idyntree-high-level"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libComputedTorqueFixedBase.so"
  IMPORTED_SONAME_RELEASE "libComputedTorqueFixedBase.so"
  )

list(APPEND _IMPORT_CHECK_TARGETS ScenarioControllers::ComputedTorqueFixedBase )
list(APPEND _IMPORT_CHECK_FILES_FOR_ScenarioControllers::ComputedTorqueFixedBase "${_IMPORT_PREFIX}/lib/libComputedTorqueFixedBase.so" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
