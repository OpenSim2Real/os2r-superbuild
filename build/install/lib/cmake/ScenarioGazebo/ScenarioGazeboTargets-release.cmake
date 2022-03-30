#----------------------------------------------------------------
# Generated CMake target import file for configuration "Release".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "ScenarioGazebo::ScenarioGazebo" for configuration "Release"
set_property(TARGET ScenarioGazebo::ScenarioGazebo APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(ScenarioGazebo::ScenarioGazebo PROPERTIES
  IMPORTED_LINK_DEPENDENT_LIBRARIES_RELEASE "ScenarioCore::CoreUtils;ignition-physics5::ignition-physics5"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libScenarioGazebo.so"
  IMPORTED_SONAME_RELEASE "libScenarioGazebo.so"
  )

list(APPEND _IMPORT_CHECK_TARGETS ScenarioGazebo::ScenarioGazebo )
list(APPEND _IMPORT_CHECK_FILES_FOR_ScenarioGazebo::ScenarioGazebo "${_IMPORT_PREFIX}/lib/libScenarioGazebo.so" )

# Import target "ScenarioGazebo::GazeboSimulator" for configuration "Release"
set_property(TARGET ScenarioGazebo::GazeboSimulator APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(ScenarioGazebo::GazeboSimulator PROPERTIES
  IMPORTED_LINK_DEPENDENT_LIBRARIES_RELEASE "ScenarioCore::CoreUtils;ScenarioGazebo::ScenarioGazebo"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libGazeboSimulator.so"
  IMPORTED_SONAME_RELEASE "libGazeboSimulator.so"
  )

list(APPEND _IMPORT_CHECK_TARGETS ScenarioGazebo::GazeboSimulator )
list(APPEND _IMPORT_CHECK_FILES_FOR_ScenarioGazebo::GazeboSimulator "${_IMPORT_PREFIX}/lib/libGazeboSimulator.so" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
