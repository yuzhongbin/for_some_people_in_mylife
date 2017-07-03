set(ASAN_COMMON_FLAGS " -fsanitize=address")
string(APPEND ASAN_COMMON_FLAGS " -fno-omit-frame-pointer")
string(APPEND ASAN_COMMON_FLAGS " -fsanitize-blacklist=${TOOLS_PATH}/asan/asan-blacklist.txt")

set(PROJECT_C_FLAGS "${ASAN_COMMON_FLAGS}")
set(PROJECT_CXX_FLAGS "${ASAN_COMMON_FLAGS}")
