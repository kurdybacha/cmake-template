cmake_minimum_required(VERSION 3.5 FATAL_ERROR)
project(my_app)

set(CMAKE_CXX_STANDARD 14)

set(public_headers
    )

set(private_headers
    )

set(sources
    main.cpp
    )

add_executable(${PROJECT_NAME} 
            ${public_headers}
            ${private_headers}
            ${sources})

find_package(ZeroMQ REQUIRED)
target_link_libraries(${PROJECT_NAME} PRIVATE ${ZeroMQ_LIBRARY})
target_include_directories(${PROJECT_NAME} PRIVATE ${CMAKE_CURRENT_SOURCE_DIR} ${ZeroMQ_INCLUDE_DIR})

install(TARGETS ${PROJECT_NAME} EXPORT ${PROJECT_NAME} DESTINATION bin)
install(FILES ${public_headers} DESTINATION include)
