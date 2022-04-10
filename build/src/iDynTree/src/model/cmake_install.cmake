# Install script for directory: /home/dawson/Documents/Repos/os2r-superbuild/src/iDynTree/src/model

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
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libidyntree-model.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libidyntree-model.so")
    file(RPATH_CHECK
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libidyntree-model.so"
         RPATH "\$ORIGIN/:\$ORIGIN/../lib")
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE SHARED_LIBRARY FILES "/home/dawson/Documents/Repos/os2r-superbuild/build/src/iDynTree/lib/libidyntree-model.so")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libidyntree-model.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libidyntree-model.so")
    file(RPATH_CHANGE
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libidyntree-model.so"
         OLD_RPATH "/home/dawson/Documents/Repos/os2r-superbuild/build/src/iDynTree/lib:"
         NEW_RPATH "\$ORIGIN/:\$ORIGIN/../lib")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libidyntree-model.so")
    endif()
  endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xshlibx" OR NOT CMAKE_INSTALL_COMPONENT)
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xruntimex" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/iDynTree/Model" TYPE FILE FILES
    "/home/dawson/Documents/Repos/os2r-superbuild/src/iDynTree/src/model/include/iDynTree/Model/ContactWrench.h"
    "/home/dawson/Documents/Repos/os2r-superbuild/src/iDynTree/src/model/include/iDynTree/Model/DenavitHartenberg.h"
    "/home/dawson/Documents/Repos/os2r-superbuild/src/iDynTree/src/model/include/iDynTree/Model/FixedJoint.h"
    "/home/dawson/Documents/Repos/os2r-superbuild/src/iDynTree/src/model/include/iDynTree/Model/ForwardKinematics.h"
    "/home/dawson/Documents/Repos/os2r-superbuild/src/iDynTree/src/model/include/iDynTree/Model/FreeFloatingState.h"
    "/home/dawson/Documents/Repos/os2r-superbuild/src/iDynTree/src/model/include/iDynTree/Model/FreeFloatingMatrices.h"
    "/home/dawson/Documents/Repos/os2r-superbuild/src/iDynTree/src/model/include/iDynTree/Model/IJoint.h"
    "/home/dawson/Documents/Repos/os2r-superbuild/src/iDynTree/src/model/include/iDynTree/Model/Dynamics.h"
    "/home/dawson/Documents/Repos/os2r-superbuild/src/iDynTree/src/model/include/iDynTree/Model/DynamicsLinearization.h"
    "/home/dawson/Documents/Repos/os2r-superbuild/src/iDynTree/src/model/include/iDynTree/Model/DynamicsLinearizationHelpers.h"
    "/home/dawson/Documents/Repos/os2r-superbuild/src/iDynTree/src/model/include/iDynTree/Model/Indices.h"
    "/home/dawson/Documents/Repos/os2r-superbuild/src/iDynTree/src/model/include/iDynTree/Model/Jacobians.h"
    "/home/dawson/Documents/Repos/os2r-superbuild/src/iDynTree/src/model/include/iDynTree/Model/JointState.h"
    "/home/dawson/Documents/Repos/os2r-superbuild/src/iDynTree/src/model/include/iDynTree/Model/LinkTraversalsCache.h"
    "/home/dawson/Documents/Repos/os2r-superbuild/src/iDynTree/src/model/include/iDynTree/Model/Link.h"
    "/home/dawson/Documents/Repos/os2r-superbuild/src/iDynTree/src/model/include/iDynTree/Model/LinkState.h"
    "/home/dawson/Documents/Repos/os2r-superbuild/src/iDynTree/src/model/include/iDynTree/Model/Model.h"
    "/home/dawson/Documents/Repos/os2r-superbuild/src/iDynTree/src/model/include/iDynTree/Model/ModelTransformers.h"
    "/home/dawson/Documents/Repos/os2r-superbuild/src/iDynTree/src/model/include/iDynTree/Model/MovableJointImpl.h"
    "/home/dawson/Documents/Repos/os2r-superbuild/src/iDynTree/src/model/include/iDynTree/Model/RevoluteJoint.h"
    "/home/dawson/Documents/Repos/os2r-superbuild/src/iDynTree/src/model/include/iDynTree/Model/PrismaticJoint.h"
    "/home/dawson/Documents/Repos/os2r-superbuild/src/iDynTree/src/model/include/iDynTree/Model/SolidShapes.h"
    "/home/dawson/Documents/Repos/os2r-superbuild/src/iDynTree/src/model/include/iDynTree/Model/SubModel.h"
    "/home/dawson/Documents/Repos/os2r-superbuild/src/iDynTree/src/model/include/iDynTree/Model/Traversal.h"
    "/home/dawson/Documents/Repos/os2r-superbuild/src/iDynTree/src/model/include/iDynTree/Model/ModelTestUtils.h"
    "/home/dawson/Documents/Repos/os2r-superbuild/build/src/iDynTree/src/model/ModelExport.h"
    )
endif()

