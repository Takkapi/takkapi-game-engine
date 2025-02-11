cmake_minimum_required(VERSION 3.14)

include(cmake/prelude.cmake)

project(
    takkapi-game-engine
    VERSION 0.0.1
    DESCRIPTION "A game engine in C++"
    HOMEPAGE_URL "https://example.com/"
    LANGUAGES CXX
)

include(cmake/project-is-top-level.cmake)
include(cmake/variables.cmake)

# ---- Declare library ----

add_library(
    takkapi-game-engine_lib OBJECT
    source/lib.cpp
)

target_include_directories(
    takkapi-game-engine_lib ${warning_guard}
    PUBLIC
    "\$<BUILD_INTERFACE:${PROJECT_SOURCE_DIR}/source>"
)

target_compile_features(takkapi-game-engine_lib PUBLIC cxx_std_20)

# ---- Declare executable ----

add_executable(takkapi-game-engine_exe source/main.cpp)
add_executable(takkapi-game-engine::exe ALIAS takkapi-game-engine_exe)

set_property(TARGET takkapi-game-engine_exe PROPERTY OUTPUT_NAME takkapi-game-engine)

target_compile_features(takkapi-game-engine_exe PRIVATE cxx_std_20)

target_link_libraries(takkapi-game-engine_exe PRIVATE takkapi-game-engine_lib)

# ---- Install rules ----

if(NOT CMAKE_SKIP_INSTALL_RULES)
  include(cmake/install-rules.cmake)
endif()

# ---- Developer mode ----

if(NOT takkapi-game-engine_DEVELOPER_MODE)
  return()
elseif(NOT PROJECT_IS_TOP_LEVEL)
  message(
      AUTHOR_WARNING
      "Developer mode is intended for developers of takkapi-game-engine"
  )
endif()

include(cmake/dev-mode.cmake)
