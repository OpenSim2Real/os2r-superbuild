set(YCM_USE_CMAKE_PROPOSED TRUE CACHE BOOL "Use files including unmerged cmake patches")

# YCM options
option(YCM_DISABLE_SYSTEM_PACKAGES "Disable use of all the system installed packages" ON)

option(BAESIANBALANCER_USES_PYTHON "Enable compilation of software that depend on Python" FALSE)

# TODO: Maybe include this
# ## Enable packages that depend on the Ignition Gazebo simulator
# set(BAESIANBALANCER_USES_IGNITION_DEFAULT FALSE)
# option(BAESIANBALANCER_USES_IGNITION "Enable compilation of software that depends on Ignition Gazebo" ${BAESIANBALANCER_USES_IGNITION_DEFAULT})

# Enable/disable different profiles
option(BAESIANBALANCER_ENABLE_CORE "Enable compilation of core software libraries." TRUE)
option(BAESIANBALANCER_ENABLE_MONOPODSDK "Enable compilation of monopod_sdk." FALSE)
option(BAESIANBALANCER_ENABLE_SCENARIO "Enable compilation of scenario." FALSE)

# Mark as advanced all the profiles that do not have a mantainer... for example
# option(BAESIANBALANCER_ENABLE_GRASPING "Enable compilation of software for grasping." FALSE)
# mark_as_advanced(BAESIANBALANCER_ENABLE_GRASPING)

#set default build type to "Release" in single-config generators
if(NOT CMAKE_CONFIGURATION_TYPES)
    if(NOT CMAKE_BUILD_TYPE)
    set(CMAKE_BUILD_TYPE "Release" CACHE STRING
    "Choose the type of build, recommended options are: Debug or Release" FORCE)
    endif()
    set(BAESIANBALANCER_BUILD_TYPES "Debug" "Release" "MinSizeRel" "RelWithDebInfo")
    set_property(CACHE CMAKE_BUILD_TYPE PROPERTY STRINGS ${BAESIANBALANCER_BUILD_TYPES})
endif()

set(BAESIANBALANCER_PROJECT_TAGS "Stable" CACHE STRING "The tags to be used for the BAESIANBALANCER projects: Stable, Unstable, LatestRelease or Custom. This can be changed only before the first configuration.")
mark_as_advanced(BAESIANBALANCER_PROJECT_TAGS)
set(BAESIANBALANCER_PROJECT_TAGS_CUSTOM_FILE CACHE FILEPATH "If BAESIANBALANCER_PROJECT_TAGS is custom, this file will be loaded to specify the tags of the projects to use.")
mark_as_advanced(BAESIANBALANCER_PROJECT_TAGS_CUSTOM_FILE)
set_property(CACHE BAESIANBALANCER_PROJECT_TAGS PROPERTY STRINGS "Stable" "Unstable" "LatestRelease" "Custom")

if(BAESIANBALANCER_PROJECT_TAGS STREQUAL "Stable")
    include(ProjectsTagsStable)
elseif(BAESIANBALANCER_PROJECT_TAGS STREQUAL "Unstable")
    include(ProjectsTagsUnstable)
elseif(BAESIANBALANCER_PROJECT_TAGS STREQUAL "LatestRelease")
    include(YCMLoadVcsYamlInfo)
    ycm_load_vcs_yaml_info(YAML_FILE ${PROJECT_SOURCE_DIR}/releases/latest.releases.yaml VERBOSE)
elseif(BAESIANBALANCER_PROJECT_TAGS STREQUAL "Custom")
    if(BAESIANBALANCER_PROJECT_TAGS_CUSTOM_FILE MATCHES ".yaml$" OR
       BAESIANBALANCER_PROJECT_TAGS_CUSTOM_FILE MATCHES ".repos$")
       include(YCMLoadVcsYamlInfo)
       ycm_load_vcs_yaml_info(YAML_FILE ${BAESIANBALANCER_PROJECT_TAGS_CUSTOM_FILE} VERBOSE)
    else()
        include(${BAESIANBALANCER_PROJECT_TAGS_CUSTOM_FILE})
    endif()
else()
    message(FATAL_ERROR "The BAESIANBALANCER_PROJECT_TAGS variable can be Stable, Unstable or Custom. ${BAESIANBALANCER_PROJECT_TAGS} value is not supported.")
endif()

# option(BAESIANBALANCER_GENERATE_CONDA_RECIPES "If enabled, generate conda recipes instead of building the superbuild. This should not be used by end users." OFF)
# mark_as_advanced(BAESIANBALANCER_GENERATE_CONDA_RECIPES)
