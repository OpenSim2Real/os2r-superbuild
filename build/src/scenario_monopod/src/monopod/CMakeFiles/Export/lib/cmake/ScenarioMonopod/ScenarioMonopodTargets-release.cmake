#----------------------------------------------------------------
# Generated CMake target import file for configuration "Release".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "ScenarioMonopod::ScenarioMonopod" for configuration "Release"
set_property(TARGET ScenarioMonopod::ScenarioMonopod APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(ScenarioMonopod::ScenarioMonopod PROPERTIES
  IMPORTED_LINK_DEPENDENT_LIBRARIES_RELEASE "ScenarioCore::CoreUtils"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libScenarioMonopod.so"
  IMPORTED_SONAME_RELEASE "libScenarioMonopod.so"
  )

list(APPEND _IMPORT_CHECK_TARGETS ScenarioMonopod::ScenarioMonopod )
list(APPEND _IMPORT_CHECK_FILES_FOR_ScenarioMonopod::ScenarioMonopod "${_IMPORT_PREFIX}/lib/libScenarioMonopod.so" )

# Import target "ScenarioMonopod::demo_main" for configuration "Release"
set_property(TARGET ScenarioMonopod::demo_main APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(ScenarioMonopod::demo_main PROPERTIES
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/bin/demo_main"
  )

list(APPEND _IMPORT_CHECK_TARGETS ScenarioMonopod::demo_main )
list(APPEND _IMPORT_CHECK_FILES_FOR_ScenarioMonopod::demo_main "${_IMPORT_PREFIX}/bin/demo_main" )

# Import target "ScenarioMonopod::demo_loops" for configuration "Release"
set_property(TARGET ScenarioMonopod::demo_loops APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(ScenarioMonopod::demo_loops PROPERTIES
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/bin/demo_loops"
  )

list(APPEND _IMPORT_CHECK_TARGETS ScenarioMonopod::demo_loops )
list(APPEND _IMPORT_CHECK_FILES_FOR_ScenarioMonopod::demo_loops "${_IMPORT_PREFIX}/bin/demo_loops" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
