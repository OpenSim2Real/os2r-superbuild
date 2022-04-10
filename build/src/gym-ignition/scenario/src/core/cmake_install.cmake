# Install script for directory: /home/dawson/Documents/Repos/os2r-superbuild/src/gym-ignition/scenario/src/core

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
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/scenario/core" TYPE FILE FILES
    "/home/dawson/Documents/Repos/os2r-superbuild/src/gym-ignition/scenario/src/core/include/scenario/core/World.h"
    "/home/dawson/Documents/Repos/os2r-superbuild/src/gym-ignition/scenario/src/core/include/scenario/core/Model.h"
    "/home/dawson/Documents/Repos/os2r-superbuild/src/gym-ignition/scenario/src/core/include/scenario/core/Joint.h"
    "/home/dawson/Documents/Repos/os2r-superbuild/src/gym-ignition/scenario/src/core/include/scenario/core/Link.h"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libCoreUtils.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libCoreUtils.so")
    file(RPATH_CHECK
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libCoreUtils.so"
         RPATH "\$ORIGIN/:\$ORIGIN/../../:\$ORIGIN/../../../../home/dawson/Documents/Repos/os2r-superbuild/build/install/lib:\$ORIGIN/../../../../../../home/dawson/Documents/Repos/os2r-superbuild/build/install/lib:\$ORIGIN/../lib:\$ORIGIN/scenario/plugins:\$ORIGIN/../../../../home/dawson/Documents/Repos/os2r-superbuild/build/install/lib/scenario/plugins:\$ORIGIN/../../../../../../home/dawson/Documents/Repos/os2r-superbuild/build/install/lib/scenario/plugins:\$ORIGIN/../lib/scenario/plugins:\$ORIGIN/../../../../../../../../usr/lib/python3/dist-packages:\$ORIGIN/../../../../../../../../../../usr/lib/python3/dist-packages:\$ORIGIN/../../../../../../../../usr/lib/python3/dist-packages/scenario/bindings:\$ORIGIN/../../../../../../../../../../usr/lib/python3/dist-packages/scenario/bindings:\$ORIGIN/scenario/bindings")
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE SHARED_LIBRARY FILES "/home/dawson/Documents/Repos/os2r-superbuild/build/src/gym-ignition/lib/libCoreUtils.so")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libCoreUtils.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libCoreUtils.so")
    file(RPATH_CHANGE
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libCoreUtils.so"
         OLD_RPATH ":::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::"
         NEW_RPATH "\$ORIGIN/:\$ORIGIN/../../:\$ORIGIN/../../../../home/dawson/Documents/Repos/os2r-superbuild/build/install/lib:\$ORIGIN/../../../../../../home/dawson/Documents/Repos/os2r-superbuild/build/install/lib:\$ORIGIN/../lib:\$ORIGIN/scenario/plugins:\$ORIGIN/../../../../home/dawson/Documents/Repos/os2r-superbuild/build/install/lib/scenario/plugins:\$ORIGIN/../../../../../../home/dawson/Documents/Repos/os2r-superbuild/build/install/lib/scenario/plugins:\$ORIGIN/../lib/scenario/plugins:\$ORIGIN/../../../../../../../../usr/lib/python3/dist-packages:\$ORIGIN/../../../../../../../../../../usr/lib/python3/dist-packages:\$ORIGIN/../../../../../../../../usr/lib/python3/dist-packages/scenario/bindings:\$ORIGIN/../../../../../../../../../../usr/lib/python3/dist-packages/scenario/bindings:\$ORIGIN/scenario/bindings")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libCoreUtils.so")
    endif()
  endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/scenario/core/utils" TYPE FILE FILES
    "/home/dawson/Documents/Repos/os2r-superbuild/src/gym-ignition/scenario/src/core/include/scenario/core/utils/Log.h"
    "/home/dawson/Documents/Repos/os2r-superbuild/src/gym-ignition/scenario/src/core/include/scenario/core/utils/signals.h"
    "/home/dawson/Documents/Repos/os2r-superbuild/src/gym-ignition/scenario/src/core/include/scenario/core/utils/utils.h"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xCorex" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/cmake/ScenarioCore" TYPE FILE FILES "/home/dawson/Documents/Repos/os2r-superbuild/build/src/gym-ignition/ScenarioCoreConfigVersion.cmake")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xCorex" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/cmake/ScenarioCore" TYPE FILE RENAME "ScenarioCoreConfig.cmake" FILES "/home/dawson/Documents/Repos/os2r-superbuild/build/src/gym-ignition/scenario/src/core/CMakeFiles/ScenarioCoreConfig.cmake.install")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xCorex" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/ScenarioCore/ScenarioCoreTargets.cmake")
    file(DIFFERENT EXPORT_FILE_CHANGED FILES
         "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/ScenarioCore/ScenarioCoreTargets.cmake"
         "/home/dawson/Documents/Repos/os2r-superbuild/build/src/gym-ignition/scenario/src/core/CMakeFiles/Export/lib/cmake/ScenarioCore/ScenarioCoreTargets.cmake")
    if(EXPORT_FILE_CHANGED)
      file(GLOB OLD_CONFIG_FILES "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/ScenarioCore/ScenarioCoreTargets-*.cmake")
      if(OLD_CONFIG_FILES)
        message(STATUS "Old export file \"$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/ScenarioCore/ScenarioCoreTargets.cmake\" will be replaced.  Removing files [${OLD_CONFIG_FILES}].")
        file(REMOVE ${OLD_CONFIG_FILES})
      endif()
    endif()
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/cmake/ScenarioCore" TYPE FILE FILES "/home/dawson/Documents/Repos/os2r-superbuild/build/src/gym-ignition/scenario/src/core/CMakeFiles/Export/lib/cmake/ScenarioCore/ScenarioCoreTargets.cmake")
  if("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/cmake/ScenarioCore" TYPE FILE FILES "/home/dawson/Documents/Repos/os2r-superbuild/build/src/gym-ignition/scenario/src/core/CMakeFiles/Export/lib/cmake/ScenarioCore/ScenarioCoreTargets-release.cmake")
  endif()
endif()

