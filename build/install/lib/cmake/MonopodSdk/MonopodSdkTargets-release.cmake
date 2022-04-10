#----------------------------------------------------------------
# Generated CMake target import file for configuration "Release".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "MonopodSdk::MonopodSdk" for configuration "Release"
set_property(TARGET MonopodSdk::MonopodSdk APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(MonopodSdk::MonopodSdk PROPERTIES
  IMPORTED_LINK_DEPENDENT_LIBRARIES_RELEASE "time_series::time_series;real_time_tools::real_time_tools"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libMonopodSdk.so"
  IMPORTED_SONAME_RELEASE "libMonopodSdk.so"
  )

list(APPEND _IMPORT_CHECK_TARGETS MonopodSdk::MonopodSdk )
list(APPEND _IMPORT_CHECK_FILES_FOR_MonopodSdk::MonopodSdk "${_IMPORT_PREFIX}/lib/libMonopodSdk.so" )

# Import target "MonopodSdk::demo_leg_sine_position" for configuration "Release"
set_property(TARGET MonopodSdk::demo_leg_sine_position APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(MonopodSdk::demo_leg_sine_position PROPERTIES
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/bin/demo_leg_sine_position"
  )

list(APPEND _IMPORT_CHECK_TARGETS MonopodSdk::demo_leg_sine_position )
list(APPEND _IMPORT_CHECK_FILES_FOR_MonopodSdk::demo_leg_sine_position "${_IMPORT_PREFIX}/bin/demo_leg_sine_position" )

# Import target "MonopodSdk::demo_print_sdk" for configuration "Release"
set_property(TARGET MonopodSdk::demo_print_sdk APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(MonopodSdk::demo_print_sdk PROPERTIES
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/bin/demo_print_sdk"
  )

list(APPEND _IMPORT_CHECK_TARGETS MonopodSdk::demo_print_sdk )
list(APPEND _IMPORT_CHECK_FILES_FOR_MonopodSdk::demo_print_sdk "${_IMPORT_PREFIX}/bin/demo_print_sdk" )

# Import target "MonopodSdk::MonopodDrivers" for configuration "Release"
set_property(TARGET MonopodSdk::MonopodDrivers APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(MonopodSdk::MonopodDrivers PROPERTIES
  IMPORTED_LINK_DEPENDENT_LIBRARIES_RELEASE "real_time_tools::real_time_tools;time_series::time_series"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libMonopodDrivers.so"
  IMPORTED_SONAME_RELEASE "libMonopodDrivers.so"
  )

list(APPEND _IMPORT_CHECK_TARGETS MonopodSdk::MonopodDrivers )
list(APPEND _IMPORT_CHECK_FILES_FOR_MonopodSdk::MonopodDrivers "${_IMPORT_PREFIX}/lib/libMonopodDrivers.so" )

# Import target "MonopodSdk::utils" for configuration "Release"
set_property(TARGET MonopodSdk::utils APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(MonopodSdk::utils PROPERTIES
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libutils.so"
  IMPORTED_SONAME_RELEASE "libutils.so"
  )

list(APPEND _IMPORT_CHECK_TARGETS MonopodSdk::utils )
list(APPEND _IMPORT_CHECK_FILES_FOR_MonopodSdk::utils "${_IMPORT_PREFIX}/lib/libutils.so" )

# Import target "MonopodSdk::devices" for configuration "Release"
set_property(TARGET MonopodSdk::devices APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(MonopodSdk::devices PROPERTIES
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libdevices.so"
  IMPORTED_SONAME_RELEASE "libdevices.so"
  )

list(APPEND _IMPORT_CHECK_TARGETS MonopodSdk::devices )
list(APPEND _IMPORT_CHECK_FILES_FOR_MonopodSdk::devices "${_IMPORT_PREFIX}/lib/libdevices.so" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
