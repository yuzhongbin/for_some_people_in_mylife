cmake_minimum_required(VERSION 2.8)

ADD_SUBDIRECTORY(poj)

SET(hello-word-src-objects  ${hello-word-poj})

#ADD_LIBRARY(hello-word-src-objects OBJECT ${hello-word-poj})

SET(hello-word-src
  #$<TARGET_OBJECTS:hello-word-src-objects>
  ${hello-word-src-objects}
  #add more objects before here
  PARENT_SCOPE)

#ADD_EXECUTABLE(hello_world ${hello-word-poj})