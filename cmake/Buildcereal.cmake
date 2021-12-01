include(YCMEPHelper)
include(FindOrBuildPackage)

ycm_ep_helper(cereal TYPE GIT
              STYLE GITHUB
              REPOSITORY USCiLab/cereal
              TAG master
              COMPONENT core
              FOLDER src
              DEPENDS bits)
