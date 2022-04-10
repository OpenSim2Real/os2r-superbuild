# Install script for directory: /home/dawson/Documents/Repos/os2r-superbuild/src/YCM/build-modules

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

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/YCM/build-modules" TYPE FILE FILES
    "/home/dawson/Documents/Repos/os2r-superbuild/src/YCM/build-modules/BuildECM.cmake"
    "/home/dawson/Documents/Repos/os2r-superbuild/src/YCM/build-modules/BuildGooCanvas.cmake"
    "/home/dawson/Documents/Repos/os2r-superbuild/src/YCM/build-modules/BuildGooCanvasMM.cmake"
    "/home/dawson/Documents/Repos/os2r-superbuild/src/YCM/build-modules/BuildGtkDatabox.cmake"
    "/home/dawson/Documents/Repos/os2r-superbuild/src/YCM/build-modules/BuildGtkDataboxMM.cmake"
    "/home/dawson/Documents/Repos/os2r-superbuild/src/YCM/build-modules/BuildTinyXML.cmake"
    "/home/dawson/Documents/Repos/os2r-superbuild/src/YCM/build-modules/BuildYARP.cmake"
    "/home/dawson/Documents/Repos/os2r-superbuild/src/YCM/build-modules/BuildICUB.cmake"
    "/home/dawson/Documents/Repos/os2r-superbuild/src/YCM/build-modules/BuildGazeboYARPPlugins.cmake"
    "/home/dawson/Documents/Repos/os2r-superbuild/src/YCM/build-modules/BuildEigen3.cmake"
    "/home/dawson/Documents/Repos/os2r-superbuild/src/YCM/build-modules/BuildqpOASES.cmake"
    )
endif()

