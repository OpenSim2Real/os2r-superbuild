macro(set_tag tag_name tag_value)
    if(NOT ${tag_name})
        set(${tag_name} ${tag_value})
    endif()
endmacro()

# External projects
# Machines in Motion
set_tag(mpi_cmake_modules_TAG o80_joss) #o80_joss
set_tag(real_time_tools_TAG o80_joss)
set_tag(time_series_TAG o80_joss)
set_tag(shared_memory_TAG o80_joss)
set_tag(signal_handler_TAG o80_joss)

# Misc
# set_tag(Eigen3_TAG master) #3.4.0
# set_tag(pybind11_TAG master) #v2.8.1
# set_tag(cereal_TAG master)
set_tag(GTest_TAG main)

# Robotology projects
set_tag(gym-ignition_TAG v1.3.1) #v1.3.1

# opensim2real Projects
set_tag(scenario_monopod_TAG main)
set_tag(monopod_sdk_TAG main)
set_tag(gym-os2r_TAG main)
set_tag(gym-os2r-real_TAG main)
