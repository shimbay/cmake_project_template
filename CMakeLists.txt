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
set(PROJECT_BIN_DIR ${CMAKE_CURRENT_SOURCE_DIR}/cmd)
set(PROJECT_TEST_DIR ${CMAKE_CURRENT_SOURCE_DIR}/test)

include(cmake/util.cmake)

find_package(gtest REQUIRED)
print_target_properties(gtest)

include_directories(include)
include_directories(src)

populate_source_vars(${PROJECT_SRC_DIR} ${PROJECT_NAME}_SRCS)
print_variable(${PROJECT_NAME}_SRCS)
populate_test_vars(${PROJECT_SRC_DIR} ${PROJECT_NAME}_TESTS)
print_variable(${PROJECT_NAME}_TESTS)

# core target
add_library(${PROJECT_NAME}_core OBJECT "${${PROJECT_NAME}_SRCS}")

# shared target
add_library(${PROJECT_NAME} SHARED $<TARGET_OBJECTS:${PROJECT_NAME}_core>)

# bin target
add_executable(${PROJECT_NAME}_bin cmd/main.cc $<TARGET_OBJECTS:${PROJECT_NAME}_core>)

# test target
add_executable(${PROJECT_NAME}_test test/test_main.cc $<TARGET_OBJECTS:${PROJECT_NAME}_core> ${${PROJECT_NAME}_TESTS})
target_link_libraries(${PROJECT_NAME}_test PRIVATE 
	gtest
)

if(EXISTS "${CMAKE_CURRENT_BINARY_DIR}/compile_commands.json")
    execute_process(COMMAND ${CMAKE_COMMAND} -E copy_if_different
        ${CMAKE_CURRENT_BINARY_DIR}/compile_commands.json
        ${CMAKE_CURRENT_SOURCE_DIR}/compile_commands.json
    )
endif()

