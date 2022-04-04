include(YCMEPHelper)
include(FindOrBuildPackage)

ycm_ep_helper(hardware-documentation TYPE GIT
              STYLE GITHUB
              REPOSITORY OpenSim2Real/hardware_repository
              TAG main
              COMPONENT documentation
              FOLDER src
              CONFIGURE_COMMAND ${CMAKE_COMMAND} -S <SOURCE_DIR> -B <BINARY_DIR>
              BUILD_COMMAND ${CMAKE_COMMAND} --build <BINARY_DIR>
              INSTALL_COMMAND echo ""
            )
