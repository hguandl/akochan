cmake_minimum_required(VERSION 3.11)
project(Akochan)

list(APPEND CMAKE_MODULE_PATH "${CMAKE_CURRENT_LIST_DIR}/cmake")

include(FetchBoost)
include(FetchOpenMP)

if(${CMAKE_SYSTEM_PROCESSOR} STREQUAL "arm64")
    set (CPU_FLAGS "-mcpu=apple-m1")
else()
    set (CPU_FLAGS "-march=native")
endif()

set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -g -MMD -MP -O3 -pipe ${CPU_FLAGS}")

add_subdirectory(ai_src)

file(GLOB akochan_src "*.cpp")
file(GLOB akochan_share_src "share/*.cpp")

add_executable(system.exe ${akochan_src} ${akochan_share_src})
add_dependencies(system.exe BoostSystem)

target_link_libraries(system.exe ai ${localboost_SOURCE_DIR}/stage/lib/libboost_system.a)
target_include_directories(system.exe PRIVATE ${localboost_SOURCE_DIR} ${localopenmp_BINARY_DIR}/runtime/src)
