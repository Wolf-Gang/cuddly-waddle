#include "entities/spoopy.as"

entity spoop;

[start]
void start()
{
	set_position(get_player(), vec(0.5, 0.5));
}

[start]
void spoopy() {
  
  spoop = make_spoopy(vec(.5, 4));
  
  float theta = 0;
  
  float omega = 1.3;
  
  do {
    
    get_position(spoop).rotate(vec(3.5, 3), theta * math::pi / 180);
    
    theta += omega * get_delta();
    
    if(theta >= 10)
      theta -= 10;
    
  } while(yield());
  
}

[start]
void clone_test() {
  
  make_clone(vec(3, 3), 1, true);
  make_clone(vec(2, -2), .7);
  make_clone(vec(-1, -1), 5.3);
  make_clone(vec(-1.5, 1.7), .1, true);
}

void make_clone(vec pPos, float speed = 1, bool mirror = false){
  
  entity clone = add_character("somedude1");
  set_position(clone, pPos);
  set_direction(clone, direction::down);
  
  create_thread(function(args) {
    
    const bool mirror = bool(args["mirror"]);
    
    const float speed = float(args["speed"]);
    
    dprint("hello");
    
    entity clone = entity(args["clone"]);
    
    vec pos_difference = get_position(get_player()) - get_position(clone);
    
    vec movement;
    
    do {
      
      movement = (get_position(get_player()) - get_position(clone)) - pos_difference;
      
      if(movement.x != 0 || movement.y != 0) {
        
        set_direction(clone, vector_direction(movement * (mirror ? -1 : 1)));
        
        animation::start(clone);
        
        set_position(clone, get_position(clone) + (mirror ? -movement : movement) * speed);
        
      } else{
      
        animation::stop(clone);
        
      }
      
      pos_difference = get_position(get_player()) - get_position(clone);
      
    } while (yield());
    
  }, dictionary = {{"clone", clone}, {"speed", speed}, {"mirror", mirror}});
  
}