# Automatically generated setup file for os2r-superbuild
export OPENSIM2REAL_SUPERBUILD_SOURCE_DIR=/home/dawson/Documents/Repos/os2r-superbuild
export OPENSIM2REAL_SUPERBUILD_INSTALL_PREFIX=/home/dawson/Documents/Repos/os2r-superbuild/build/install
# Extend PATH (see https://en.wikipedia.org/wiki/PATH_(variable) )
export PATH=$PATH:$OPENSIM2REAL_SUPERBUILD_INSTALL_PREFIX/bin

# Extend CMAKE_PREFIX_PATH (see https://cmake.org/cmake/help/v3.8/variable/CMAKE_PREFIX_PATH.html )
export CMAKE_PREFIX_PATH=${CMAKE_PREFIX_PATH:+${CMAKE_PREFIX_PATH}:}${OPENSIM2REAL_SUPERBUILD_INSTALL_PREFIX}
# Extend path for shared libraries  (see http://tldp.org/HOWTO/Program-Library-HOWTO/shared-libraries.html)
export LD_LIBRARY_PATH=${LD_LIBRARY_PATH:+${LD_LIBRARY_PATH}:}${OPENSIM2REAL_SUPERBUILD_INSTALL_PREFIX}/lib

# Extend path for bash completion (see https://github.com/robotology/robotology-superbuild/issues/622#issuecomment-847586406)
export XDG_DATA_DIRS=${XDG_DATA_DIRS:+${XDG_DATA_DIRS}:}$OPENSIM2REAL_SUPERBUILD_INSTALL_PREFIX/share


# Add the python bindings directory to the PYTHON_PATH
export PYTHONPATH=${PYTHONPATH:+${PYTHONPATH}:}${OPENSIM2REAL_SUPERBUILD_INSTALL_PREFIX}/lib/python3.8/site-packages
export PYTHONPATH=${PYTHONPATH:+${PYTHONPATH}:}${OPENSIM2REAL_SUPERBUILD_INSTALL_PREFIX}/lib/python3/dist-packages

