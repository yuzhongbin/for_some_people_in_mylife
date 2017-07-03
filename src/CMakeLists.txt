cmake_minimum_required(VERSION 2.8)

ADD_SUBDIRECTORY(poj)

ADD_LIBRARY(hello-word-src
  $<hello-word-poj>)
