#include "backend/bounce.as"
#include "backend/float.as"
#include "backend/shadows.as"
#include "backend/pair.as"
#include "entities/floatythingy.as"
#include "backend/emote.as"

[start]
void start() {
  set_position(get_player(), vec(4,4));
  set_z(get_player(), 0);
}

[start]
void shadow() {
  shadows::add(get_player());
}

[group talk]
void emote_test()
{
	//emotes::add(get_player(), emotes::emote_type::angry);
	emote e;
	e.add_emote(get_player(), emote_type::angry);
	wait(1);
	e.remove_emote();
}

[start]
void do_narwhal() {
  
  entity narwhal = add_character("narry");
  set_position(narwhal, vec(2, 2));
  //emotes::add(narwhal, emotes::emote_type::frustrated);
  
  float t = 0;
  
  float omega = .76;
  
  do {
    
    move(narwhal, get_position(narwhal).rotate(vec(2.5, 2.5), omega * 180 / math::pi * get_delta()), speed(omega * get_position(narwhal).distance(vec(2.5, 2.5))));
    
  } while(yield());
  
}

[group boonce]
void lets_bounce() {
  do {
    bounce(get_player(), 2);
  } while(yield());
}

[group floot]
void lets_float() {
  float_entity(get_player(), 1, 2, -1);
}

[group pair_test]
void pair_things() {

  pair bros("narry", "vill", vec(3, 3), 2);
  
  float theta = 0;
  
  float omega = 360/3;
  
  bros.set_pair_position(vec(4, 4.5));
  
  do {
    
    bros.set_angle(theta);
    
    set_rotation(bros.get_right(), theta + 90);
    
    bros.set_separation(sin(theta * math::pi / (180 / 2.4)) * .5 + 2.5);
    
    theta += omega * get_delta();
    
    if(theta >= 360 * 12)
      theta -= 360 * 12;
    
  } while(yield());
  
}

