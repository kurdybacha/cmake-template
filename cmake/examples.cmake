set(_source "${CMAKE_CURRENT_SOURCE_DIR}/examples")
set(_build "${CMAKE_CURRENT_BINARY_DIR}/examples")
set(_deps src)

ExternalProject_Add(examples
    SOURCE_DIR ${_source}
    BINARY_DIR ${_build}
    CMAKE_ARGS
        ${${PROJECT_NAME}_DEFAULT_ARGS}
    DEPENDS
        ${_deps}
    )
