# for clang tools
execute_process(COMMAND "ulimit -v unlimited")

set(COMPILER_CLANG_FLAGS "")
set(COMPILER_CLANG_FLAGS "")

if (EXISTS "/usr/local/gcc-last")
  execute_process(COMMAND gcc-last -dumpversion OUTPUT_VARIABLE GCC_VERSION)
  string(REGEX REPLACE "\n$" "" GCC_VERSION "${GCC_VERSION}")
  string(APPEND COMPILER_CLANG_FLAGS " --gcc-toolchain=/usr/local/gcc-last")
  string(APPEND COMPILER_CLANG_FLAGS " -isystem /usr/local/gcc-last/include/c++/${GCC_VERSION}")
endif()

set(COMPILER_C_FLAGS "${COMPILER_CLANG_FLAGS}")
set(COMPILER_CXX_FLAGS "${COMPILER_CLANG_FLAGS} -Wno-unused-variable")

include(${CMAKE_PATH}/compiler/compiler_strictly.cmake)
string(REGEX REPLACE "-Wsubobject-linkage" "" COMPILER_CXX_FLAGS "${COMPILER_CXX_FLAGS}")
string(REGEX REPLACE "-flto-odr-type-merging" "" COMPILER_CXX_FLAGS "${COMPILER_CXX_FLAGS}")
