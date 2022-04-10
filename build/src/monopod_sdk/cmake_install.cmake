# Install script for directory: /home/dawson/Documents/Repos/os2r-superbuild/src/monopod_sdk

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

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/dawson/Documents/Repos/os2r-superbuild/build/src/monopod_sdk/deps/cmake_install.cmake")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libMonopodSdk.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libMonopodSdk.so")
    file(RPATH_CHECK
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libMonopodSdk.so"
         RPATH "/home/dawson/Documents/Repos/os2r-superbuild/build/install/lib:/home/dawson/Documents/Repos/os2r-superbuild/build/install/lib/dynamic_graph_plugins")
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE SHARED_LIBRARY FILES "/home/dawson/Documents/Repos/os2r-superbuild/build/src/monopod_sdk/lib/libMonopodSdk.so")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libMonopodSdk.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libMonopodSdk.so")
    file(RPATH_CHANGE
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libMonopodSdk.so"
         OLD_RPATH "/home/dawson/Documents/Repos/os2r-superbuild/build/src/monopod_sdk/lib:/home/dawson/Documents/Repos/os2r-superbuild/build/install/lib::::::::::::::"
         NEW_RPATH "/home/dawson/Documents/Repos/os2r-superbuild/build/install/lib:/home/dawson/Documents/Repos/os2r-superbuild/build/install/lib/dynamic_graph_plugins")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libMonopodSdk.so")
    endif()
  endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/monopod_sdk" TYPE FILE FILES
    "/home/dawson/Documents/Repos/os2r-superbuild/src/monopod_sdk/include/monopod_sdk/monopod.hpp"
    "/home/dawson/Documents/Repos/os2r-superbuild/src/monopod_sdk/include/monopod_sdk/common_header.hpp"
    "/home/dawson/Documents/Repos/os2r-superbuild/src/monopod_sdk/include/monopod_sdk/mode.hpp"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/demo_leg_sine_position" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/demo_leg_sine_position")
    file(RPATH_CHECK
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/demo_leg_sine_position"
         RPATH "/home/dawson/Documents/Repos/os2r-superbuild/build/install/lib:/home/dawson/Documents/Repos/os2r-superbuild/build/install/lib/dynamic_graph_plugins")
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE EXECUTABLE FILES "/home/dawson/Documents/Repos/os2r-superbuild/build/src/monopod_sdk/bin/demo_leg_sine_position")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/demo_leg_sine_position" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/demo_leg_sine_position")
    file(RPATH_CHANGE
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/demo_leg_sine_position"
         OLD_RPATH "/home/dawson/Documents/Repos/os2r-superbuild/build/src/monopod_sdk/lib:/home/dawson/Documents/Repos/os2r-superbuild/build/install/lib::::::::::::::"
         NEW_RPATH "/home/dawson/Documents/Repos/os2r-superbuild/build/install/lib:/home/dawson/Documents/Repos/os2r-superbuild/build/install/lib/dynamic_graph_plugins")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/demo_leg_sine_position")
    endif()
  endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/demo_print_sdk" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/demo_print_sdk")
    file(RPATH_CHECK
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/demo_print_sdk"
         RPATH "/home/dawson/Documents/Repos/os2r-superbuild/build/install/lib:/home/dawson/Documents/Repos/os2r-superbuild/build/install/lib/dynamic_graph_plugins")
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE EXECUTABLE FILES "/home/dawson/Documents/Repos/os2r-superbuild/build/src/monopod_sdk/bin/demo_print_sdk")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/demo_print_sdk" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/demo_print_sdk")
    file(RPATH_CHANGE
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/demo_print_sdk"
         OLD_RPATH "/home/dawson/Documents/Repos/os2r-superbuild/build/src/monopod_sdk/lib:/home/dawson/Documents/Repos/os2r-superbuild/build/install/lib::::::::::::::"
         NEW_RPATH "/home/dawson/Documents/Repos/os2r-superbuild/build/install/lib:/home/dawson/Documents/Repos/os2r-superbuild/build/install/lib/dynamic_graph_plugins")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/demo_print_sdk")
    endif()
  endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libMonopodDrivers.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libMonopodDrivers.so")
    file(RPATH_CHECK
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libMonopodDrivers.so"
         RPATH "/home/dawson/Documents/Repos/os2r-superbuild/build/install/lib:/home/dawson/Documents/Repos/os2r-superbuild/build/install/lib/dynamic_graph_plugins")
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE SHARED_LIBRARY FILES "/home/dawson/Documents/Repos/os2r-superbuild/build/src/monopod_sdk/lib/libMonopodDrivers.so")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libMonopodDrivers.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libMonopodDrivers.so")
    file(RPATH_CHANGE
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libMonopodDrivers.so"
         OLD_RPATH "/home/dawson/Documents/Repos/os2r-superbuild/build/src/monopod_sdk/lib:/home/dawson/Documents/Repos/os2r-superbuild/build/install/lib::::::::::::::"
         NEW_RPATH "/home/dawson/Documents/Repos/os2r-superbuild/build/install/lib:/home/dawson/Documents/Repos/os2r-superbuild/build/install/lib/dynamic_graph_plugins")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libMonopodDrivers.so")
    endif()
  endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/monopod_sdk/monopod_drivers" TYPE FILE FILES
    "/home/dawson/Documents/Repos/os2r-superbuild/src/monopod_sdk/include/monopod_sdk/monopod_drivers/leg.hpp"
    "/home/dawson/Documents/Repos/os2r-superbuild/src/monopod_sdk/include/monopod_sdk/monopod_drivers/motor_joint_module.hpp"
    "/home/dawson/Documents/Repos/os2r-superbuild/src/monopod_sdk/include/monopod_sdk/monopod_drivers/encoder_joint_module.hpp"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libutils.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libutils.so")
    file(RPATH_CHECK
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libutils.so"
         RPATH "/home/dawson/Documents/Repos/os2r-superbuild/build/install/lib:/home/dawson/Documents/Repos/os2r-superbuild/build/install/lib/dynamic_graph_plugins")
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE SHARED_LIBRARY FILES "/home/dawson/Documents/Repos/os2r-superbuild/build/src/monopod_sdk/lib/libutils.so")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libutils.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libutils.so")
    file(RPATH_CHANGE
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libutils.so"
         OLD_RPATH "/home/dawson/Documents/Repos/os2r-superbuild/build/install/lib:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::"
         NEW_RPATH "/home/dawson/Documents/Repos/os2r-superbuild/build/install/lib:/home/dawson/Documents/Repos/os2r-superbuild/build/install/lib/dynamic_graph_plugins")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libutils.so")
    endif()
  endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/monopod_sdk/monopod_drivers/utils" TYPE FILE FILES
    "/home/dawson/Documents/Repos/os2r-superbuild/src/monopod_sdk/include/monopod_sdk/monopod_drivers/utils/polynome.hpp"
    "/home/dawson/Documents/Repos/os2r-superbuild/src/monopod_sdk/include/monopod_sdk/monopod_drivers/utils/polynome.hxx"
    "/home/dawson/Documents/Repos/os2r-superbuild/src/monopod_sdk/include/monopod_sdk/monopod_drivers/utils/os_interface.hpp"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libdevices.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libdevices.so")
    file(RPATH_CHECK
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libdevices.so"
         RPATH "/home/dawson/Documents/Repos/os2r-superbuild/build/install/lib:/home/dawson/Documents/Repos/os2r-superbuild/build/install/lib/dynamic_graph_plugins")
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE SHARED_LIBRARY FILES "/home/dawson/Documents/Repos/os2r-superbuild/build/src/monopod_sdk/lib/libdevices.so")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libdevices.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libdevices.so")
    file(RPATH_CHANGE
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libdevices.so"
         OLD_RPATH "/home/dawson/Documents/Repos/os2r-superbuild/build/src/monopod_sdk/lib:/home/dawson/Documents/Repos/os2r-superbuild/build/install/lib::::::::::::::"
         NEW_RPATH "/home/dawson/Documents/Repos/os2r-superbuild/build/install/lib:/home/dawson/Documents/Repos/os2r-superbuild/build/install/lib/dynamic_graph_plugins")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libdevices.so")
    endif()
  endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/monopod_sdk/monopod_drivers/devices" TYPE FILE FILES
    "/home/dawson/Documents/Repos/os2r-superbuild/src/monopod_sdk/include/monopod_sdk/monopod_drivers/devices/device_interface.hpp"
    "/home/dawson/Documents/Repos/os2r-superbuild/src/monopod_sdk/include/monopod_sdk/monopod_drivers/devices/boards.hpp"
    "/home/dawson/Documents/Repos/os2r-superbuild/src/monopod_sdk/include/monopod_sdk/monopod_drivers/devices/can_bus.hpp"
    "/home/dawson/Documents/Repos/os2r-superbuild/src/monopod_sdk/include/monopod_sdk/monopod_drivers/devices/motor.hpp"
    "/home/dawson/Documents/Repos/os2r-superbuild/src/monopod_sdk/include/monopod_sdk/monopod_drivers/devices/encoder.hpp"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xMonopodSdkx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/cmake/MonopodSdk" TYPE FILE FILES "/home/dawson/Documents/Repos/os2r-superbuild/build/src/monopod_sdk/MonopodSdkConfigVersion.cmake")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xMonopodSdkx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/cmake/MonopodSdk" TYPE FILE RENAME "MonopodSdkConfig.cmake" FILES "/home/dawson/Documents/Repos/os2r-superbuild/build/src/monopod_sdk/CMakeFiles/MonopodSdkConfig.cmake.install")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xMonopodSdkx" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/MonopodSdk/MonopodSdkTargets.cmake")
    file(DIFFERENT EXPORT_FILE_CHANGED FILES
         "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/MonopodSdk/MonopodSdkTargets.cmake"
         "/home/dawson/Documents/Repos/os2r-superbuild/build/src/monopod_sdk/CMakeFiles/Export/lib/cmake/MonopodSdk/MonopodSdkTargets.cmake")
    if(EXPORT_FILE_CHANGED)
      file(GLOB OLD_CONFIG_FILES "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/MonopodSdk/MonopodSdkTargets-*.cmake")
      if(OLD_CONFIG_FILES)
        message(STATUS "Old export file \"$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/MonopodSdk/MonopodSdkTargets.cmake\" will be replaced.  Removing files [${OLD_CONFIG_FILES}].")
        file(REMOVE ${OLD_CONFIG_FILES})
      endif()
    endif()
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/cmake/MonopodSdk" TYPE FILE FILES "/home/dawson/Documents/Repos/os2r-superbuild/build/src/monopod_sdk/CMakeFiles/Export/lib/cmake/MonopodSdk/MonopodSdkTargets.cmake")
  if("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/cmake/MonopodSdk" TYPE FILE FILES "/home/dawson/Documents/Repos/os2r-superbuild/build/src/monopod_sdk/CMakeFiles/Export/lib/cmake/MonopodSdk/MonopodSdkTargets-release.cmake")
  endif()
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/dawson/Documents/Repos/os2r-superbuild/build/src/monopod_sdk/docs/cmake_install.cmake")
endif()

if(CMAKE_INSTALL_COMPONENT)
  set(CMAKE_INSTALL_MANIFEST "install_manifest_${CMAKE_INSTALL_COMPONENT}.txt")
else()
  set(CMAKE_INSTALL_MANIFEST "install_manifest.txt")
endif()

string(REPLACE ";" "\n" CMAKE_INSTALL_MANIFEST_CONTENT
       "${CMAKE_INSTALL_MANIFEST_FILES}")
file(WRITE "/home/dawson/Documents/Repos/os2r-superbuild/build/src/monopod_sdk/${CMAKE_INSTALL_MANIFEST}"
     "${CMAKE_INSTALL_MANIFEST_CONTENT}")
