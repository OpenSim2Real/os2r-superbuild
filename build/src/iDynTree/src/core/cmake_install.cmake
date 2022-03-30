# Install script for directory: /home/dawson/Documents/Repos/os2r-superbuild/src/iDynTree/src/core

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

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xshlibx" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libidyntree-core.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libidyntree-core.so")
    file(RPATH_CHECK
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libidyntree-core.so"
         RPATH "\$ORIGIN/:\$ORIGIN/../lib")
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE SHARED_LIBRARY FILES "/home/dawson/Documents/Repos/os2r-superbuild/build/src/iDynTree/lib/libidyntree-core.so")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libidyntree-core.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libidyntree-core.so")
    file(RPATH_CHANGE
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libidyntree-core.so"
         OLD_RPATH ":::::::::::::::::::::::"
         NEW_RPATH "\$ORIGIN/:\$ORIGIN/../lib")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libidyntree-core.so")
    endif()
  endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xshlibx" OR NOT CMAKE_INSTALL_COMPONENT)
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xruntimex" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/iDynTree/Core" TYPE FILE FILES
    "/home/dawson/Documents/Repos/os2r-superbuild/src/iDynTree/src/core/include/iDynTree/Core/Axis.h"
    "/home/dawson/Documents/Repos/os2r-superbuild/src/iDynTree/src/core/include/iDynTree/Core/ArticulatedBodyInertia.h"
    "/home/dawson/Documents/Repos/os2r-superbuild/src/iDynTree/src/core/include/iDynTree/Core/ClassicalAcc.h"
    "/home/dawson/Documents/Repos/os2r-superbuild/src/iDynTree/src/core/include/iDynTree/Core/Direction.h"
    "/home/dawson/Documents/Repos/os2r-superbuild/src/iDynTree/src/core/include/iDynTree/Core/EigenSparseHelpers.h"
    "/home/dawson/Documents/Repos/os2r-superbuild/src/iDynTree/src/core/include/iDynTree/Core/EigenMathHelpers.h"
    "/home/dawson/Documents/Repos/os2r-superbuild/src/iDynTree/src/core/include/iDynTree/Core/EigenHelpers.h"
    "/home/dawson/Documents/Repos/os2r-superbuild/src/iDynTree/src/core/include/iDynTree/Core/InertiaNonLinearParametrization.h"
    "/home/dawson/Documents/Repos/os2r-superbuild/src/iDynTree/src/core/include/iDynTree/Core/MatrixDynSize.h"
    "/home/dawson/Documents/Repos/os2r-superbuild/src/iDynTree/src/core/include/iDynTree/Core/MatrixFixSize.h"
    "/home/dawson/Documents/Repos/os2r-superbuild/src/iDynTree/src/core/include/iDynTree/Core/Position.h"
    "/home/dawson/Documents/Repos/os2r-superbuild/src/iDynTree/src/core/include/iDynTree/Core/PositionRaw.h"
    "/home/dawson/Documents/Repos/os2r-superbuild/src/iDynTree/src/core/include/iDynTree/Core/Rotation.h"
    "/home/dawson/Documents/Repos/os2r-superbuild/src/iDynTree/src/core/include/iDynTree/Core/RotationRaw.h"
    "/home/dawson/Documents/Repos/os2r-superbuild/src/iDynTree/src/core/include/iDynTree/Core/RotationalInertiaRaw.h"
    "/home/dawson/Documents/Repos/os2r-superbuild/src/iDynTree/src/core/include/iDynTree/Core/SpatialAcc.h"
    "/home/dawson/Documents/Repos/os2r-superbuild/src/iDynTree/src/core/include/iDynTree/Core/SpatialForceVector.h"
    "/home/dawson/Documents/Repos/os2r-superbuild/src/iDynTree/src/core/include/iDynTree/Core/SpatialInertiaRaw.h"
    "/home/dawson/Documents/Repos/os2r-superbuild/src/iDynTree/src/core/include/iDynTree/Core/SpatialInertia.h"
    "/home/dawson/Documents/Repos/os2r-superbuild/src/iDynTree/src/core/include/iDynTree/Core/SpatialMomentum.h"
    "/home/dawson/Documents/Repos/os2r-superbuild/src/iDynTree/src/core/include/iDynTree/Core/SpatialMotionVector.h"
    "/home/dawson/Documents/Repos/os2r-superbuild/src/iDynTree/src/core/include/iDynTree/Core/TestUtils.h"
    "/home/dawson/Documents/Repos/os2r-superbuild/src/iDynTree/src/core/include/iDynTree/Core/Transform.h"
    "/home/dawson/Documents/Repos/os2r-superbuild/src/iDynTree/src/core/include/iDynTree/Core/TransformDerivative.h"
    "/home/dawson/Documents/Repos/os2r-superbuild/src/iDynTree/src/core/include/iDynTree/Core/Twist.h"
    "/home/dawson/Documents/Repos/os2r-superbuild/src/iDynTree/src/core/include/iDynTree/Core/Utils.h"
    "/home/dawson/Documents/Repos/os2r-superbuild/src/iDynTree/src/core/include/iDynTree/Core/VectorFixSize.h"
    "/home/dawson/Documents/Repos/os2r-superbuild/src/iDynTree/src/core/include/iDynTree/Core/VectorDynSize.h"
    "/home/dawson/Documents/Repos/os2r-superbuild/src/iDynTree/src/core/include/iDynTree/Core/Wrench.h"
    "/home/dawson/Documents/Repos/os2r-superbuild/src/iDynTree/src/core/include/iDynTree/Core/PrivateUtils.h"
    "/home/dawson/Documents/Repos/os2r-superbuild/src/iDynTree/src/core/include/iDynTree/Core/PrivatePreProcessorUtils.h"
    "/home/dawson/Documents/Repos/os2r-superbuild/src/iDynTree/src/core/include/iDynTree/Core/GeomVector3.h"
    "/home/dawson/Documents/Repos/os2r-superbuild/src/iDynTree/src/core/include/iDynTree/Core/SpatialVector.h"
    "/home/dawson/Documents/Repos/os2r-superbuild/src/iDynTree/src/core/include/iDynTree/Core/SparseMatrix.h"
    "/home/dawson/Documents/Repos/os2r-superbuild/src/iDynTree/src/core/include/iDynTree/Core/Triplets.h"
    "/home/dawson/Documents/Repos/os2r-superbuild/src/iDynTree/src/core/include/iDynTree/Core/CubicSpline.h"
    "/home/dawson/Documents/Repos/os2r-superbuild/src/iDynTree/src/core/include/iDynTree/Core/Span.h"
    "/home/dawson/Documents/Repos/os2r-superbuild/src/iDynTree/src/core/include/iDynTree/Core/SO3Utils.h"
    "/home/dawson/Documents/Repos/os2r-superbuild/src/iDynTree/src/core/include/iDynTree/Core/MatrixView.h"
    "/home/dawson/Documents/Repos/os2r-superbuild/build/src/iDynTree/src/core/CoreExport.h"
    )
endif()

