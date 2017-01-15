set(_source "${CMAKE_CURRENT_SOURCE_DIR}/src")
set(_build "${CMAKE_CURRENT_BINARY_DIR}/src")
set(_deps zmq)

ExternalProject_Add(src
    SOURCE_DIR ${_source}
    BINARY_DIR ${_build}
    CMAKE_ARGS
        ${${PROJECT_NAME}_DEFAULT_ARGS}
    DEPENDS
        ${_deps}
    )

if(FORCE_STEP)
    ExternalProject_Add_Step(src forcebuild
        COMMAND ${CMAKE_COMMAND} -E echo "Force build of src"
        ${FORCE_STEP_ARGS}
        ALWAYS 1)
endif()
