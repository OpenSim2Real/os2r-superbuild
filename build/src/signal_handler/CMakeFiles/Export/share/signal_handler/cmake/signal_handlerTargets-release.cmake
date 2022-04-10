#----------------------------------------------------------------
# Generated CMake target import file for configuration "Release".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "signal_handler::signal_handler" for configuration "Release"
set_property(TARGET signal_handler::signal_handler APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(signal_handler::signal_handler PROPERTIES
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libsignal_handler.so"
  IMPORTED_SONAME_RELEASE "libsignal_handler.so"
  )

list(APPEND _IMPORT_CHECK_TARGETS signal_handler::signal_handler )
list(APPEND _IMPORT_CHECK_FILES_FOR_signal_handler::signal_handler "${_IMPORT_PREFIX}/lib/libsignal_handler.so" )

# Import target "signal_handler::signal_handler_demo" for configuration "Release"
set_property(TARGET signal_handler::signal_handler_demo APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(signal_handler::signal_handler_demo PROPERTIES
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/bin/signal_handler_demo"
  )

list(APPEND _IMPORT_CHECK_TARGETS signal_handler::signal_handler_demo )
list(APPEND _IMPORT_CHECK_FILES_FOR_signal_handler::signal_handler_demo "${_IMPORT_PREFIX}/bin/signal_handler_demo" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
