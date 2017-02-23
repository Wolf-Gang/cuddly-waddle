
entity spoopy;
entity clar;

[start]
void start() {
  spoopy = add_entity("spoopy");
  set_atlas(spoopy, "back_up");
  set_position(spoopy, vec(.5, -2));
  set_position(get_player(), vec(.5, 11));
  set_direction(get_player(), direction::up);
}

[start]
void the_eye() {
  clar = add_entity("clarissa");
  set_depth(clar, fixed_depth::below);
  set_anchor(clar, anchor::left);
  set_position(clar, vec(-1.64, -4.1));
}

