cmake_minimum_required(VERSION 2.8)

ADD_SUBDIRECTORY(1061)

AUX_SOURCE_DIRECTORY(. SRC_LIST)
ADD_LIBRARY(hello-word-poj-objects OBJECT ${SRC_LIST})

SET(hello-word-poj
  $<TARGET_OBJECTS:hello-word-poj-objects>
  $<hello-word-poj-1061>
  # add more objects before here
  PARENT_SCOPE)
