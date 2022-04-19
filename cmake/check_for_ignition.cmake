include(FindIgnitionDistribution)
set(SUPPORTED_IGNITION_DISTRIBUTIONS
    "Fortress"
    "Edifice"
    "Dome"
    "Citadel")

foreach(distribution IN LISTS SUPPORTED_IGNITION_DISTRIBUTIONS)

    find_ignition_distribution(
        CODENAME ${distribution}
        PACKAGES
        ignition-gazebo
        REQUIRED FALSE)

    if(${${distribution}_FOUND})
        message(STATUS "Found Ignition ${distribution}")

        # Select Ignition distribution
        set(IGNITION_DISTRIBUTION "${distribution}" CACHE
            STRING "The Ignition distribution found in the system")
        set_property(CACHE IGNITION_DISTRIBUTION PROPERTY
            STRINGS ${SUPPORTED_IGNITION_DISTRIBUTIONS})

        break()
    endif()

endforeach()

if(NOT IGNITION_DISTRIBUTION OR "${IGNITION_DISTRIBUTION}" STREQUAL "")
    message(FATAL_ERROR "Simulator is enabled without any ignition distribution installed. Please install ignition distribution or change installation type to not include simulator.")
endif()
