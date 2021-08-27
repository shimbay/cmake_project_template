include(FetchContent)

FetchContent_Declare(
  gtest_fc
  GIT_REPOSITORY https://github.com/google/googletest.git
  GIT_TAG 703bd9caab50b139428cea1aaff9974ebee5742e # release-1.10.0
  SOURCE_DIR ${THIRD_PARTY_SOURCE_DIR}/gtest)

if(NOT gtest_fc_POPULATED)
  FetchContent_Populate(gtest_fc)
endif()

# BUILD_GMOCK is a cache entry
set(BUILD_GMOCK
    OFF
    CACHE BOOL "" FORCE)

add_subdirectory(${gtest_fc_SOURCE_DIR} ${CMAKE_BINARY_DIR}/gtest)
