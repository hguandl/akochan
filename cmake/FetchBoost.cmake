include(FetchContent)
FetchContent_Declare(
    LocalBoost
    URL      https://boostorg.jfrog.io/artifactory/main/release/1.78.0/source/boost_1_78_0.tar.bz2
    URL_HASH SHA256=8681f175d4bdb26c52222665793eef08490d7758529330f98d3b29dd0735bccc
)
FetchContent_GetProperties(LocalBoost)
if(NOT localboost_POPULATED)
    FetchContent_Populate(LocalBoost)
endif()

add_custom_command(OUTPUT ${localboost_SOURCE_DIR}/project-config.jam
    COMMAND ${localboost_SOURCE_DIR}/bootstrap.sh --with-libraries=system
    COMMAND ${localboost_SOURCE_DIR}/b2 headers
    WORKING_DIRECTORY ${localboost_SOURCE_DIR}
)

add_custom_command(OUTPUT ${localboost_SOURCE_DIR}/stage/lib/libboost_system.a
    COMMAND ${localboost_SOURCE_DIR}/b2 link=static
    WORKING_DIRECTORY ${localboost_SOURCE_DIR}
    DEPENDS ${localboost_SOURCE_DIR}/project-config.jam
)

add_custom_target(BoostSystem
    DEPENDS ${localboost_SOURCE_DIR}/stage/lib/libboost_system.a
)
