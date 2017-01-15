set(_source "${CMAKE_CURRENT_SOURCE_DIR}/googletest")
set(_build "${CMAKE_CURRENT_BINARY_DIR}/googletest")

ExternalProject_Add(googletest
    SOURCE_DIR ${_source} 
    BINARY_DIR ${_build} 
    CMAKE_ARGS 
        ${${PROJECT_NAME}_DEFAULT_ARGS}
        -DBUILD_ONLY=cognito-idp
)
