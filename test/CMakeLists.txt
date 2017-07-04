cmake_minimum_required(VERSION 2.8)

AUX_SOURCE_DIRECTORY(. TEST_SRC_LIST)
ADD_LIBRARY(hello-word-test-src OBJECT ${TEST_SRC_LIST})

ADD_SUBDIRECTORY(poj)

SET(hello-word-test
  $<TARGET_OBJECTS:hello-word-test-src>
  ${hello-word-poj-test}

  #add more objects before here
  PARENT_SCOPE)