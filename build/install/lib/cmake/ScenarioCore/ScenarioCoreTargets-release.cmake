#----------------------------------------------------------------
# Generated CMake target import file for configuration "Release".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "ScenarioCore::CoreUtils" for configuration "Release"
set_property(TARGET ScenarioCore::CoreUtils APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(ScenarioCore::CoreUtils PROPERTIES
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libCoreUtils.so"
  IMPORTED_SONAME_RELEASE "libCoreUtils.so"
  )

list(APPEND _IMPORT_CHECK_TARGETS ScenarioCore::CoreUtils )
list(APPEND _IMPORT_CHECK_FILES_FOR_ScenarioCore::CoreUtils "${_IMPORT_PREFIX}/lib/libCoreUtils.so" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
