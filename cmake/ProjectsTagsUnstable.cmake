macro(set_tag tag_name tag_value)
    if(NOT ${tag_name})
        set(${tag_name} ${tag_value})
    endif()
endmacro()

# External projects
# Machines in Motion
set_tag(mpi_cmake_modules_TAG master) #o80_joss
set_tag(real_time_tools_TAG master)
set_tag(time_series_TAG master)
set_tag(shared_memory_TAG master)
set_tag(signal_handler_TAG master)
# Misc
set_tag(Eigen3_TAG master) #3.4.0
set_tag(pybind11_TAG master) #v2.8.1
set_tag(cereal_TAG master)
set_tag(GTest_TAG main)
# Robotology projects
set_tag(gym-ignition_TAG master) #v1.3.1

# opensim2real Projects
set_tag(scenario_monopod_TAG devel)
set_tag(monopod_sdk_TAG devel)
set_tag(gym-os2r_TAG devel)
set_tag(gym-os2r-real_TAG devel)
set_tag(hardware-documentation_TAG main)
