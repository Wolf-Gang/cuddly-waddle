//basically the sine function

void float_entity(entity e, float a = 1, float b = 1) //y = a * sin(bx + c) + d
{
	for(float t = 0; t <= (2 * 3.14) * b; t += get_delta())
	{
		set_z(e, a * sin(t / b));
    
    yield();
	}
}

void float_loop(entity e, float a = 1, float b = 1) {
  do {
    float_entity(e, a, b);
  } while(yield());
}

//pretty much the same as above, but you can set the number of cycles it does 
//with negatives being infinite
void float_entity(entity floater, float height, float period, float cycles) {
  
  const float pi = 3.1415926;
  
  float t = 0;
  
  if(cycles < 0) {
    
    do {
      
      set_z(floater, height * sin((t * 2 * pi) / period));
      
      t += get_delta();
      
    } while(yield());
    
  } else {
  
    for(t; t < cycles * period; t += get_delta()) {
      
      set_z(floater, height * sin(t * 2 * pi * period));
      
      yield();
    }
  }
}

