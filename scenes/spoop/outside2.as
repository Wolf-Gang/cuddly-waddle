#include "entities/spoopy.as"

entity spoop;

[start]
void start()
{
	set_position(get_player(), vec(0.5, 0.5));
}

[start]
void spoopy() {
  
  spoop = make_spoopy(vec(3.5, 4));
  
  float theta = 0;
  
  float omega = 1.3;
  
  do {
    
    get_position(spoop).rotate(vec(3.5, 3), theta * math::pi / 180);
    
    theta += omega * get_delta();
    
    if(theta >= 10)
      theta -= 10;
    
  } while(yield());
  
}

