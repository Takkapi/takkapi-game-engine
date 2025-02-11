# Parent project does not export its library target, so this CML implicitly
# depends on being added from it, i.e. the testing is done only from the build
# tree and is not feasible from an install location

project(takkapi-game-engineTests LANGUAGES CXX)

# ---- Tests ----

add_executable(takkapi-game-engine_test source/takkapi-game-engine_test.cpp)
target_link_libraries(takkapi-game-engine_test PRIVATE takkapi-game-engine_lib)
target_compile_features(takkapi-game-engine_test PRIVATE cxx_std_20)

add_test(NAME takkapi-game-engine_test COMMAND takkapi-game-engine_test)

# ---- End-of-file commands ----

add_folders(Test)
