# SPDX-FileCopyrightText: 2012-2021 Istituto Italiano di Tecnologia (IIT)
# SPDX-FileCopyrightText: 2000-2014 Kitware Inc.
# SPDX-FileCopyrightText: 2000-2011 Insight Software Consortium
# SPDX-License-Identifier: BSD-3-Clause

# Choose a configuration with which to drive CTest tests.
if(CTEST_CONFIGURATION_TYPE)
  set(CTestTest_CONFIG "${CTEST_CONFIGURATION_TYPE}")
else()
  set(CTestTest_CONFIG "")
endif()

# Choose a configuration that was built if none is given.
if(NOT CTEST_CONFIGURATION_TYPE)
  set(CTEST_CMD "/home/dawson/.local/lib/python3.8/site-packages/cmake/data/bin/ctest")
  get_filename_component(CTEST_DIR "${CTEST_CMD}" DIRECTORY)
  get_filename_component(CTEST_EXE "${CTEST_CMD}" NAME)
  foreach(cfg Release Debug MinSizeRel RelWithDebInfo)
    if(NOT CTEST_CONFIGURATION_TYPE)
      if(EXISTS "${CTEST_DIR}/${cfg}/${CTEST_EXE}")
        set(CTEST_CONFIGURATION_TYPE ${cfg})
      endif()
    endif()
  endforeach()
  if(NOT CTEST_CONFIGURATION_TYPE)
    set(CTEST_CONFIGURATION_TYPE NoConfig)
  endif()
  message("Guessing configuration ${CTEST_CONFIGURATION_TYPE}")
endif()


