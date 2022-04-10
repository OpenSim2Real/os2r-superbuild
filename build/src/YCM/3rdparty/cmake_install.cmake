# Install script for directory: /home/dawson/Documents/Repos/os2r-superbuild/src/YCM/3rdparty

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
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/YCM/3rdparty" TYPE FILE FILES "/home/dawson/Documents/Repos/os2r-superbuild/src/YCM/3rdparty/ovito/cmake/FindQCustomPlot.cmake")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/YCM/3rdparty" TYPE FILE RENAME "COPYING.OVITO" FILES "/home/dawson/Documents/Repos/os2r-superbuild/src/YCM/3rdparty/ovito/LICENSE.txt")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/YCM/3rdparty" TYPE FILE FILES "/home/dawson/Documents/Repos/os2r-superbuild/src/YCM/3rdparty/ovito/README.OVITO")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/YCM/3rdparty" TYPE FILE FILES
    "/home/dawson/Documents/Repos/os2r-superbuild/src/YCM/3rdparty/qt-gstreamer/cmake/modules/FindGLIB2.cmake"
    "/home/dawson/Documents/Repos/os2r-superbuild/src/YCM/3rdparty/qt-gstreamer/cmake/modules/FindGObject.cmake"
    "/home/dawson/Documents/Repos/os2r-superbuild/src/YCM/3rdparty/qt-gstreamer/cmake/modules/FindGStreamer.cmake"
    "/home/dawson/Documents/Repos/os2r-superbuild/src/YCM/3rdparty/qt-gstreamer/cmake/modules/FindGStreamerPluginsBase.cmake"
    "/home/dawson/Documents/Repos/os2r-superbuild/src/YCM/3rdparty/qt-gstreamer/cmake/modules/MacroFindGStreamerLibrary.cmake"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/YCM/3rdparty" TYPE FILE RENAME "COPYING.qt-gstreamer" FILES "/home/dawson/Documents/Repos/os2r-superbuild/src/YCM/3rdparty/qt-gstreamer/cmake/modules/COPYING-CMAKE-SCRIPTS")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/YCM/3rdparty" TYPE FILE FILES "/home/dawson/Documents/Repos/os2r-superbuild/src/YCM/3rdparty/qt-gstreamer/README.qt-gstreamer")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/YCM/3rdparty" TYPE FILE FILES "/home/dawson/Documents/Repos/os2r-superbuild/src/YCM/3rdparty/cmake-wiki/FindOctave.cmake")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/YCM/3rdparty" TYPE FILE FILES "/home/dawson/Documents/Repos/os2r-superbuild/src/YCM/3rdparty/cmake-wiki/COPYING.CMake-wiki")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/YCM/3rdparty" TYPE FILE FILES "/home/dawson/Documents/Repos/os2r-superbuild/src/YCM/3rdparty/cmake-wiki/README.CMake-wiki")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/YCM/3rdparty" TYPE FILE FILES
    "/home/dawson/Documents/Repos/os2r-superbuild/src/YCM/3rdparty/catch2/contrib/Catch.cmake"
    "/home/dawson/Documents/Repos/os2r-superbuild/src/YCM/3rdparty/catch2/contrib/CatchAddTests.cmake"
    "/home/dawson/Documents/Repos/os2r-superbuild/src/YCM/3rdparty/catch2/contrib/ParseAndAddCatchTests.cmake"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/YCM/3rdparty" TYPE FILE RENAME "COPYING.Catch2" FILES "/home/dawson/Documents/Repos/os2r-superbuild/src/YCM/3rdparty/catch2/LICENSE.txt")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/YCM/3rdparty" TYPE FILE FILES "/home/dawson/Documents/Repos/os2r-superbuild/src/YCM/3rdparty/catch2/README.Catch2")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/YCM/3rdparty" TYPE FILE FILES "/home/dawson/Documents/Repos/os2r-superbuild/src/YCM/3rdparty/vtk/CMake/FindFFMPEG.cmake")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/YCM/3rdparty" TYPE FILE RENAME "COPYING.VTK" FILES "/home/dawson/Documents/Repos/os2r-superbuild/src/YCM/3rdparty/vtk/Copyright.txt")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/YCM/3rdparty" TYPE FILE FILES "/home/dawson/Documents/Repos/os2r-superbuild/src/YCM/3rdparty/vtk/README.VTK")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/YCM/3rdparty" TYPE FILE FILES "/home/dawson/Documents/Repos/os2r-superbuild/src/YCM/3rdparty/qgv/FindGraphviz.cmake")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/YCM/3rdparty" TYPE FILE RENAME "COPYING.qgv" FILES "/home/dawson/Documents/Repos/os2r-superbuild/src/YCM/3rdparty/qgv/LICENSE.txt")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/YCM/3rdparty" TYPE FILE FILES "/home/dawson/Documents/Repos/os2r-superbuild/src/YCM/3rdparty/qgv/README.qgv")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/YCM/3rdparty" TYPE FILE FILES "/home/dawson/Documents/Repos/os2r-superbuild/src/YCM/3rdparty/cmrc/CMakeRC.cmake")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/YCM/3rdparty" TYPE FILE RENAME "COPYING.CMakeRC" FILES "/home/dawson/Documents/Repos/os2r-superbuild/src/YCM/3rdparty/cmrc/LICENSE.txt")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/YCM/3rdparty" TYPE FILE FILES "/home/dawson/Documents/Repos/os2r-superbuild/src/YCM/3rdparty/cmrc/README.CMakeRC")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/YCM/3rdparty" TYPE FILE FILES "/home/dawson/Documents/Repos/os2r-superbuild/src/YCM/3rdparty/uselatex/UseLATEX.cmake")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/YCM/3rdparty" TYPE FILE FILES "/home/dawson/Documents/Repos/os2r-superbuild/src/YCM/3rdparty/uselatex/COPYING.UseLATEX")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/YCM/3rdparty" TYPE FILE FILES "/home/dawson/Documents/Repos/os2r-superbuild/src/YCM/3rdparty/uselatex/README.UseLATEX")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/YCM/3rdparty" TYPE FILE FILES "/home/dawson/Documents/Repos/os2r-superbuild/src/YCM/3rdparty/ecm/find-modules/FindUDev.cmake")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/YCM/3rdparty" TYPE FILE RENAME "COPYING.ECM" FILES "/home/dawson/Documents/Repos/os2r-superbuild/src/YCM/3rdparty/ecm/COPYING-CMAKE-SCRIPTS")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/YCM/3rdparty" TYPE FILE FILES "/home/dawson/Documents/Repos/os2r-superbuild/src/YCM/3rdparty/ecm/README.ECM")
endif()

