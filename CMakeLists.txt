cmake_minimum_required(VERSION 3.5)

project(my_project CXX)
set(CMAKE_MODULE_PATH "${CMAKE_CURRENT_SOURCE_DIR}/cmake"
      ${CMAKE_MODULE_PATH})

# Set up some standard defaults, they will be passed down into external.
include(ExternalProject)

# Set up a few default arguments for all projects, such as the install prefix,
# CMake prefix path and the runtime/library output directories.
option(BUILD_SHARED_LIBS "Build libraries as SHARED" ON)
option(ENABLE_TESTING "Enable testing for Open Chemistry projects" OFF)
option(BUILD_DOCUMENTATION "Build documentation (Doxygen)" OFF)
option(CMAKE_EXPORT_COMPILE_COMMANDS "Output of compile commands during generation" ON)

set(${PROJECT_NAME}_INSTALL_PREFIX "${${PROJECT_NAME}_BINARY_DIR}")
set(${PROJECT_NAME}_DEFAULT_ARGS
    "-DBUILD_SHARED_LIBS:BOOL=${BUILD_SHARED_LIBS}"
    "-DCMAKE_PREFIX_PATH:PATH=${${PROJECT_NAME}_INSTALL_PREFIX};${CMAKE_PREFIX_PATH}"
    "-DCMAKE_INSTALL_PREFIX:PATH=${${PROJECT_NAME}_INSTALL_PREFIX}")

list(APPEND ${PROJECT_NAME}_DEFAULT_ARGS
    "-DBUILD_DOCUMENTATION:BOOL=${BUILD_DOCUMENTATION}"
    "-DENABLE_TESTING:BOOL=${ENABLE_TESTING}"
    "-DCMAKE_EXPORT_COMPILE_COMMANDS:BOOL=${CMAKE_EXPORT_COMPILE_COMMANDS}"
    )

# If there is a CMAKE_BUILD_TYPE it is important to ensure it is passed down.
if(CMAKE_BUILD_TYPE)
    list(APPEND ${PROJECT_NAME}_DEFAULT_ARGS "-DCMAKE_BUILD_TYPE:STRING=${CMAKE_BUILD_TYPE}")
endif()

set(FORCE_STEP_DEFAULT "build")
if(CMAKE_CONFIGURATION_TYPES)
    set(FORCE_STEP_DEFAULT "configure")
endif()

set(FORCE_STEP ${FORCE_STEP_DEFAULT} CACHE STRING
    "Should the top level projects force configure/build/install each make")
set_property(CACHE FORCE_STEP PROPERTY STRINGS OFF configure build install)

if(FORCE_STEP STREQUAL configure)
    set(dependee "update")
elseif(FORCE_STEP STREQUAL build)
    set(dependee "configure")
elseif(FORCE_STEP STREQUAL install)
    set(dependee "build")
endif()

set(FORCE_STEP_ARGS
    DEPENDEES ${dependee}
    DEPENDERS ${FORCE_STEP}
    )

include(libzmq)
include(src)
