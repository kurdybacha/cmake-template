set(_source "${CMAKE_SOURCE_DIR}/3rdparty/libzmq")
set(_build "${CMAKE_CURRENT_BINARY_DIR}/libzmq")

ExternalProject_Add(zmq
    SOURCE_DIR ${_source} 
    BINARY_DIR ${_build} 
    GIT_REPOSITORY "https://github.com/zeromq/libzmq.git"
    GIT_TAG "master"
    CMAKE_ARGS 
        ${${PROJECT_NAME}_DEFAULT_ARGS}
        -DZMQ_BUILD_TESTS=OFF
        -DWITH_PERF_TOOL=OFF
)
