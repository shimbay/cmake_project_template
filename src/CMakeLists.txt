populate_source_vars(${PROJECT_SRC_DIR} ${PROJECT_NAME}_SRCS)
print_variable(${PROJECT_NAME}_SRCS)

# core target
add_library(${PROJECT_NAME}_core OBJECT "${${PROJECT_NAME}_SRCS}")

# shared target
add_library(${PROJECT_NAME} SHARED $<TARGET_OBJECTS:${PROJECT_NAME}_core>)

