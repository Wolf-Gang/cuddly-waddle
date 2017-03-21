
entity crack;
entity door;
entity food1;

[start]
void start() {
  set_position(get_player(), vec(0.5, 3));
  set_z(get_player(), 0);
  door = add_entity("spoop_tilemap", "door");
  set_position(door, vec(6.76, 5));
  fx::fade_in(.5);
}

[start]
void door_collision() {
  if(has_flag("room1_open")) {
    group::enable("door", false);
    set_visible(door, false);
  }
}

[start]
void earthquake() {
  if(!has_flag("wall_broken")) {
    
  }
}

[start]
void wall() {
  if(!has_flag("wall_broken")) {
    crack = add_entity("spoop_tilemap", "wall_crack");
  } else {
    crack = add_entity("spoop_tilemap", "wall_crack_2");
  }
  set_position(crack, vec(3.5, 2));
  set_depth(crack, 255);
}

[group wall_crack]
void wall_crack() {
  if(!has_flag("wall_broken")) {
    say("A totally unsuspicious crack\nin the wall.");
    say("Nothing to see here.");
    narrative::hide();
    player::lock(false);
    if(!has_flag("inspector")) {
      create_thread(function(args) {
        wait(10);
        say("rumble rumble");
        set_flag("wall_broken");
        set_atlas(crack, "wall_crack_2");
        narrative::end();
      });
      set_flag("inspector");
    }
  } else {
    say("It appears you can fit\nthrough now.");
    load_scene("spoop/room2");
  }
}

