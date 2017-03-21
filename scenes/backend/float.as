//basically the sine function

void float_entity(entity floater, float height, float period, float cycles = 1) {
  
  float t = 0;
  
  float origin = get_z(floater);
  
  if(cycles < 0) {
    
    do {
      
      //The derivative of the sine function (the cosine function) is used here and below so that it doesn't
      //mess up other things that would affect z value
      set_z(floater, get_z(floater) + (height * cos((t * 2 * math::pi) / period) * get_delta()));
      
      t += get_delta();
    
      if(t >= period) {
        
        t -= period;
        
      }
    } while(yield());
    
  } else {
  
    for(t; t < cycles * period; t += get_delta()) {
      
      set_z(floater, get_z(floater) + height * cos(t * 2 * math::pi * period) * get_delta());
      
      yield();
    }
  }
}

