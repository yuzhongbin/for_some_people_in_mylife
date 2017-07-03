if (xx_STUB)
  set(xx_INCLUDE_PATH ${TOOLS_PATH}/ut/stub/xx)
else()
  set(xx_INCLUDE_PATH ${THIRD_PARTY_PATH}/xx)
endif()

include_directories(SYSTEM ${xx_INCLUDE_PATH})
include_directories(SYSTEM ${xx_INCLUDE_PATH}/include)

if (ARCH STREQUAL x86)
  include_directories(SYSTEM ${xx_INCLUDE_PATH}/extlib/include/include_suselinux_11_x86)
endif()
