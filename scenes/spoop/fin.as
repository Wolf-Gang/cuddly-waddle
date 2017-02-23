
entity spoopy;
entity eye;

[start]
void start() {
  spoopy = add_entity("spoopy");
  set_position(spoopy, vec(.5, -4));
  set_position(get_player(), vec(.5, 11));
  set_direction(get_player(), direction::up);
}

[start]
void the_eye() {
  eye = add_entity("theeye");
  set_depth(eye, fixed_depth::below);
  set_anchor(eye, anchor::left);
  set_position(eye, vec(-1.64, -4.1));
}

