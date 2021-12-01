set(YCM_USE_CMAKE_PROPOSED TRUE CACHE BOOL "Use files including unmerged cmake patches")

# YCM options
option(YCM_DISABLE_SYSTEM_PACKAGES "Disable use of all the system installed packages" ON)

# Dependencies options
# ## Matlab related options
# option(BAESIANBALANCER_USES_MATLAB "Enable compilation of software that depend on Matlab and Simulink" FALSE)
# option(BAESIANBALANCER_NOT_USE_SIMULINK "Disable compilation of software that depend on Simulink" FALSE)
#
# ## Other dynamic languages options
# option(BAESIANBALANCER_USES_OCTAVE "Enable compilation of software that depend on Octave" FALSE)
# option(BAESIANBALANCER_USES_LUA "Enable compilation of software that depend on Lua" FALSE)
# mark_as_advanced(BAESIANBALANCER_USES_LUA)

option(BAESIANBALANCER_USES_PYTHON "Enable compilation of software that depend on Python" FALSE)

# ## Enable packages that depend on the Gazebo Classic simulator
# if(WIN32)
#   set(BAESIANBALANCER_USES_GAZEBO_DEFAULT FALSE)
# else()
#   set(BAESIANBALANCER_USES_GAZEBO_DEFAULT TRUE)
# endif()
# option(BAESIANBALANCER_USES_GAZEBO "Enable compilation of software that depends on Gazebo Classic" ${BAESIANBALANCER_USES_GAZEBO_DEFAULT})

# TODO: Maybe include this
# ## Enable packages that depend on the Ignition Gazebo simulator
# set(BAESIANBALANCER_USES_IGNITION_DEFAULT FALSE)
# option(BAESIANBALANCER_USES_IGNITION "Enable compilation of software that depends on Ignition Gazebo" ${BAESIANBALANCER_USES_IGNITION_DEFAULT})

# ## Enable Oculus SDK and Cyberith treadmill options
# option(BAESIANBALANCER_USES_OCULUS_SDK "Enable compilation of software that depend on Oculus SDK" FALSE)
# option(BAESIANBALANCER_USES_CYBERITH_SDK "Enable compilation of software that depend on Cyberith SDK" FALSE)

# Enable/disable different profiles
option(BAESIANBALANCER_ENABLE_CORE "Enable compilation of core software libraries." TRUE)
option(BAESIANBALANCER_ENABLE_SCENARIO "Enable compilation of scenario." FALSE)

# option(BAESIANBALANCER_ENABLE_CORE "Enable compilation of core software libraries." TRUE)
# option(BAESIANBALANCER_ENABLE_ROBOT_TESTING "Enable compilation of software for robot testing." FALSE)
# option(BAESIANBALANCER_ENABLE_DYNAMICS "Enable compilation of software for balancing and walking." FALSE)
# option(BAESIANBALANCER_ENABLE_DYNAMICS_FULL_DEPS "Enable compilation of all the dependencies of bipedal-locomotion-framework." FALSE)
# option(BAESIANBALANCER_ENABLE_TELEOPERATION "Enable compilation of software for teleoperation." FALSE)
# option(BAESIANBALANCER_ENABLE_EVENT_DRIVEN "Enable compilation of software for event-driven." FALSE)
# option(BAESIANBALANCER_ENABLE_ICUB_HEAD "Enable compilation of software necessary on the system running in the head of the iCub robot." FALSE)
# option(BAESIANBALANCER_ENABLE_ICUB_BASIC_DEMOS "Enable compilation of software necessary for iCub basic demonstrations." FALSE)
# option(BAESIANBALANCER_ENABLE_HUMAN_DYNAMICS "Enable compilation of software for human dynamics estimation." FALSE)

# include(CMakeDependentOption)
# cmake_dependent_option(BAESIANBALANCER_USES_CFW2CAN "Enable compilation of software that runs on the head of the iCub and depends on CFW2CAN." FALSE "BAESIANBALANCER_ENABLE_ICUB_HEAD" FALSE)
# cmake_dependent_option(BAESIANBALANCER_USES_ESDCAN "Enable compilation of software that runs on the head of the iCub and depends on ESDCAN." FALSE "BAESIANBALANCER_ENABLE_ICUB_HEAD" FALSE)
# cmake_dependent_option(BAESIANBALANCER_USES_XSENS_MVN_SDK "Enable compilation of software that runs on the wearable producer machine and depends on Xsens MVN SDK." FALSE "BAESIANBALANCER_ENABLE_HUMAN_DYNAMICS" FALSE)

# # Mark as advanced all the profiles that do not have a mantainer
# option(BAESIANBALANCER_ENABLE_GRASPING "Enable compilation of software for grasping." FALSE)
# mark_as_advanced(BAESIANBALANCER_ENABLE_GRASPING)
# option(BAESIANBALANCER_ENABLE_IOL "Enable compilation of software necessary for the Interactive Objects Learning demo." FALSE)
# mark_as_advanced(BAESIANBALANCER_ENABLE_IOL)
# option(BAESIANBALANCER_ENABLE_R1_ROBOT "Enable compilation of software necessary on the pc running on the R1 robot." FALSE)
# mark_as_advanced(BAESIANBALANCER_ENABLE_R1_ROBOT)

#set default build type to "Release" in single-config generators
if(NOT CMAKE_CONFIGURATION_TYPES)
    if(NOT CMAKE_BUILD_TYPE)
    set(CMAKE_BUILD_TYPE "Release" CACHE STRING
        "Choose the type of build, recommanded options are: Debug or Release" FORCE)
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
