# https://stackoverflow.com/questions/32183975/how-to-print-all-the-properties-of-a-target-in-cmake/56738858#56738858
# https://stackoverflow.com/a/56738858/3743145

# Get all properties that cmake supports
execute_process(COMMAND cmake --help-property-list
                OUTPUT_VARIABLE CMAKE_PROPERTY_LIST)
# Convert command output into a CMake list
string(REGEX REPLACE ";" "\\\\;" CMAKE_PROPERTY_LIST "${CMAKE_PROPERTY_LIST}")
string(REGEX REPLACE "\n" ";" CMAKE_PROPERTY_LIST "${CMAKE_PROPERTY_LIST}")

list(REMOVE_DUPLICATES CMAKE_PROPERTY_LIST)

function(print_target_properties target)
  if(NOT TARGET ${target})
    message(STATUS "There is no target named '${target}'")
    return()
  endif()

  message("=== Properties of <${target}> begin ===")
  foreach(property ${CMAKE_PROPERTY_LIST})
    string(REPLACE "<CONFIG>" "${CMAKE_BUILD_TYPE}" property ${property})

    # Fix
    # https://stackoverflow.com/questions/32197663/how-can-i-remove-the-the-location-property-may-not-be-read-from-target-error-i
    if(property STREQUAL "LOCATION"
       OR property MATCHES "^LOCATION_"
       OR property MATCHES "_LOCATION$")
      continue()
    endif()

    get_property(
      was_set
      TARGET ${target}
      PROPERTY ${property}
      SET)
    if(was_set)
      get_target_property(value ${target} ${property})
      message("${target} ${property} = ${value}")
    endif()
  endforeach()
  message("=== Properties of <${target}> end ===")
endfunction(print_target_properties)

function(print_variable var)
  file(RELATIVE_PATH RL_PATH ${CMAKE_SOURCE_DIR} ${CMAKE_CURRENT_LIST_FILE})
  message("${var}:${PROJECT_NAME}@${RL_PATH} is ${${var}}")
endfunction()

set(DEFAULT_TEST_FILTER ".*(_test|test_util)\\.(c|cc|cpp|h)$")
set(DEFAULT_BENCHMARK_FILTER ".*(_benchmark)\\.(c|cc|cpp|h)$")

macro(populate_source_vars SOURCE_DIR SOURCES_VAR)
  file(GLOB_RECURSE FOUND_SOURCES "${SOURCE_DIR}/*.*")
  list(FILTER FOUND_SOURCES INCLUDE REGEX ".*\\.(c|cc|cpp|h)$")
  list(FILTER FOUND_SOURCES EXCLUDE REGEX "${DEFAULT_TEST_FILTER}")
  list(FILTER FOUND_SOURCES EXCLUDE REGEX "${DEFAULT_BENCHMARK_FILTER}")
  list(APPEND ${SOURCES_VAR} ${FOUND_SOURCES})
endmacro()

macro(populate_test_vars SOURCE_DIR TESTS_VAR)
  file(GLOB_RECURSE FOUND_SOURCES "${SOURCE_DIR}/*.*")
  list(FILTER FOUND_SOURCES INCLUDE REGEX "${DEFAULT_TEST_FILTER}")
  list(APPEND ${TESTS_VAR} ${FOUND_SOURCES})
endmacro()

macro(populate_benchmark_vars SOURCE_DIR BENCHMARKS_VAR)
  file(GLOB_RECURSE FOUND_SOURCES "${SOURCE_DIR}/*.*")
  list(FILTER FOUND_SOURCES INCLUDE REGEX "${DEFAULT_BENCHMARK_FILTER}")
  list(APPEND ${BENCHMARKS_VAR} ${FOUND_SOURCES})
endmacro()
