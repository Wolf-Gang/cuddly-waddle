#include "../../backend/float.as"

entity make_spoopy(vec pPos, string atlas = "default:default", bool pFloat = true) {
  entity spoop = add_character("spoopy");
  set_position(spoop, pPos);
  set_atlas(spoop, atlas);
  if(pFloat)
    float_entity(spoop, .05, 1.5, -1);
  return spoop;
}

