#----------------------------------------------------------------
# Generated CMake target import file for configuration "Release".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "real_time_tools::real_time_tools" for configuration "Release"
set_property(TARGET real_time_tools::real_time_tools APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(real_time_tools::real_time_tools PROPERTIES
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libreal_time_tools.so"
  IMPORTED_SONAME_RELEASE "libreal_time_tools.so"
  )

list(APPEND _IMPORT_CHECK_TARGETS real_time_tools::real_time_tools )
list(APPEND _IMPORT_CHECK_FILES_FOR_real_time_tools::real_time_tools "${_IMPORT_PREFIX}/lib/libreal_time_tools.so" )

# Import target "real_time_tools::demo_realtime_check" for configuration "Release"
set_property(TARGET real_time_tools::demo_realtime_check APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(real_time_tools::demo_realtime_check PROPERTIES
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/bin/demo_realtime_check"
  )

list(APPEND _IMPORT_CHECK_TARGETS real_time_tools::demo_realtime_check )
list(APPEND _IMPORT_CHECK_FILES_FOR_real_time_tools::demo_realtime_check "${_IMPORT_PREFIX}/bin/demo_realtime_check" )

# Import target "real_time_tools::demo_realtime_strict_check" for configuration "Release"
set_property(TARGET real_time_tools::demo_realtime_strict_check APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(real_time_tools::demo_realtime_strict_check PROPERTIES
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/bin/demo_realtime_strict_check"
  )

list(APPEND _IMPORT_CHECK_TARGETS real_time_tools::demo_realtime_strict_check )
list(APPEND _IMPORT_CHECK_FILES_FOR_real_time_tools::demo_realtime_strict_check "${_IMPORT_PREFIX}/bin/demo_realtime_strict_check" )

# Import target "real_time_tools::demo_spinner" for configuration "Release"
set_property(TARGET real_time_tools::demo_spinner APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(real_time_tools::demo_spinner PROPERTIES
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/bin/demo_spinner"
  )

list(APPEND _IMPORT_CHECK_TARGETS real_time_tools::demo_spinner )
list(APPEND _IMPORT_CHECK_FILES_FOR_real_time_tools::demo_spinner "${_IMPORT_PREFIX}/bin/demo_spinner" )

# Import target "real_time_tools::demo_timing" for configuration "Release"
set_property(TARGET real_time_tools::demo_timing APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(real_time_tools::demo_timing PROPERTIES
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/bin/demo_timing"
  )

list(APPEND _IMPORT_CHECK_TARGETS real_time_tools::demo_timing )
list(APPEND _IMPORT_CHECK_FILES_FOR_real_time_tools::demo_timing "${_IMPORT_PREFIX}/bin/demo_timing" )

# Import target "real_time_tools::demo_thread" for configuration "Release"
set_property(TARGET real_time_tools::demo_thread APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(real_time_tools::demo_thread PROPERTIES
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/bin/demo_thread"
  )

list(APPEND _IMPORT_CHECK_TARGETS real_time_tools::demo_thread )
list(APPEND _IMPORT_CHECK_FILES_FOR_real_time_tools::demo_thread "${_IMPORT_PREFIX}/bin/demo_thread" )

# Import target "real_time_tools::demo_usb_stream_imu_3DM_GX3_25" for configuration "Release"
set_property(TARGET real_time_tools::demo_usb_stream_imu_3DM_GX3_25 APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(real_time_tools::demo_usb_stream_imu_3DM_GX3_25 PROPERTIES
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/bin/demo_usb_stream_imu_3DM_GX3_25"
  )

list(APPEND _IMPORT_CHECK_TARGETS real_time_tools::demo_usb_stream_imu_3DM_GX3_25 )
list(APPEND _IMPORT_CHECK_FILES_FOR_real_time_tools::demo_usb_stream_imu_3DM_GX3_25 "${_IMPORT_PREFIX}/bin/demo_usb_stream_imu_3DM_GX3_25" )

# Import target "real_time_tools::demo_checkpoint_timer" for configuration "Release"
set_property(TARGET real_time_tools::demo_checkpoint_timer APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(real_time_tools::demo_checkpoint_timer PROPERTIES
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/bin/demo_checkpoint_timer"
  )

list(APPEND _IMPORT_CHECK_TARGETS real_time_tools::demo_checkpoint_timer )
list(APPEND _IMPORT_CHECK_FILES_FOR_real_time_tools::demo_checkpoint_timer "${_IMPORT_PREFIX}/bin/demo_checkpoint_timer" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
