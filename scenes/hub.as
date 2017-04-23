#include "spoop/entities/spoopy.as"
#include "backend/shadows.as"
#include "backend/emote.as"

entity spoop;
entity vanta;
entity billy;

[start]
void start() {
  
  if(!has_flag("intro")) {
  
    set_position(get_player(), vec(5.5, 100));
    
    //narrative::set_skip(false);
    say("So, you wish to challenge me?");
    append("\nVery well.");
    say("But I will have to test you\nfirst.");
    say("If you can defeat my minions,\nI will face you.");
    say("Until you have proven yourself,\ndo not return.");
    narrative::end();
    
    fx::fade_out(.1);
    player::lock(false);
    
  }
  
  set_position(get_player(), vec(15.5, 14.7));
  
  if (!has_flag("spoopy")) {
  
    spoop = make_spoopy(vec(15.5, 25.2), "default:up");
    
    shadows::add(spoop);
    
  } else {
    
    group::enable("spooper", false);
    
  }
  
  if (!has_flag("vanta")) {
  
    vanta = add_entity("vanta");
    set_position(vanta, vec(26, 14.7));
    set_atlas(vanta, "default:left");
    
    shadows::add(vanta);
    
  } else {
    
    group::enable("the_king?", false);
    
  }
  
  if (!has_flag("billy")) {
  
    billy = add_entity("someguy");
    set_position(billy, vec(5, 14.7));
    set_atlas(billy, "default:right");
    
    shadows::add(billy);
    
  } else {
    
    group::enable("bill", false);
    
  }
  
  if(has_flag("spoopy") && has_flag("vanta") && has_flag("billy")) {
  
    group::enable("fin", false);
    
  } else {
    
    entity pixel = add_entity("pixel");
    set_anchor(pixel, anchor::bottom);
    set_color(pixel, 0, 0, 0);
    //set_scale(pixel, 256);
    set_position(pixel, vec(15.5,11));
    
  }
  
  if(!has_flag("intro")) {
  
    wait(2);
    fx::fade_in(3);
    set_flag("intro");
    
  }
  
}

[group finale]
void the_end() {
  //narrative::set_skip(false);
  set_position(get_player(), vec(15.5, 100));
  say("Well done.");
  say("I guess I have to keep my promise\nnow, don't I?");
  say("Ho ho! This will be fun.");
  //to final boss scene(s)
  narrative::end();
  player::lock(false);
}

[group spooper]
void talk_spoop() {
  narrative::set_speaker(spoop);
  //narrative::set_skip(false);
  narrative::set_speed(13);
  fsay("So you think you can best me?");
  switch(select("Yes", "No")) {
    case option::first:
      create_thread(function(args) {fx::fade_out(3);});
      fsay("We shall see.");
      wait(3);
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

  emote e;
  narrative::set_speaker(vanta);
  fsay("Do you dare defeat the \nalmighty Vanta?");
  switch(select("Yes", "No")) {
    case option::first:
      say("En garde!");
      load_scene("Vanta/dark_room");
      break;
    case option::second:
	  narrative::hide();
	  wait(1);
	  e.add_emote(vanta, emote_type::silence);
	  wait(2);
	  e.remove_emote();
	  wait(1);
      say("How pathetic.");
      break;
    default:
  }
  narrative::end();
  player::lock(false);
}

[group bill]
void talk_billy() {

  emote e;
  narrative::set_speaker(billy);
  fsay("Does he wish to challenge Billy?");
  switch(select("Yes", "No")) {
    case option::first:
      say("Ohohohoho!");
      say("Billy has an excited!");
      load_scene("billy/start");
      break;
    case option::second:
      e.add_emote(billy, emote_type::angry);
      say("Billy has a dissapoint.");
      e.remove_emote();
      break;
    default:
  }
  narrative::end();
  player::lock(false);
}

