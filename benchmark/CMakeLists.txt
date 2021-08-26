find_package(gbenchmark REQUIRED)
print_target_properties(gbenchmark)

populate_benchmark_vars(${PROJECT_SRC_DIR} ${PROJECT_NAME}_BENCHMARKS)
print_variable(${PROJECT_NAME}_BENCHMARKS)

# benchmark target
add_executable(${PROJECT_NAME}_benchmark benchmark_main.cc $<TARGET_OBJECTS:${PROJECT_NAME}_core> ${${PROJECT_NAME}_BENCHMARKS})
target_link_libraries(${PROJECT_NAME}_benchmark PRIVATE 
	gbenchmark
)
