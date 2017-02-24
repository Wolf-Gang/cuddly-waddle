
void float_e(entity floater, float height) {
  
  const float pi = 3.14159;
  
  float t = 0;
  
  vec base = get_position(floater);
  
  do {
    set_z(floater, sin(t * pi) * height);
    t += get_delta();
    if(t > 2) 
      t -= 2;
  } while(yield());
}

