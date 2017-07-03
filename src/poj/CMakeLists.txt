cmake_minimum_required(VERSION 2.8)

ADD_SUBDIRECTORY(1061)

ADD_LIBRARY(hello-word-src-poj ${POJ_LINKTYPE}
  ${hello-word-src-poj-601-all}
  # add more objects before here
  )
