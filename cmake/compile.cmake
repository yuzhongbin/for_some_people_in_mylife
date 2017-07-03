#global flags
set(GLOBAL_C_FLAGS "-std=c11 -Wall -Werror")
set(GLOBAL_CXX_FLAGS "-std=c++11 -Wall -Werror -fno-exceptions")

set(GLOBAL_C_EXTRA_FLAGS "-Wextra -Wno-unused-parameter -Wno-missing-field-initializers")
set(GLOBAL_CXX_EXTRA_FLAGS "-Wextra -Wno-unused-parameter -Wno-missing-field-initializers")

set(GLOBAL_C_DEBUG_FLAGS "-O0 -g -ggdb3")
set(GLOBAL_C_RELEASE_FLAGS "-O3")

set(GLOBAL_CXX_DEBUG_FLAGS "-O0 -g -ggdb3")
set(GLOBAL_CXX_RELEASE_FLAGS "-O3")

# version macro
add_definitions("-DHELLO_WORD_VERSION=${VERSION}")

# custom flags
if (EXISTS ${CMAKE_PATH}/project/prj_${PROJECT}.cmake)
  include(${CMAKE_PATH}/project/prj_${PROJECT}.cmake)
endif()

include(${CMAKE_PATH}/platform/platform_${PLATFORM}.cmake)

if (EXISTS ${CMAKE_PATH}/bitwide/bitwide_${BITWIDE}.cmake)
  include(${CMAKE_PATH}/bitwide/bitwide_${BITWIDE}.cmake)
endif()

if (EXISTS ${CMAKE_PATH}/compiler/compiler_${COMPILER}.cmake)
  include(${CMAKE_PATH}/compiler/compiler_${COMPILER}.cmake)
endif()

# __FILENAME__ is a macro stand for the file name without path
set(FILENAME_MACRO "-D__FILENAME__='\"$(lastword $(subst /, ,$(abspath $<)))\"'")

# C final flags
set(CMAKE_C_FLAGS_DEBUG "${GLOBAL_C_DEBUG_FLAGS}")
set(CMAKE_C_FLAGS_RELEASE "${GLOBAL_C_RELEASE_FLAGS}")

set(CMAKE_C_FLAGS "${GLOBAL_C_FLAGS}")
string(APPEND CMAKE_C_FLAGS " ${GLOBAL_C_EXTRA_FLAGS}")
string(APPEND CMAKE_C_FLAGS " ${FILENAME_MACRO}")
string(APPEND CMAKE_C_FLAGS " ${COMPILER_C_FLAGS}")
string(APPEND CMAKE_C_FLAGS " ${BITWIDE_C_FLAGS}")
string(APPEND CMAKE_C_FLAGS " ${PROJECT_C_FLAGS}")
string(APPEND CMAKE_C_FLAGS " ${PLATFORM_C_FLAGS}")

# CXX final flags
set(CMAKE_CXX_FLAGS_DEBUG "${GLOBAL_CXX_DEBUG_FLAGS}")
set(CMAKE_CXX_FLAGS_RELEASE "${GLOBAL_CXX_RELEASE_FLAGS}")

set(CMAKE_CXX_FLAGS "${GLOBAL_CXX_FLAGS}")
string(APPEND CMAKE_CXX_FLAGS " ${GLOBAL_CXX_EXTRA_FLAGS}")
string(APPEND CMAKE_CXX_FLAGS " ${FILENAME_MACRO}")
string(APPEND CMAKE_CXX_FLAGS " ${COMPILER_CXX_FLAGS}")
string(APPEND CMAKE_CXX_FLAGS " ${BITWIDE_CXX_FLAGS}")
string(APPEND CMAKE_CXX_FLAGS " ${PROJECT_CXX_FLAGS}")
string(APPEND CMAKE_CXX_FLAGS " ${PLATFORM_CXX_FLAGS}")
