cmake_minimum_required(VERSION 2.8)

AUX_SOURCE_DIRECTORY(. SRC_LIST)
ADD_LIBRARY(hello-word-poj-test-objects OBJECT ${SRC_LIST})

SET(hello-word-poj-test
  $<TARGET_OBJECTS:hello-word-poj-test-objects>
  #add more objects before here
  PARENT_SCOPE)