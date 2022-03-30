# Install script for directory: /home/dawson/Documents/Repos/os2r-superbuild/src/iDynTree/src/optimalcontrol

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
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libidyntree-optimalcontrol.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libidyntree-optimalcontrol.so")
    file(RPATH_CHECK
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libidyntree-optimalcontrol.so"
         RPATH "\$ORIGIN/:\$ORIGIN/../lib:/home/dawson/Documents/Repos/os2r-superbuild/build/install/lib")
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE SHARED_LIBRARY FILES "/home/dawson/Documents/Repos/os2r-superbuild/build/src/iDynTree/lib/libidyntree-optimalcontrol.so")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libidyntree-optimalcontrol.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libidyntree-optimalcontrol.so")
    file(RPATH_CHANGE
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libidyntree-optimalcontrol.so"
         OLD_RPATH "/home/dawson/Documents/Repos/os2r-superbuild/build/src/iDynTree/lib:/home/dawson/Documents/Repos/os2r-superbuild/build/install/lib:"
         NEW_RPATH "\$ORIGIN/:\$ORIGIN/../lib:/home/dawson/Documents/Repos/os2r-superbuild/build/install/lib")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libidyntree-optimalcontrol.so")
    endif()
  endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xshlibx" OR NOT CMAKE_INSTALL_COMPONENT)
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xruntimex" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/iDynTree" TYPE FILE FILES
    "/home/dawson/Documents/Repos/os2r-superbuild/src/iDynTree/src/optimalcontrol/include/iDynTree/OptimalControl.h"
    "/home/dawson/Documents/Repos/os2r-superbuild/src/iDynTree/src/optimalcontrol/include/iDynTree/DynamicalSystem.h"
    "/home/dawson/Documents/Repos/os2r-superbuild/src/iDynTree/src/optimalcontrol/include/iDynTree/ControlledDynamicalSystem.h"
    "/home/dawson/Documents/Repos/os2r-superbuild/src/iDynTree/src/optimalcontrol/include/iDynTree/LinearSystem.h"
    "/home/dawson/Documents/Repos/os2r-superbuild/src/iDynTree/src/optimalcontrol/include/iDynTree/MultiBodySystem.h"
    "/home/dawson/Documents/Repos/os2r-superbuild/src/iDynTree/src/optimalcontrol/include/iDynTree/Integrator.h"
    "/home/dawson/Documents/Repos/os2r-superbuild/src/iDynTree/src/optimalcontrol/include/iDynTree/LinearMPC.h"
    "/home/dawson/Documents/Repos/os2r-superbuild/src/iDynTree/src/optimalcontrol/include/iDynTree/MPC.h"
    "/home/dawson/Documents/Repos/os2r-superbuild/src/iDynTree/src/optimalcontrol/include/iDynTree/OptimalControlProblem.h"
    "/home/dawson/Documents/Repos/os2r-superbuild/src/iDynTree/src/optimalcontrol/include/iDynTree/OptimalControlSolver.h"
    "/home/dawson/Documents/Repos/os2r-superbuild/src/iDynTree/src/optimalcontrol/include/iDynTree/SystemLineariser.h"
    "/home/dawson/Documents/Repos/os2r-superbuild/src/iDynTree/src/optimalcontrol/include/iDynTree/Cost.h"
    "/home/dawson/Documents/Repos/os2r-superbuild/src/iDynTree/src/optimalcontrol/include/iDynTree/Constraint.h"
    "/home/dawson/Documents/Repos/os2r-superbuild/src/iDynTree/src/optimalcontrol/include/iDynTree/QuadraticLikeCost.h"
    "/home/dawson/Documents/Repos/os2r-superbuild/src/iDynTree/src/optimalcontrol/include/iDynTree/QuadraticCost.h"
    "/home/dawson/Documents/Repos/os2r-superbuild/src/iDynTree/src/optimalcontrol/include/iDynTree/L2NormCost.h"
    "/home/dawson/Documents/Repos/os2r-superbuild/src/iDynTree/src/optimalcontrol/include/iDynTree/LinearConstraint.h"
    "/home/dawson/Documents/Repos/os2r-superbuild/src/iDynTree/src/optimalcontrol/include/iDynTree/LinearCost.h"
    "/home/dawson/Documents/Repos/os2r-superbuild/src/iDynTree/src/optimalcontrol/include/iDynTree/Controller.h"
    "/home/dawson/Documents/Repos/os2r-superbuild/src/iDynTree/src/optimalcontrol/include/iDynTree/TimeRange.h"
    "/home/dawson/Documents/Repos/os2r-superbuild/src/iDynTree/src/optimalcontrol/include/iDynTree/ConstraintsGroup.h"
    "/home/dawson/Documents/Repos/os2r-superbuild/src/iDynTree/src/optimalcontrol/include/iDynTree/OptimizationProblem.h"
    "/home/dawson/Documents/Repos/os2r-superbuild/src/iDynTree/src/optimalcontrol/include/iDynTree/Optimizer.h"
    "/home/dawson/Documents/Repos/os2r-superbuild/src/iDynTree/src/optimalcontrol/include/iDynTree/TimeVaryingObject.h"
    "/home/dawson/Documents/Repos/os2r-superbuild/src/iDynTree/src/optimalcontrol/include/iDynTree/SparsityStructure.h"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/iDynTree/Integrators" TYPE FILE FILES
    "/home/dawson/Documents/Repos/os2r-superbuild/src/iDynTree/src/optimalcontrol/include/iDynTree/Integrators/FixedStepIntegrator.h"
    "/home/dawson/Documents/Repos/os2r-superbuild/src/iDynTree/src/optimalcontrol/include/iDynTree/Integrators/RK4.h"
    "/home/dawson/Documents/Repos/os2r-superbuild/src/iDynTree/src/optimalcontrol/include/iDynTree/Integrators/ImplicitTrapezoidal.h"
    "/home/dawson/Documents/Repos/os2r-superbuild/src/iDynTree/src/optimalcontrol/include/iDynTree/Integrators/ForwardEuler.h"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/iDynTree/Optimizers" TYPE FILE FILES
    "/home/dawson/Documents/Repos/os2r-superbuild/src/iDynTree/src/optimalcontrol/include/iDynTree/Optimizers/IpoptInterface.h"
    "/home/dawson/Documents/Repos/os2r-superbuild/src/iDynTree/src/optimalcontrol/include/iDynTree/Optimizers/OsqpInterface.h"
    "/home/dawson/Documents/Repos/os2r-superbuild/src/iDynTree/src/optimalcontrol/include/iDynTree/Optimizers/AlglibInterface.h"
    "/home/dawson/Documents/Repos/os2r-superbuild/src/iDynTree/src/optimalcontrol/include/iDynTree/Optimizers/WorhpInterface.h"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/iDynTree/OCSolvers" TYPE FILE FILES "/home/dawson/Documents/Repos/os2r-superbuild/src/iDynTree/src/optimalcontrol/include/iDynTree/OCSolvers/MultipleShootingSolver.h")
endif()

