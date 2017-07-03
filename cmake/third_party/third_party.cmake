# facebook
set(FACEBOOK_SOURCE_PATH ${THIRD_PARTY_PATH}/facebook)
set(FACEBOOK_BUILD_PATH ${BUILD_PATH}/third_party/facebook)

## zstd
set(FACEBOOK_ZSTD_SOURCE_PATH ${FACEBOOK_SOURCE_PATH}/zstd)
set(FACEBOOK_ZSTD_BUILD_PATH ${FACEBOOK_BUILD_PATH}/zstd)

if (BUILD_FB_ZSTD)
  add_subdirectory("${FACEBOOK_ZSTD_SOURCE_PATH}/build/cmake" "${FACEBOOK_ZSTD_BUILD_PATH}")
endif()

include_directories(SYSTEM ${FACEBOOK_ZSTD_SOURCE_PATH}/lib)

# microsoft
set(MICROSOFT_SOURCE_PATH ${THIRD_PARTY_PATH}/microsoft)
set(MICROSOFT_BUILD_PATH ${BUILD_PATH}/third_party/microsoft)

## gsl
set(MICROSOFT_GSL_SOURCE_PATH ${MICROSOFT_SOURCE_PATH}/gsl)

include_directories(${MICROSOFT_GSL_SOURCE_PATH}/include)
include_directories(${MICROSOFT_GSL_SOURCE_PATH}/include/gsl)
