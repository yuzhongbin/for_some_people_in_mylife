cmake_minimum_required(VERSION 2.8)

AUX_SOURCE_DIRECTORY(. SRC_LIST)
ADD_LIBRARY(hello-word-poj-1061-objects OBJECT ${SRC_LIST})

SET(hello-word-poj-1061
  $<TARGET_OBJECTS:hello-word-poj-1061-objects>
  #add more objects before here
  PARENT_SCOPE)
