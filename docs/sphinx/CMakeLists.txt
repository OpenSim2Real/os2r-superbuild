find_package(SphinxApidoc REQUIRED)

# =============
# SPHINX TARGET
# =============
find_package(Sphinx REQUIRED)
find_package(SphinxMultiVersion REQUIRED)

# Extend the Python path including before generating the website
set(SPHINX_CMD export PYTHONPATH="${PYTHONPATHS}:$ENV{PYTHONPATH}" &&)
# set(SPHINX_CMD ${CMAKE_COMMAND} -E env PYTHONPATH="${PYTHONPATHS}:$ENV{PYTHONPATH}")

set(SPHINX_BUILD ${CMAKE_BINARY_DIR}/html)
set(SPHINX_SOURCE ${CMAKE_CURRENT_SOURCE_DIR})

set(SCENARIO_MONOPOD_SPHINX "${SPHINX_SOURCE}/scenario_monopod_docs")
set(MONOPOD_SDK_SPHINX "${SPHINX_SOURCE}/monopod_sdk_docs")

# Copy over each projects doc source
add_custom_target(monopod_sdk_sphinx ALL
    DEPENDS monopod_sdk
    COMMAND ${CMAKE_COMMAND} -E copy_directory "${SUB_PROJECTS_BUILD_DIR}/src/monopod_sdk/html/sphinx_build" ${SPHINX_SOURCE}
    COMMENT "Copying monopod_sdk sphinx build"
  )

add_custom_target(scenario_monopod_sphinx ALL
    DEPENDS scenario_monopod
    COMMAND ${CMAKE_COMMAND} -E copy_directory "${SUB_PROJECTS_BUILD_DIR}/src/scenario_monopod/html/sphinx_build" ${SPHINX_SOURCE}
    COMMENT "Copying scenario_monopod sphinx build"
  )

add_custom_target(gym-os2r_sphinx ALL
    DEPENDS scenario_monopod
    COMMAND ${CMAKE_COMMAND} -E copy_directory "${SUB_PROJECTS_BUILD_DIR}/src/gym-os2r/html/sphinx_build" ${SPHINX_SOURCE}
    COMMENT "Copying gym_os2r sphinx build"
  )

# Sphinx build command
list(APPEND SPHINX_CMD
    ${SPHINX_MULTIVERSION_EXECUTABLE}
    ${SPHINX_SOURCE} ${SPHINX_BUILD}
    -D breathe_projects.scenario="${SCENARIO_MONOPOD_SPHINX}/xml"
    -D breathe_projects.monopod_sdk="${MONOPOD_SDK_SPHINX}/xml"
  )

# Generate the website
add_custom_target(sphinx ALL
    DEPENDS gym-ignition monopod_sdk_sphinx scenario_monopod_sphinx
    COMMAND ${SPHINX_CMD}
    WORKING_DIRECTORY ${CMAKE_SOURCE_DIR}
    COMMENT "Generating documentation with Sphinx"
  )

# Disable GitHub pages autogeneration
add_custom_command(
    TARGET sphinx POST_BUILD
    COMMAND ${CMAKE_COMMAND} -E touch "${SPHINX_BUILD}/.nojekyll"
    COMMENT "Disabling Jekyll in html folder"
  )

# Handle redirect
add_custom_command(
    TARGET sphinx POST_BUILD
    COMMAND ${CMAKE_COMMAND} -E copy "${CMAKE_CURRENT_SOURCE_DIR}/index.html" "${SPHINX_BUILD}"
    COMMENT "Copying html redirect to html folder"
  )

# add_custom_command(TARGET sphinx POST_BUILD
#     COMMAND ${CMAKE_COMMAND} -E remove_directory  ${MONOPOD_SDK_SPHINX}
#     COMMENT "Deleting monopod_sdk sphinx build")
#
# add_custom_command(TARGET sphinx POST_BUILD
#     COMMAND ${CMAKE_COMMAND} -E remove_directory ${SCENARIO_MONOPOD_SPHINX}
#     COMMENT "Deleting scenario_monopod sphinx build")
