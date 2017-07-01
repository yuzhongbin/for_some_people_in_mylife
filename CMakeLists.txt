cmake_minimum_required(VERSION 2.8)

PROJECT(hello_world)

SET(INCLUDE_BASE ./include)
SET(THIRDPART_BASE ./third_party)
SET(SOURCE_BASE ./src)

SET(GOOGLE_BASE THIRDPART_BASE/googletest)
SET(GTEST_LIB_PATH GOOGLE_BASE/googletest/make)
SET(GMOCK_LIB_PATH GOOGLE_BASE/googlemock/make)
SET(GTEST_INCLUDE_PATH GOOGLE_BASE/googletest/include/gtest)
SET(GMOCK_INCLUDE_PATH GOOGLE_BASE/googlemock/include/gmock)

SET(EXECUTABLE_OUTPUT_PATH ./build)
SET (CMAKE_CXX_COMPILER "g++")
ADD_DEFINITIONS("std=c++0x -g")

ADD_SUBDIRECTORY(src)

ADD_EXECUTABLE(hello_world ${SRC_CODE})

