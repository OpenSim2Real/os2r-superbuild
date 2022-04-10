#----------------------------------------------------------------
# Generated CMake target import file for configuration "Release".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "time_series::time_series" for configuration "Release"
set_property(TARGET time_series::time_series APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(time_series::time_series PROPERTIES
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libtime_series.so"
  IMPORTED_SONAME_RELEASE "libtime_series.so"
  )

list(APPEND _IMPORT_CHECK_TARGETS time_series::time_series )
list(APPEND _IMPORT_CHECK_FILES_FOR_time_series::time_series "${_IMPORT_PREFIX}/lib/libtime_series.so" )

# Import target "time_series::time_series_demo" for configuration "Release"
set_property(TARGET time_series::time_series_demo APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(time_series::time_series_demo PROPERTIES
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/bin/time_series_demo"
  )

list(APPEND _IMPORT_CHECK_TARGETS time_series::time_series_demo )
list(APPEND _IMPORT_CHECK_FILES_FOR_time_series::time_series_demo "${_IMPORT_PREFIX}/bin/time_series_demo" )

# Import target "time_series::time_series_demo_multiprocess_write" for configuration "Release"
set_property(TARGET time_series::time_series_demo_multiprocess_write APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(time_series::time_series_demo_multiprocess_write PROPERTIES
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/bin/time_series_demo_multiprocess_write"
  )

list(APPEND _IMPORT_CHECK_TARGETS time_series::time_series_demo_multiprocess_write )
list(APPEND _IMPORT_CHECK_FILES_FOR_time_series::time_series_demo_multiprocess_write "${_IMPORT_PREFIX}/bin/time_series_demo_multiprocess_write" )

# Import target "time_series::time_series_demo_multiprocess_read" for configuration "Release"
set_property(TARGET time_series::time_series_demo_multiprocess_read APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(time_series::time_series_demo_multiprocess_read PROPERTIES
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/bin/time_series_demo_multiprocess_read"
  )

list(APPEND _IMPORT_CHECK_TARGETS time_series::time_series_demo_multiprocess_read )
list(APPEND _IMPORT_CHECK_FILES_FOR_time_series::time_series_demo_multiprocess_read "${_IMPORT_PREFIX}/bin/time_series_demo_multiprocess_read" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
