include(FetchContent)

FetchContent_Declare(
  gbenchmark_fc
  GIT_REPOSITORY https://github.com/google/benchmark.git
  GIT_TAG 2d054b683f293dbee21f8fe8820d967360e6af83 # v1.5.6
  SOURCE_DIR ${THIRD_PARTY_SOURCE_DIR}/gbenchmark)

if(NOT gbenchmark_fc_POPULATED)
  FetchContent_Populate(gbenchmark_fc)
endif()

# set(BENCHMARK_DOWNLOAD_DEPENDENCIES OFF CACHE BOOL "" FORCE)
set(BENCHMARK_ENABLE_TESTING
    OFF
    CACHE BOOL "" FORCE)
set(BENCHMARK_ENABLE_GTEST_TESTS
    OFF
    CACHE BOOL "" FORCE)

add_subdirectory(${gbenchmark_fc_SOURCE_DIR} ${CMAKE_BINARY_DIR}/gbenchmark)

add_library(gbenchmark ALIAS benchmark)
