#----------------------------------------------------------------
# Generated CMake target import file for configuration "Release".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "iDynTree::idyntree-core" for configuration "Release"
set_property(TARGET iDynTree::idyntree-core APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(iDynTree::idyntree-core PROPERTIES
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libidyntree-core.so"
  IMPORTED_SONAME_RELEASE "libidyntree-core.so"
  )

list(APPEND _IMPORT_CHECK_TARGETS iDynTree::idyntree-core )
list(APPEND _IMPORT_CHECK_FILES_FOR_iDynTree::idyntree-core "${_IMPORT_PREFIX}/lib/libidyntree-core.so" )

# Import target "iDynTree::idyntree-model" for configuration "Release"
set_property(TARGET iDynTree::idyntree-model APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(iDynTree::idyntree-model PROPERTIES
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libidyntree-model.so"
  IMPORTED_SONAME_RELEASE "libidyntree-model.so"
  )

list(APPEND _IMPORT_CHECK_TARGETS iDynTree::idyntree-model )
list(APPEND _IMPORT_CHECK_FILES_FOR_iDynTree::idyntree-model "${_IMPORT_PREFIX}/lib/libidyntree-model.so" )

# Import target "iDynTree::idyntree-sensors" for configuration "Release"
set_property(TARGET iDynTree::idyntree-sensors APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(iDynTree::idyntree-sensors PROPERTIES
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libidyntree-sensors.so"
  IMPORTED_SONAME_RELEASE "libidyntree-sensors.so"
  )

list(APPEND _IMPORT_CHECK_TARGETS iDynTree::idyntree-sensors )
list(APPEND _IMPORT_CHECK_FILES_FOR_iDynTree::idyntree-sensors "${_IMPORT_PREFIX}/lib/libidyntree-sensors.so" )

# Import target "iDynTree::idyntree-modelio-xml" for configuration "Release"
set_property(TARGET iDynTree::idyntree-modelio-xml APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(iDynTree::idyntree-modelio-xml PROPERTIES
  IMPORTED_LINK_DEPENDENT_LIBRARIES_RELEASE "iDynTree::idyntree-core"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libidyntree-modelio-xml.so"
  IMPORTED_SONAME_RELEASE "libidyntree-modelio-xml.so"
  )

list(APPEND _IMPORT_CHECK_TARGETS iDynTree::idyntree-modelio-xml )
list(APPEND _IMPORT_CHECK_FILES_FOR_iDynTree::idyntree-modelio-xml "${_IMPORT_PREFIX}/lib/libidyntree-modelio-xml.so" )

# Import target "iDynTree::idyntree-modelio" for configuration "Release"
set_property(TARGET iDynTree::idyntree-modelio APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(iDynTree::idyntree-modelio PROPERTIES
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libidyntree-modelio.so"
  IMPORTED_SONAME_RELEASE "libidyntree-modelio.so"
  )

list(APPEND _IMPORT_CHECK_TARGETS iDynTree::idyntree-modelio )
list(APPEND _IMPORT_CHECK_FILES_FOR_iDynTree::idyntree-modelio "${_IMPORT_PREFIX}/lib/libidyntree-modelio.so" )

# Import target "iDynTree::idyntree-estimation" for configuration "Release"
set_property(TARGET iDynTree::idyntree-estimation APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(iDynTree::idyntree-estimation PROPERTIES
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libidyntree-estimation.so"
  IMPORTED_SONAME_RELEASE "libidyntree-estimation.so"
  )

list(APPEND _IMPORT_CHECK_TARGETS iDynTree::idyntree-estimation )
list(APPEND _IMPORT_CHECK_FILES_FOR_iDynTree::idyntree-estimation "${_IMPORT_PREFIX}/lib/libidyntree-estimation.so" )

# Import target "iDynTree::idyntree-solid-shapes" for configuration "Release"
set_property(TARGET iDynTree::idyntree-solid-shapes APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(iDynTree::idyntree-solid-shapes PROPERTIES
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libidyntree-solid-shapes.so"
  IMPORTED_SONAME_RELEASE "libidyntree-solid-shapes.so"
  )

list(APPEND _IMPORT_CHECK_TARGETS iDynTree::idyntree-solid-shapes )
list(APPEND _IMPORT_CHECK_FILES_FOR_iDynTree::idyntree-solid-shapes "${_IMPORT_PREFIX}/lib/libidyntree-solid-shapes.so" )

# Import target "iDynTree::idyntree-high-level" for configuration "Release"
set_property(TARGET iDynTree::idyntree-high-level APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(iDynTree::idyntree-high-level PROPERTIES
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libidyntree-high-level.so"
  IMPORTED_SONAME_RELEASE "libidyntree-high-level.so"
  )

list(APPEND _IMPORT_CHECK_TARGETS iDynTree::idyntree-high-level )
list(APPEND _IMPORT_CHECK_FILES_FOR_iDynTree::idyntree-high-level "${_IMPORT_PREFIX}/lib/libidyntree-high-level.so" )

# Import target "iDynTree::idyntree-inverse-kinematics" for configuration "Release"
set_property(TARGET iDynTree::idyntree-inverse-kinematics APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(iDynTree::idyntree-inverse-kinematics PROPERTIES
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libidyntree-inverse-kinematics.so"
  IMPORTED_SONAME_RELEASE "libidyntree-inverse-kinematics.so"
  )

list(APPEND _IMPORT_CHECK_TARGETS iDynTree::idyntree-inverse-kinematics )
list(APPEND _IMPORT_CHECK_FILES_FOR_iDynTree::idyntree-inverse-kinematics "${_IMPORT_PREFIX}/lib/libidyntree-inverse-kinematics.so" )

# Import target "iDynTree::idyntree-optimalcontrol" for configuration "Release"
set_property(TARGET iDynTree::idyntree-optimalcontrol APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(iDynTree::idyntree-optimalcontrol PROPERTIES
  IMPORTED_LINK_DEPENDENT_LIBRARIES_RELEASE "OsqpEigen::OsqpEigen;osqp::osqp"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libidyntree-optimalcontrol.so"
  IMPORTED_SONAME_RELEASE "libidyntree-optimalcontrol.so"
  )

list(APPEND _IMPORT_CHECK_TARGETS iDynTree::idyntree-optimalcontrol )
list(APPEND _IMPORT_CHECK_FILES_FOR_iDynTree::idyntree-optimalcontrol "${_IMPORT_PREFIX}/lib/libidyntree-optimalcontrol.so" )

# Import target "iDynTree::idyntree-visualization" for configuration "Release"
set_property(TARGET iDynTree::idyntree-visualization APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(iDynTree::idyntree-visualization PROPERTIES
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libidyntree-visualization.so"
  IMPORTED_SONAME_RELEASE "libidyntree-visualization.so"
  )

list(APPEND _IMPORT_CHECK_TARGETS iDynTree::idyntree-visualization )
list(APPEND _IMPORT_CHECK_FILES_FOR_iDynTree::idyntree-visualization "${_IMPORT_PREFIX}/lib/libidyntree-visualization.so" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
