//basically the sine function

void float_entity(entity e) //sine f(x) with amp=1 and freq=2pi
{
	for(float t = 0; t <= 2 * 3.14; t += get_delta())
	{
		set_z(e, sin(t));
		
		yield();
	}
}

void float_entity(entity e, float a, float b) //y = a * sin(bx + c) + d
{
	for(float t = 0; t <= (2 * 3.14) * b; t += get_delta())
	{
		set_z(e, a * sin(t / b));
		
		yield();
	}
	
}


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

