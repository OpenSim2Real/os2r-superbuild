# Install script for directory: /home/dawson/Documents/Repos/os2r-superbuild/src/gym-ignition/scenario/src/gazebo

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/home/dawson/Documents/Repos/os2r-superbuild/build/install")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "Release")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "1")
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

# Set default install directory permissions.
if(NOT DEFINED CMAKE_OBJDUMP)
  set(CMAKE_OBJDUMP "/usr/bin/objdump")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/scenario/gazebo/components" TYPE FILE FILES
    "/home/dawson/Documents/Repos/os2r-superbuild/src/gym-ignition/scenario/src/gazebo/include/scenario/gazebo/components/JointPID.h"
    "/home/dawson/Documents/Repos/os2r-superbuild/src/gym-ignition/scenario/src/gazebo/include/scenario/gazebo/components/SimulatedTime.h"
    "/home/dawson/Documents/Repos/os2r-superbuild/src/gym-ignition/scenario/src/gazebo/include/scenario/gazebo/components/BasePoseTarget.h"
    "/home/dawson/Documents/Repos/os2r-superbuild/src/gym-ignition/scenario/src/gazebo/include/scenario/gazebo/components/BaseWorldVelocityTarget.h"
    "/home/dawson/Documents/Repos/os2r-superbuild/src/gym-ignition/scenario/src/gazebo/include/scenario/gazebo/components/BaseWorldAccelerationTarget.h"
    "/home/dawson/Documents/Repos/os2r-superbuild/src/gym-ignition/scenario/src/gazebo/include/scenario/gazebo/components/JointControlMode.h"
    "/home/dawson/Documents/Repos/os2r-superbuild/src/gym-ignition/scenario/src/gazebo/include/scenario/gazebo/components/JointController.h"
    "/home/dawson/Documents/Repos/os2r-superbuild/src/gym-ignition/scenario/src/gazebo/include/scenario/gazebo/components/JointPositionTarget.h"
    "/home/dawson/Documents/Repos/os2r-superbuild/src/gym-ignition/scenario/src/gazebo/include/scenario/gazebo/components/JointVelocityTarget.h"
    "/home/dawson/Documents/Repos/os2r-superbuild/src/gym-ignition/scenario/src/gazebo/include/scenario/gazebo/components/JointAccelerationTarget.h"
    "/home/dawson/Documents/Repos/os2r-superbuild/src/gym-ignition/scenario/src/gazebo/include/scenario/gazebo/components/HistoryOfAppliedJointForces.h"
    "/home/dawson/Documents/Repos/os2r-superbuild/src/gym-ignition/scenario/src/gazebo/include/scenario/gazebo/components/ExternalWorldWrenchCmdWithDuration.h"
    "/home/dawson/Documents/Repos/os2r-superbuild/src/gym-ignition/scenario/src/gazebo/include/scenario/gazebo/components/Timestamp.h"
    "/home/dawson/Documents/Repos/os2r-superbuild/src/gym-ignition/scenario/src/gazebo/include/scenario/gazebo/components/JointControllerPeriod.h"
    "/home/dawson/Documents/Repos/os2r-superbuild/src/gym-ignition/scenario/src/gazebo/include/scenario/gazebo/components/JointAcceleration.h"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libScenarioGazebo.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libScenarioGazebo.so")
    file(RPATH_CHECK
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libScenarioGazebo.so"
         RPATH "\$ORIGIN/:\$ORIGIN/../../:\$ORIGIN/../../../../home/dawson/Documents/Repos/os2r-superbuild/build/install/lib:\$ORIGIN/../../../../../../home/dawson/Documents/Repos/os2r-superbuild/build/install/lib:\$ORIGIN/../lib:\$ORIGIN/scenario/plugins:\$ORIGIN/../../../../home/dawson/Documents/Repos/os2r-superbuild/build/install/lib/scenario/plugins:\$ORIGIN/../../../../../../home/dawson/Documents/Repos/os2r-superbuild/build/install/lib/scenario/plugins:\$ORIGIN/../lib/scenario/plugins:\$ORIGIN/../../../../../../../../usr/lib/python3/dist-packages:\$ORIGIN/../../../../../../../../../../usr/lib/python3/dist-packages:\$ORIGIN/../../../../../../../../usr/lib/python3/dist-packages/scenario/bindings:\$ORIGIN/../../../../../../../../../../usr/lib/python3/dist-packages/scenario/bindings:\$ORIGIN/scenario/bindings")
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE SHARED_LIBRARY FILES "/home/dawson/Documents/Repos/os2r-superbuild/build/src/gym-ignition/lib/libScenarioGazebo.so")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libScenarioGazebo.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libScenarioGazebo.so")
    file(RPATH_CHANGE
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libScenarioGazebo.so"
         OLD_RPATH "/home/dawson/Documents/Repos/os2r-superbuild/build/src/gym-ignition/lib::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::"
         NEW_RPATH "\$ORIGIN/:\$ORIGIN/../../:\$ORIGIN/../../../../home/dawson/Documents/Repos/os2r-superbuild/build/install/lib:\$ORIGIN/../../../../../../home/dawson/Documents/Repos/os2r-superbuild/build/install/lib:\$ORIGIN/../lib:\$ORIGIN/scenario/plugins:\$ORIGIN/../../../../home/dawson/Documents/Repos/os2r-superbuild/build/install/lib/scenario/plugins:\$ORIGIN/../../../../../../home/dawson/Documents/Repos/os2r-superbuild/build/install/lib/scenario/plugins:\$ORIGIN/../lib/scenario/plugins:\$ORIGIN/../../../../../../../../usr/lib/python3/dist-packages:\$ORIGIN/../../../../../../../../../../usr/lib/python3/dist-packages:\$ORIGIN/../../../../../../../../usr/lib/python3/dist-packages/scenario/bindings:\$ORIGIN/../../../../../../../../../../usr/lib/python3/dist-packages/scenario/bindings:\$ORIGIN/scenario/bindings")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libScenarioGazebo.so")
    endif()
  endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/scenario/gazebo" TYPE FILE FILES
    "/home/dawson/Documents/Repos/os2r-superbuild/src/gym-ignition/scenario/src/gazebo/include/scenario/gazebo/GazeboEntity.h"
    "/home/dawson/Documents/Repos/os2r-superbuild/src/gym-ignition/scenario/src/gazebo/include/scenario/gazebo/World.h"
    "/home/dawson/Documents/Repos/os2r-superbuild/src/gym-ignition/scenario/src/gazebo/include/scenario/gazebo/Model.h"
    "/home/dawson/Documents/Repos/os2r-superbuild/src/gym-ignition/scenario/src/gazebo/include/scenario/gazebo/Joint.h"
    "/home/dawson/Documents/Repos/os2r-superbuild/src/gym-ignition/scenario/src/gazebo/include/scenario/gazebo/Link.h"
    "/home/dawson/Documents/Repos/os2r-superbuild/src/gym-ignition/scenario/src/gazebo/include/scenario/gazebo/Log.h"
    "/home/dawson/Documents/Repos/os2r-superbuild/src/gym-ignition/scenario/src/gazebo/include/scenario/gazebo/utils.h"
    "/home/dawson/Documents/Repos/os2r-superbuild/src/gym-ignition/scenario/src/gazebo/include/scenario/gazebo/helpers.h"
    "/home/dawson/Documents/Repos/os2r-superbuild/src/gym-ignition/scenario/src/gazebo/include/scenario/gazebo/exceptions.h"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libGazeboSimulator.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libGazeboSimulator.so")
    file(RPATH_CHECK
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libGazeboSimulator.so"
         RPATH "\$ORIGIN/:\$ORIGIN/../../:\$ORIGIN/../../../../home/dawson/Documents/Repos/os2r-superbuild/build/install/lib:\$ORIGIN/../../../../../../home/dawson/Documents/Repos/os2r-superbuild/build/install/lib:\$ORIGIN/../lib:\$ORIGIN/scenario/plugins:\$ORIGIN/../../../../home/dawson/Documents/Repos/os2r-superbuild/build/install/lib/scenario/plugins:\$ORIGIN/../../../../../../home/dawson/Documents/Repos/os2r-superbuild/build/install/lib/scenario/plugins:\$ORIGIN/../lib/scenario/plugins:\$ORIGIN/../../../../../../../../usr/lib/python3/dist-packages:\$ORIGIN/../../../../../../../../../../usr/lib/python3/dist-packages:\$ORIGIN/../../../../../../../../usr/lib/python3/dist-packages/scenario/bindings:\$ORIGIN/../../../../../../../../../../usr/lib/python3/dist-packages/scenario/bindings:\$ORIGIN/scenario/bindings")
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE SHARED_LIBRARY FILES "/home/dawson/Documents/Repos/os2r-superbuild/build/src/gym-ignition/lib/libGazeboSimulator.so")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libGazeboSimulator.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libGazeboSimulator.so")
    file(RPATH_CHANGE
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libGazeboSimulator.so"
         OLD_RPATH "/home/dawson/Documents/Repos/os2r-superbuild/build/src/gym-ignition/lib::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::"
         NEW_RPATH "\$ORIGIN/:\$ORIGIN/../../:\$ORIGIN/../../../../home/dawson/Documents/Repos/os2r-superbuild/build/install/lib:\$ORIGIN/../../../../../../home/dawson/Documents/Repos/os2r-superbuild/build/install/lib:\$ORIGIN/../lib:\$ORIGIN/scenario/plugins:\$ORIGIN/../../../../home/dawson/Documents/Repos/os2r-superbuild/build/install/lib/scenario/plugins:\$ORIGIN/../../../../../../home/dawson/Documents/Repos/os2r-superbuild/build/install/lib/scenario/plugins:\$ORIGIN/../lib/scenario/plugins:\$ORIGIN/../../../../../../../../usr/lib/python3/dist-packages:\$ORIGIN/../../../../../../../../../../usr/lib/python3/dist-packages:\$ORIGIN/../../../../../../../../usr/lib/python3/dist-packages/scenario/bindings:\$ORIGIN/../../../../../../../../../../usr/lib/python3/dist-packages/scenario/bindings:\$ORIGIN/scenario/bindings")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libGazeboSimulator.so")
    endif()
  endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/scenario/gazebo" TYPE FILE FILES "/home/dawson/Documents/Repos/os2r-superbuild/src/gym-ignition/scenario/src/gazebo/include/scenario/gazebo/GazeboSimulator.h")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xGazebox" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/cmake/ScenarioGazebo" TYPE FILE FILES "/home/dawson/Documents/Repos/os2r-superbuild/build/src/gym-ignition/ScenarioGazeboConfigVersion.cmake")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xGazebox" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/cmake/ScenarioGazebo" TYPE FILE RENAME "ScenarioGazeboConfig.cmake" FILES "/home/dawson/Documents/Repos/os2r-superbuild/build/src/gym-ignition/scenario/src/gazebo/CMakeFiles/ScenarioGazeboConfig.cmake.install")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xGazebox" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/ScenarioGazebo/ScenarioGazeboTargets.cmake")
    file(DIFFERENT EXPORT_FILE_CHANGED FILES
         "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/ScenarioGazebo/ScenarioGazeboTargets.cmake"
         "/home/dawson/Documents/Repos/os2r-superbuild/build/src/gym-ignition/scenario/src/gazebo/CMakeFiles/Export/lib/cmake/ScenarioGazebo/ScenarioGazeboTargets.cmake")
    if(EXPORT_FILE_CHANGED)
      file(GLOB OLD_CONFIG_FILES "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/ScenarioGazebo/ScenarioGazeboTargets-*.cmake")
      if(OLD_CONFIG_FILES)
        message(STATUS "Old export file \"$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/ScenarioGazebo/ScenarioGazeboTargets.cmake\" will be replaced.  Removing files [${OLD_CONFIG_FILES}].")
        file(REMOVE ${OLD_CONFIG_FILES})
      endif()
    endif()
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/cmake/ScenarioGazebo" TYPE FILE FILES "/home/dawson/Documents/Repos/os2r-superbuild/build/src/gym-ignition/scenario/src/gazebo/CMakeFiles/Export/lib/cmake/ScenarioGazebo/ScenarioGazeboTargets.cmake")
  if("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/cmake/ScenarioGazebo" TYPE FILE FILES "/home/dawson/Documents/Repos/os2r-superbuild/build/src/gym-ignition/scenario/src/gazebo/CMakeFiles/Export/lib/cmake/ScenarioGazebo/ScenarioGazeboTargets-release.cmake")
  endif()
endif()

