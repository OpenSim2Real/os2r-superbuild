set(YCM_USE_CMAKE_PROPOSED TRUE CACHE BOOL "Use files including unmerged cmake patches")

# YCM options
option(YCM_DISABLE_SYSTEM_PACKAGES "Disable use of all the system installed packages" ON)

# Always install core...
option(OPENSIM2REAL_ENABLE_CORE "Enable compilation of core dependencies. There are core dependencies for the simulator and for the real robot." TRUE)
option(OPENSIM2REAL_ENABLE_ALL "Enable compilation of every package." FALSE)

# Options
option(OPENSIM2REAL_ENABLE_GYMOS2R_REAL "Install gym_os2r_real python package. Requires python to be enabled and `OPENSIM2REAL_ENABLE_GYMOS2R:BOOL=TRUE`." FALSE)
option(OPENSIM2REAL_ENABLE_GYMOS2R "Install gym_os2r python package. Requires python to be enabled." FALSE)
option(OPENSIM2REAL_ENABLE_SCENARIO_MONOPOD "Enable compilation of scenario_monopod." FALSE)
option(OPENSIM2REAL_ENABLE_GYMIGNITION "Install gym_ignition python package. Requires python to be enabled." FALSE)
# This is set to cache the option globall for whether to install gym ignition or not
set(INSTALL_GYMIGNITION ${OPENSIM2REAL_ENABLE_GYMIGNITION} CACHE INTERNAL "installing_gym_ignition")

option(OPENSIM2REAL_ENABLE_SCENARIO "Enable compilation of scenario." FALSE)
option(OPENSIM2REAL_ENABLE_MONOPODSDK "Enable compilation of monopod_sdk." FALSE)

# Misc
option(OPENSIM2REAL_USES_PYTHON "Enable compilation of software that depend on Python." TRUE)
option(OPENSIM2REAL_ENABLE_BUILDDOCS "Compile entire projects docs. Requires `OPENSIM2REAL_ENABLE_ALL=TRUE`." FALSE)
option(OPENSIM2REAL_ENABLE_SIMULATION "Enable compilation of the components that require the ignition gazebo simulator. If FALSE ignition gazebo is not a required dependency." FALSE)


#set default build type to "Release" in single-config generators
if(NOT CMAKE_CONFIGURATION_TYPES)
  if(NOT CMAKE_BUILD_TYPE)
    set(CMAKE_BUILD_TYPE "Release" CACHE STRING
    "Choose the type of build, recommended options are: Debug or Release" FORCE)
  endif()
  set(OPENSIM2REAL_BUILD_TYPES "Debug" "Release")
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
