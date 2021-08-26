# bin target
add_executable(${PROJECT_NAME}_bin main.cc $<TARGET_OBJECTS:${PROJECT_NAME}_core>)

