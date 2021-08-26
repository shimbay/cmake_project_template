find_package(gtest REQUIRED)
print_target_properties(gtest)

populate_test_vars(${PROJECT_SRC_DIR} ${PROJECT_NAME}_TESTS)
print_variable(${PROJECT_NAME}_TESTS)

# test target
add_executable(${PROJECT_NAME}_test test_main.cc $<TARGET_OBJECTS:${PROJECT_NAME}_core> ${${PROJECT_NAME}_TESTS})
target_link_libraries(${PROJECT_NAME}_test PRIVATE 
	gtest
)

