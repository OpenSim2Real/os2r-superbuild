# Install script for directory: /home/dawson/Documents/Repos/os2r-superbuild/src/scenario_monopod/bindings/monopod

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
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/python3.8/site-packages/scenario/bindings/_monopod.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/python3.8/site-packages/scenario/bindings/_monopod.so")
    file(RPATH_CHECK
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/python3.8/site-packages/scenario/bindings/_monopod.so"
         RPATH "/home/dawson/Documents/Repos/os2r-superbuild/build/install/lib:/home/dawson/Documents/Repos/os2r-superbuild/build/install/lib/dynamic_graph_plugins:\$ORIGIN/:\$ORIGIN/../../:\$ORIGIN/../../../../home/dawson/Documents/Repos/os2r-superbuild/build/install/lib:\$ORIGIN/../../../../../../home/dawson/Documents/Repos/os2r-superbuild/build/install/lib:\$ORIGIN/../lib:\$ORIGIN/scenario/plugins:\$ORIGIN/../../../../home/dawson/Documents/Repos/os2r-superbuild/build/install/lib/scenario/plugins:\$ORIGIN/../../../../../../home/dawson/Documents/Repos/os2r-superbuild/build/install/lib/scenario/plugins:\$ORIGIN/../lib/scenario/plugins:\$ORIGIN/../../../../../../../../usr/lib/python3/dist-packages:\$ORIGIN/../../../../../../../../../../usr/lib/python3/dist-packages:\$ORIGIN/../../../../../../../../usr/lib/python3/dist-packages/scenario/bindings:\$ORIGIN/../../../../../../../../../../usr/lib/python3/dist-packages/scenario/bindings:\$ORIGIN/scenario/bindings")
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/python3.8/site-packages/scenario/bindings" TYPE SHARED_LIBRARY FILES "/home/dawson/Documents/Repos/os2r-superbuild/build/src/scenario_monopod/bindings/scenario/bindings/_monopod.so")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/python3.8/site-packages/scenario/bindings/_monopod.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/python3.8/site-packages/scenario/bindings/_monopod.so")
    file(RPATH_CHANGE
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/python3.8/site-packages/scenario/bindings/_monopod.so"
         OLD_RPATH "/home/dawson/Documents/Repos/os2r-superbuild/build/src/scenario_monopod/lib:/home/dawson/Documents/Repos/os2r-superbuild/build/install/lib:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::"
         NEW_RPATH "/home/dawson/Documents/Repos/os2r-superbuild/build/install/lib:/home/dawson/Documents/Repos/os2r-superbuild/build/install/lib/dynamic_graph_plugins:\$ORIGIN/:\$ORIGIN/../../:\$ORIGIN/../../../../home/dawson/Documents/Repos/os2r-superbuild/build/install/lib:\$ORIGIN/../../../../../../home/dawson/Documents/Repos/os2r-superbuild/build/install/lib:\$ORIGIN/../lib:\$ORIGIN/scenario/plugins:\$ORIGIN/../../../../home/dawson/Documents/Repos/os2r-superbuild/build/install/lib/scenario/plugins:\$ORIGIN/../../../../../../home/dawson/Documents/Repos/os2r-superbuild/build/install/lib/scenario/plugins:\$ORIGIN/../lib/scenario/plugins:\$ORIGIN/../../../../../../../../usr/lib/python3/dist-packages:\$ORIGIN/../../../../../../../../../../usr/lib/python3/dist-packages:\$ORIGIN/../../../../../../../../usr/lib/python3/dist-packages/scenario/bindings:\$ORIGIN/../../../../../../../../../../usr/lib/python3/dist-packages/scenario/bindings:\$ORIGIN/scenario/bindings")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/python3.8/site-packages/scenario/bindings/_monopod.so")
    endif()
  endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/python3.8/site-packages/scenario/bindings" TYPE FILE FILES "/home/dawson/Documents/Repos/os2r-superbuild/build/src/scenario_monopod/bindings/monopod/../scenario/bindings/monopod.py")
endif()

