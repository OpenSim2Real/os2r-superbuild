set(YCM_USE_CMAKE_PROPOSED TRUE CACHE BOOL "Use files including unmerged cmake patches")

# YCM options
option(YCM_DISABLE_SYSTEM_PACKAGES "Disable use of all the system installed packages" ON)

# Enable/disable different profiles
option(OPENSIM2REAL_ENABLE_MONOPODSDK "Enable compilation of monopod_sdk." FALSE)
option(OPENSIM2REAL_ENABLE_SCENARIO "Enable compilation of scenario." FALSE)
option(OPENSIM2REAL_ENABLE_SCENARIO_MONOPOD "Enable compilation of scenario_monopod. True by default unless only simulation compilation is enabled." TRUE)
option(OPENSIM2REAL_ENABLE_GYMIGNITION "Install gym_ignition python module if scenario is enabled. Requires python to be enabled." TRUE)
option(OPENSIM2REAL_ENABLE_GYMOS2R "Install gym_os2r python module if scenario/gym-ignition options are enabled. Requires python to be enabled." FALSE)
option(OPENSIM2REAL_ENABLE_ALL "Enable compilation of scenario." FALSE)

option(OPENSIM2REAL_ENABLE_SIMULATION_ONLY "Enable compilation off the components necessary for simulation only. Will only read OPENSIM2REAL_ENABLE_GYMOS2R option when enabled" FALSE)

option(OPENSIM2REAL_USES_PYTHON "Enable compilation of software that depend on Python" TRUE)
option(OPENSIM2REAL_ENABLE_BUILDDOCS "Compile entire projects docs. Requires `OPENSIM2REAL_ENABLE_ALL=TRUE`." FALSE)

IF(OPENSIM2REAL_ENABLE_SIMULATION_ONLY AND NOT OPENSIM2REAL_USES_PYTHON)
  message(FATAL_ERROR "In simulation only mode super requires `OPENSIM2REAL_USES_PYTHON=TRUE`.")
ENDIF()

#set default build type to "Release" in single-config generators
if(NOT CMAKE_CONFIGURATION_TYPES)
  if(NOT CMAKE_BUILD_TYPE)
    set(CMAKE_BUILD_TYPE "Release" CACHE STRING
    "Choose the type of build, recommended options are: Debug or Release" FORCE)
  endif()
  set(OPENSIM2REAL_BUILD_TYPES "Debug" "Release" "MinSizeRel" "RelWithDebInfo")
  set_property(CACHE CMAKE_BUILD_TYPE PROPERTY STRINGS ${OPENSIM2REAL_BUILD_TYPES})
endif()

set(OPENSIM2REAL_PROJECT_TAGS "Stable" CACHE STRING "The tags to be used for the OPENSIM2REAL projects: Stable, Unstable, LatestRelease or Custom. This can be changed only before the first configuration.")
mark_as_advanced(OPENSIM2REAL_PROJECT_TAGS)
set(OPENSIM2REAL_PROJECT_TAGS_CUSTOM_FILE CACHE FILEPATH "If OPENSIM2REAL_PROJECT_TAGS is custom, this file will be loaded to specify the tags of the projects to use.")
mark_as_advanced(OPENSIM2REAL_PROJECT_TAGS_CUSTOM_FILE)
set_property(CACHE OPENSIM2REAL_PROJECT_TAGS PROPERTY STRINGS "Stable" "Unstable" "LatestRelease" "Custom")

if(OPENSIM2REAL_PROJECT_TAGS STREQUAL "Stable")
  include(ProjectsTagsStable)
elseif(OPENSIM2REAL_PROJECT_TAGS STREQUAL "Unstable")
  include(ProjectsTagsUnstable)
elseif(OPENSIM2REAL_PROJECT_TAGS STREQUAL "LatestRelease")
  include(YCMLoadVcsYamlInfo)
  ycm_load_vcs_yaml_info(YAML_FILE ${PROJECT_SOURCE_DIR}/releases/latest.releases.yaml VERBOSE)
elseif(OPENSIM2REAL_PROJECT_TAGS STREQUAL "Custom")
  if(OPENSIM2REAL_PROJECT_TAGS_CUSTOM_FILE MATCHES ".yaml$" OR
    OPENSIM2REAL_PROJECT_TAGS_CUSTOM_FILE MATCHES ".repos$")
    include(YCMLoadVcsYamlInfo)
    ycm_load_vcs_yaml_info(YAML_FILE ${OPENSIM2REAL_PROJECT_TAGS_CUSTOM_FILE} VERBOSE)
  else()
    include(${OPENSIM2REAL_PROJECT_TAGS_CUSTOM_FILE})
  endif()
else()
    message(FATAL_ERROR "The OPENSIM2REAL_PROJECT_TAGS variable can be Stable, Unstable or Custom. ${OPENSIM2REAL_PROJECT_TAGS} value is not supported.")
endif()
