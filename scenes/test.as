#include "backend/bounce.as"
#include "backend/float.as"
#include "backend/shadows.as"
#include "backend/pair.as"
#include "entities/floatythingy.as"

[start]
void start() {
  set_position(get_player(), vec(4,4));
  set_z(get_player(), 0);
}

[start]
void shadow() {
  shadows::add(get_player());
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
      theta -= 360;
    
  } while(yield());
  
}

