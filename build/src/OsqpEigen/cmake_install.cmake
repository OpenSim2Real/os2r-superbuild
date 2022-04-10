# Install script for directory: /home/dawson/Documents/Repos/os2r-superbuild/src/OsqpEigen

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
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libOsqpEigen.so.0.7.0" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libOsqpEigen.so.0.7.0")
    file(RPATH_CHECK
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libOsqpEigen.so.0.7.0"
         RPATH "$ORIGIN/:$ORIGIN/../lib:/home/dawson/Documents/Repos/os2r-superbuild/build/install/lib")
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE SHARED_LIBRARY FILES "/home/dawson/Documents/Repos/os2r-superbuild/build/src/OsqpEigen/lib/libOsqpEigen.so.0.7.0")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libOsqpEigen.so.0.7.0" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libOsqpEigen.so.0.7.0")
    file(RPATH_CHANGE
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libOsqpEigen.so.0.7.0"
         OLD_RPATH "/home/dawson/Documents/Repos/os2r-superbuild/build/install/lib::::::::::::::::::::::::"
         NEW_RPATH "$ORIGIN/:$ORIGIN/../lib:/home/dawson/Documents/Repos/os2r-superbuild/build/install/lib")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libOsqpEigen.so.0.7.0")
    endif()
  endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xshlibx" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libOsqpEigen.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libOsqpEigen.so")
    file(RPATH_CHECK
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libOsqpEigen.so"
         RPATH "$ORIGIN/:$ORIGIN/../lib:/home/dawson/Documents/Repos/os2r-superbuild/build/install/lib")
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE SHARED_LIBRARY FILES "/home/dawson/Documents/Repos/os2r-superbuild/build/src/OsqpEigen/lib/libOsqpEigen.so")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libOsqpEigen.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libOsqpEigen.so")
    file(RPATH_CHANGE
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libOsqpEigen.so"
         OLD_RPATH "/home/dawson/Documents/Repos/os2r-superbuild/build/install/lib::::::::::::::::::::::::"
         NEW_RPATH "$ORIGIN/:$ORIGIN/../lib:/home/dawson/Documents/Repos/os2r-superbuild/build/install/lib")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libOsqpEigen.so")
    endif()
  endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xruntimex" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/OsqpEigen" TYPE FILE FILES
    "/home/dawson/Documents/Repos/os2r-superbuild/src/OsqpEigen/include/OsqpEigen/OsqpEigen.h"
    "/home/dawson/Documents/Repos/os2r-superbuild/src/OsqpEigen/include/OsqpEigen/Constants.hpp"
    "/home/dawson/Documents/Repos/os2r-superbuild/src/OsqpEigen/include/OsqpEigen/SparseMatrixHelper.hpp"
    "/home/dawson/Documents/Repos/os2r-superbuild/src/OsqpEigen/include/OsqpEigen/SparseMatrixHelper.tpp"
    "/home/dawson/Documents/Repos/os2r-superbuild/src/OsqpEigen/include/OsqpEigen/Data.hpp"
    "/home/dawson/Documents/Repos/os2r-superbuild/src/OsqpEigen/include/OsqpEigen/Data.tpp"
    "/home/dawson/Documents/Repos/os2r-superbuild/src/OsqpEigen/include/OsqpEigen/Settings.hpp"
    "/home/dawson/Documents/Repos/os2r-superbuild/src/OsqpEigen/include/OsqpEigen/Solver.hpp"
    "/home/dawson/Documents/Repos/os2r-superbuild/src/OsqpEigen/include/OsqpEigen/Solver.tpp"
    "/home/dawson/Documents/Repos/os2r-superbuild/src/OsqpEigen/include/OsqpEigen/Debug.hpp"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xOsqpEigenx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/cmake/OsqpEigen" TYPE FILE FILES "/home/dawson/Documents/Repos/os2r-superbuild/build/src/OsqpEigen/OsqpEigenConfigVersion.cmake")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xOsqpEigenx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/cmake/OsqpEigen" TYPE FILE RENAME "OsqpEigenConfig.cmake" FILES "/home/dawson/Documents/Repos/os2r-superbuild/build/src/OsqpEigen/CMakeFiles/OsqpEigenConfig.cmake.install")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xOsqpEigenx" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/OsqpEigen/OsqpEigenTargets.cmake")
    file(DIFFERENT EXPORT_FILE_CHANGED FILES
         "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/OsqpEigen/OsqpEigenTargets.cmake"
         "/home/dawson/Documents/Repos/os2r-superbuild/build/src/OsqpEigen/CMakeFiles/Export/lib/cmake/OsqpEigen/OsqpEigenTargets.cmake")
    if(EXPORT_FILE_CHANGED)
      file(GLOB OLD_CONFIG_FILES "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/OsqpEigen/OsqpEigenTargets-*.cmake")
      if(OLD_CONFIG_FILES)
        message(STATUS "Old export file \"$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/OsqpEigen/OsqpEigenTargets.cmake\" will be replaced.  Removing files [${OLD_CONFIG_FILES}].")
        file(REMOVE ${OLD_CONFIG_FILES})
      endif()
    endif()
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/cmake/OsqpEigen" TYPE FILE FILES "/home/dawson/Documents/Repos/os2r-superbuild/build/src/OsqpEigen/CMakeFiles/Export/lib/cmake/OsqpEigen/OsqpEigenTargets.cmake")
  if("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/cmake/OsqpEigen" TYPE FILE FILES "/home/dawson/Documents/Repos/os2r-superbuild/build/src/OsqpEigen/CMakeFiles/Export/lib/cmake/OsqpEigen/OsqpEigenTargets-release.cmake")
  endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/cmake/osqp-eigen" TYPE FILE FILES "/home/dawson/Documents/Repos/os2r-superbuild/src/OsqpEigen/package.xml")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  include("/home/dawson/Documents/Repos/os2r-superbuild/build/src/OsqpEigen/tests/cmake_install.cmake")

endif()

if(CMAKE_INSTALL_COMPONENT)
  set(CMAKE_INSTALL_MANIFEST "install_manifest_${CMAKE_INSTALL_COMPONENT}.txt")
else()
  set(CMAKE_INSTALL_MANIFEST "install_manifest.txt")
endif()

string(REPLACE ";" "\n" CMAKE_INSTALL_MANIFEST_CONTENT
       "${CMAKE_INSTALL_MANIFEST_FILES}")
file(WRITE "/home/dawson/Documents/Repos/os2r-superbuild/build/src/OsqpEigen/${CMAKE_INSTALL_MANIFEST}"
     "${CMAKE_INSTALL_MANIFEST_CONTENT}")
