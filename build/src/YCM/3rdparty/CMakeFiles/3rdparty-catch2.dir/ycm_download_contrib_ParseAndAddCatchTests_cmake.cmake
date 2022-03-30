cmake_minimum_required(VERSION 3.22.1)
set(_attempt 0)
set(_succeeded 0)
set(_retries 3)
while(${_attempt} LESS ${_retries} AND NOT ${_succeeded})
  math(EXPR _attempt "${_attempt}+1")
  execute_process(COMMAND "/home/dawson/.local/lib/python3.8/site-packages/cmake/data/bin/cmake" -P "/home/dawson/Documents/Repos/os2r-superbuild/build/src/YCM/3rdparty/CMakeFiles/3rdparty-catch2.dir/ycm_download_contrib_ParseAndAddCatchTests_cmake_real.cmake"
                  WORKING_DIRECTORY "/home/dawson/Documents/Repos/os2r-superbuild/src/YCM/3rdparty"
                  RESULT_VARIABLE _res_var
                  ERROR_VARIABLE _error_var
                  ERROR_STRIP_TRAILING_WHITESPACE)
  if(_res_var)
    if(${_attempt} EQUAL ${_retries})
      set(_msgtype FATAL_ERROR)
    else()
      set(_msgtype STATUS)
    endif()
    file(REMOVE "/home/dawson/Documents/Repos/os2r-superbuild/build/src/YCM/3rdparty/CMakeFiles/3rdparty-catch2.dir/downloads/contrib/ParseAndAddCatchTests.cmake")
    if(_error_var MATCHES "da39a3ee5e6b4b0d3255bfef95601890afd80709")
      # This is the sha1sum of an empty file. This usually means there was a
      # network problem, but the default message is misleading.
      # We print a different error instead.
      set(_error_message "  Network problem or not existing file.\n  ${_error_var}")
    else()
      set(_error_message "${_error_var}")
    endif()
    if(NOT ${_attempt} EQUAL ${_retries})
      message(STATUS "Cannot download file https://raw.githubusercontent.com/catchorg/Catch2/v2.13.4/contrib/ParseAndAddCatchTests.cmake\n${_error_message}.\n  Retrying.\n")
    else()
      message(FATAL_ERROR "Cannot download file https://raw.githubusercontent.com/catchorg/Catch2/v2.13.4/contrib/ParseAndAddCatchTests.cmake\n${_error_message}")
    endif()
  else()
    set(_succeeded 1)
  endif()
endwhile()
execute_process(COMMAND "/home/dawson/.local/lib/python3.8/site-packages/cmake/data/bin/cmake" -E copy_if_different "/home/dawson/Documents/Repos/os2r-superbuild/build/src/YCM/3rdparty/CMakeFiles/3rdparty-catch2.dir/downloads/contrib/ParseAndAddCatchTests.cmake" "/home/dawson/Documents/Repos/os2r-superbuild/build/src/YCM/3rdparty/catch2/contrib/ParseAndAddCatchTests.cmake")
