//basically the sine function

void float_entity(entity floater, float height, float period, float cycles = 1) {
  
  float t = 0;
  
  if(cycles < 0) {
    
    do {
      
      set_z(floater, height * sin((t * 2 * 3.14) / period));
      
      t += get_delta();
      
    } while(yield());
    
  } else {
  
    for(t; t < cycles * period; t += get_delta()) {
      
      set_z(floater, height * sin(t * 2 * 3.14 * period));
      
      yield();
    }
  }
}

