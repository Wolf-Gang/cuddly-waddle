#include "spoop/entities/spoopy.as"

entity spoop;
entity vanta;
entity billy;

[start]
void start() {
  set_position(get_player(), vec(100, 100));
  
  say("So, you wish to challenge me?");
  say("Very well.\n");
  append("But I will have to test you\nfirst.");
  say("If you can defeat my minions,\nI will face you.");
  say("Until you have proven yourself,\ndo not return.");
  narrative::end();
  fx::fade_out(.1);
  player::lock(false);
  
  set_position(get_player(), vec(5.5, 4.7));
  
  spoop = make_spoop(vec(5.5, 7.7), "back_up");
  
  vanta = add_entity("vanta");
  billy = add_entity("someguy");
  
  set_position(vanta, vec(8.5, 4.7));
  set_position(billy, vec(2.5, 4.7));
  
  set_atlas(vanta, "default:left");
  set_atlas(billy, "default:right");
  
  wait(2);
  fx::fade_in(3);
}

[group cuddle]
void test() {
  if(has_flag("spoopy") && has_flag("vanta") && has_flag("billy")) {
    //go to final boss
  } else {
    fsay("You have not yet proven\nyourself.\n");
    say("Return when you have completed\nyour task.");
    move(get_player(), vec(get_position(get_player()).x, 2.5), .25);
    narrative::end();
    player::lock(false);
  }
}

[group spooper]
void talk_spoop() {
  narrative::set_speaker(spoop);
  fsay("So you think you can best me?");
  switch(select("Yes", "No")) {
    case option::first:
      create_thread(function(args) {fx::fade_out(3);});
      say("Heh heh heh heh heh heh");
      load_scene("spoop/room1");
      break;
    case option::second:
      say("Of course not.");
      break;
    default:
  }
  narrative::end();
  player::lock(false);
}

[group the_king?]
void talk_vanta() {
  narrative::set_speaker(vanta);
  fsay("Do it.");
  switch(select("Yes", "No")) {
    case option::first:
      say("Good.");
      load_scene("Vanta/dark_room");
      break;
    case option::second:
      say("...");
      break;
    default:
  }
  narrative::end();
  player::lock(false);
}

[group bill]
void talk_billy() {
  narrative::set_speaker(billy);
  fsay("Does he wish to challenge Billy?");
  switch(select("Yes", "No")) {
    case option::first:
      say("Ohohohoho!");
      say("Billy has an excited!");
      load_scene("billy/start");
      break;
    case option::second:
      say("Billy has a dissapoint.");
      break;
    default:
  }
  narrative::end();
  player::lock(false);
}