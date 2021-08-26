cmake_minimum_required(VERSION 3.10)

project(cmake_project_template)

if(NOT CMAKE_BUILD_TYPE)
	message(STATUS "Setting build type to Release, for debug builds use '-DCMAKE_BUILD_TYPE=Debug'.")
	set(CMAKE_BUILD_TYPE "Release")
endif()

set(CMAKE_POSITION_INDEPENDENT_CODE ON)
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)
set(CMAKE_MODULE_PATH "${CMAKE_SOURCE_DIR}/cmake/module")
set(THIRD_PARTY_SOURCE_DIR "${CMAKE_SOURCE_DIR}/third_party")

set(FETCHCONTENT_QUIET OFF CACHE BOOL "" FORCE)

set(PROJECT_INCLUDE_DIR ${CMAKE_CURRENT_SOURCE_DIR}/include)
set(PROJECT_SRC_DIR ${CMAKE_CURRENT_SOURCE_DIR}/src)
set(PROJECT_CMD_DIR ${CMAKE_CURRENT_SOURCE_DIR}/cmd)
set(PROJECT_TEST_DIR ${CMAKE_CURRENT_SOURCE_DIR}/test)
set(PROJECT_BENCHMARK_DIR ${CMAKE_CURRENT_SOURCE_DIR}/test)

include(cmake/util.cmake)

include_directories(include)
include_directories(src)

add_subdirectory(src)

add_subdirectory(test)

add_subdirectory(cmd)

add_subdirectory(benchmark)

if(EXISTS "${CMAKE_CURRENT_BINARY_DIR}/compile_commands.json")
    execute_process(COMMAND ${CMAKE_COMMAND} -E copy_if_different
        ${CMAKE_CURRENT_BINARY_DIR}/compile_commands.json
        ${CMAKE_CURRENT_SOURCE_DIR}/compile_commands.json
    )
endif()

