
[start]
void start() {
  set_position(get_player(), vec(0, 2.85));
}

[group portal]
void throne_room() {
  fsay("Do you wish to venture to the\nthrone room?");
  if(select("Yes", "No") == option::first) {
    load_scene("Vanta/dark_room");
  } else {
    move(get_player(), get_position(get_player()) + (get_position(get_player()) - vec(5.5, 0.5)).normalize() * 0.3, .25);
  }
  narrative::end();
}

