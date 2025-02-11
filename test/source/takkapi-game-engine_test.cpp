#include "lib.hpp"

auto main() -> int
{
  auto const lib = library {};

  return lib.name == "takkapi-game-engine" ? 0 : 1;
}
