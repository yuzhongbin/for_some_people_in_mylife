cmake_minimum_required(VERSION 2.8)

#PROJECT(hello_world)

message("OK")

SET(INCLUDE_BASE ./include)
SET(THIRDPART_BASE /mnt/host/hello_world/thirdparty)
SET(SOURCE_BASE ./src)

MESSAGE("INCLUDE_BASE=${INCLUDE_BASE}")

SET(GOOGLE_BASE ${THIRDPART_BASE}/googletest)
SET(GTEST_LIB_PATH ${GOOGLE_BASE}/googletest/make)
SET(GMOCK_LIB_PATH ${GOOGLE_BASE}/googlemock/make)

SET(GTEST_INCLUDE_PATH ${GOOGLE_BASE}/googletest/include)
SET(GMOCK_INCLUDE_PATH ${GOOGLE_BASE}/googlemock/include)

SET(GTEST_LIB_A ${GTEST_LIB_PATH}/gtest_main.a)
SET(GMOCK_LIB_A ${GMOCK_LIB_PATH}/gmock_main.a)

SET(EXECUTABLE_OUTPUT_PATH ./build)

INCLUDE_DIRECTORIES(${INCLUDE_BASE}/poj)
INCLUDE_DIRECTORIES(${GTEST_INCLUDE_PATH})
INCLUDE_DIRECTORIES(${GTEST_INCLUDE_PATH}/gtest)
INCLUDE_DIRECTORIES(${GMOCK_INCLUDE_PATH})
INCLUDE_DIRECTORIES(${GMOCK_INCLUDE_PATH}/gmock)

ADD_SUBDIRECTORY(src)

if (${BUILD_TEST} STREQUAL "ON")
  ADD_SUBDIRECTORY(test)
  ADD_SUBDIRECTORY(thirdparty)
endif(${BUILD_TEST} STREQUAL "ON")

MESSAGE("hello-word-src=${hello-word-src}")

ADD_EXECUTABLE(hello_world
  ${hello-word-src}  ${hello-word-test} )

#target_link_libraries(${GTEST_LIB_A} hello_world )
