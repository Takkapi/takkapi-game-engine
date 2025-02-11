install(
    TARGETS takkapi-game-engine_exe
    RUNTIME COMPONENT takkapi-game-engine_Runtime
)

if(PROJECT_IS_TOP_LEVEL)
  include(CPack)
endif()
