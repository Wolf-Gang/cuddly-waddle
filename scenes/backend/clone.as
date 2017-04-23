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