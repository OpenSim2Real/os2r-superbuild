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

# Sphinx build command
list(APPEND SPHINX_CMD
    ${SPHINX_MULTIVERSION_EXECUTABLE}
    ${SPHINX_SOURCE} ${SPHINX_BUILD}
    -D breathe_projects.scenario="${SUB_PROJECTS_BUILD_DIR}/scenario_monopod/html/sphinx_build/xml"
    -D breathe_projects.monopod_sdk="${SUB_PROJECTS_BUILD_DIR}/monopod_sdk/html/sphinx_build/xml")

# Generate the website
add_custom_target(sphinx ALL
    DEPENDS gym-ignition scenario_monopod monopod_sdk
    COMMAND ${SPHINX_CMD}
    WORKING_DIRECTORY ${CMAKE_SOURCE_DIR}
    COMMENT "Generating documentation with Sphinx")

# Disable GitHub pages autogeneration
add_custom_command(
    TARGET sphinx POST_BUILD
    COMMAND ${CMAKE_COMMAND} -E touch "${SPHINX_BUILD}/.nojekyll"
    COMMENT "Disabling Jekyll in html folder")

# Handle redirect
add_custom_command(
    TARGET sphinx POST_BUILD
    COMMAND ${CMAKE_COMMAND} -E copy "${CMAKE_CURRENT_SOURCE_DIR}/index.html" "${SPHINX_BUILD}"
    COMMENT "Copying html redirect to html folder")
