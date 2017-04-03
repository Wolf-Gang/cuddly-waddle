class sparkle
{
	entity target;
	float start_time;
	float timer;
}

[start]
void sparkle_effect()
{
	const float spawn_time = 2;
	array<sparkle> sparkles;
	float timer = 0;
	while(yield())
	{
		const float delta = get_delta();
		timer += delta;
		
		if (timer >= spawn_time)
		{
			entity thing = add_entity("light", "light_thingy");
			set_position(thing, focus::get() + vec(random(-50, 50)/10.f, random(-50, 50)/10.f));
			animation::start(thing);
			
			sparkle nsparkle;
			nsparkle.target = thing;
			nsparkle.start_time = random(10, 100)/10.f;
			nsparkle.timer = nsparkle.start_time;
			sparkles.insertLast(nsparkle);
			
			timer = 0;
		}
		
		for (uint i = 0; i < sparkles.length(); i++)
		{
			sparkles[i].timer -= delta;
			set_color(sparkles[i].target, 255, 255, 255, (sparkles[i].timer/sparkles[i].start_time)*256);
			if (sparkles[i].timer <= 0)
			{
				remove_entity(sparkles[i].target);
				sparkles.removeAt(i);
				--i;
			}
		}
	}
}

[group grave_sign_text]
void grave_sign_text()
{
	say("There is text inscribed on\nthe tombstone.");
	say("\"A soul who is lost...\"");
	nl("\"Soon to disappear...\"");
	nl("\"Will stay here forever...\"");
	say("\"But with its fear...\"");
	nl("\"Leaves its bones...\"");
	nl("\"Enchanted by joy...\"");
	say("\"It wakes in its sleep...\"");
	nl("\"A soul who is lost...\"");
	nl("\"Is never too far...\"");
	
	narrative::end();
	player::lock(false);
}

[start]
void create_grave_sign()
{
	set_position(add_entity("forest", "grave_sign"), vec(13.5, 3.5));
}

[start]
void start()
{
	music::open("doodle94");
	set_position(get_player(), vec(0.5, 4.5));
}
