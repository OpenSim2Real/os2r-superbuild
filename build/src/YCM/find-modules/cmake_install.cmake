# Install script for directory: /home/dawson/Documents/Repos/os2r-superbuild/src/YCM/find-modules

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
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/YCM/find-modules" TYPE FILE FILES
    "/home/dawson/Documents/Repos/os2r-superbuild/src/YCM/find-modules/FindACE.cmake"
    "/home/dawson/Documents/Repos/os2r-superbuild/src/YCM/find-modules/Findassimp.cmake"
    "/home/dawson/Documents/Repos/os2r-superbuild/src/YCM/find-modules/FindAtlas.cmake"
    "/home/dawson/Documents/Repos/os2r-superbuild/src/YCM/find-modules/FindCFW2CANAPI.cmake"
    "/home/dawson/Documents/Repos/os2r-superbuild/src/YCM/find-modules/FindDRAGONFLYAPI.cmake"
    "/home/dawson/Documents/Repos/os2r-superbuild/src/YCM/find-modules/FindESDCANAPI.cmake"
    "/home/dawson/Documents/Repos/os2r-superbuild/src/YCM/find-modules/FindFreenect.cmake"
    "/home/dawson/Documents/Repos/os2r-superbuild/src/YCM/find-modules/FindFTDI.cmake"
    "/home/dawson/Documents/Repos/os2r-superbuild/src/YCM/find-modules/FindFuse.cmake"
    "/home/dawson/Documents/Repos/os2r-superbuild/src/YCM/find-modules/FindGLFW3.cmake"
    "/home/dawson/Documents/Repos/os2r-superbuild/src/YCM/find-modules/FindGLM.cmake"
    "/home/dawson/Documents/Repos/os2r-superbuild/src/YCM/find-modules/FindGooCanvas.cmake"
    "/home/dawson/Documents/Repos/os2r-superbuild/src/YCM/find-modules/FindGooCanvasMM.cmake"
    "/home/dawson/Documents/Repos/os2r-superbuild/src/YCM/find-modules/FindGSL.cmake"
    "/home/dawson/Documents/Repos/os2r-superbuild/src/YCM/find-modules/FindGtkDatabox.cmake"
    "/home/dawson/Documents/Repos/os2r-superbuild/src/YCM/find-modules/FindGtkDataboxMM.cmake"
    "/home/dawson/Documents/Repos/os2r-superbuild/src/YCM/find-modules/FindI2C.cmake"
    "/home/dawson/Documents/Repos/os2r-superbuild/src/YCM/find-modules/FindIPOPT.cmake"
    "/home/dawson/Documents/Repos/os2r-superbuild/src/YCM/find-modules/FindIPP.cmake"
    "/home/dawson/Documents/Repos/os2r-superbuild/src/YCM/find-modules/FindLibdc1394.cmake"
    "/home/dawson/Documents/Repos/os2r-superbuild/src/YCM/find-modules/FindLibedit.cmake"
    "/home/dawson/Documents/Repos/os2r-superbuild/src/YCM/find-modules/FindLibOVR.cmake"
    "/home/dawson/Documents/Repos/os2r-superbuild/src/YCM/find-modules/FindLibusb1.cmake"
    "/home/dawson/Documents/Repos/os2r-superbuild/src/YCM/find-modules/FindLibv4l2.cmake"
    "/home/dawson/Documents/Repos/os2r-superbuild/src/YCM/find-modules/FindLibv4lconvert.cmake"
    "/home/dawson/Documents/Repos/os2r-superbuild/src/YCM/find-modules/FindNVIDIACg.cmake"
    "/home/dawson/Documents/Repos/os2r-superbuild/src/YCM/find-modules/FindODE.cmake"
    "/home/dawson/Documents/Repos/os2r-superbuild/src/YCM/find-modules/FindOpenCV.cmake"
    "/home/dawson/Documents/Repos/os2r-superbuild/src/YCM/find-modules/FindOpenGL.cmake"
    "/home/dawson/Documents/Repos/os2r-superbuild/src/YCM/find-modules/FindOpenNI.cmake"
    "/home/dawson/Documents/Repos/os2r-superbuild/src/YCM/find-modules/FindOpenNI2.cmake"
    "/home/dawson/Documents/Repos/os2r-superbuild/src/YCM/find-modules/FindPLXCANAPI.cmake"
    "/home/dawson/Documents/Repos/os2r-superbuild/src/YCM/find-modules/FindPortAudio.cmake"
    "/home/dawson/Documents/Repos/os2r-superbuild/src/YCM/find-modules/FindqpOASES.cmake"
    "/home/dawson/Documents/Repos/os2r-superbuild/src/YCM/find-modules/FindReadline.cmake"
    "/home/dawson/Documents/Repos/os2r-superbuild/src/YCM/find-modules/FindSOXR.cmake"
    "/home/dawson/Documents/Repos/os2r-superbuild/src/YCM/find-modules/FindSQLite.cmake"
    "/home/dawson/Documents/Repos/os2r-superbuild/src/YCM/find-modules/FindStage.cmake"
    "/home/dawson/Documents/Repos/os2r-superbuild/src/YCM/find-modules/FindTinyXML.cmake"
    "/home/dawson/Documents/Repos/os2r-superbuild/src/YCM/find-modules/FindYamlCpp.cmake"
    "/home/dawson/Documents/Repos/os2r-superbuild/src/YCM/find-modules/FindZFP.cmake"
    )
endif()

