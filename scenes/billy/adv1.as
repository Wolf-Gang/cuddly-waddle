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

entity ninjaskeli_guy;
entity ninjaskeli_guy2;

[start]
void create_ninjaskeli()
{
	ninjaskeli_guy = add_entity("NinjaSkeli", "sneaking");
	set_position(ninjaskeli_guy, vec(32.5f, 5));
	animation::start(ninjaskeli_guy);
	set_depth(ninjaskeli_guy,fixed_depth::below);
	
	
	ninjaskeli_guy2 = add_entity("NinjaSkeli", "sneaking");
	set_position(ninjaskeli_guy2, vec(43.5f, 5));
	animation::start(ninjaskeli_guy2);
	set_depth(ninjaskeli_guy2,fixed_depth::below);
}

[group ninjaskeli]
void ninjaskeli()
{
	player::lock(true);
	set_direction(get_player(), direction::right);
	
	set_atlas(ninjaskeli_guy, "nothiding");
	animation::start(ninjaskeli_guy);
	wait(0.2);
	
	narrative::show();
	narrative::set_expression("ninjaskeliexpr", "face");
	
	fsay("NYEH HEH HEH HEH HEH\nHEH HEH HEH HEH HEH...");
	narrative::set_expression("ninjaskeliexpr", "cough_talk");
	nl("*cough* *cough*");
	
	fsay("*HAK* *cough* *HAK*\nUGH *cough* *cough*");
	narrative::set_expression("ninjaskeliexpr", "umm_talk");
	nl("...");
	
	fsay("HA.");
	wait(0.4);
	fnl("HA.");
	wait(0.4);
	nl("HA.");
	
	narrative::set_expression("ninjaskeliexpr", "chill_talk");
	say("Hello janky fella");
	fnl("You may call me...");
	wait(0.2);
	nl("Ninja Billy");
	
	say("Or...\nby my nickname...");
	say("Super sexy ninja that is\nbigger than the universe\nand is the best...");
	say("at everything with\nnothing better to do\n-Sempai");
	
	say("You know what really\ngets me going?");
	narrative::set_expression("ninjaskeliexpr", "umm_talk");
	say("HOLES!");
	nl("LOTS AND LOTS OF HOLES!");
	say("This might be the last\ntime we meet...");
	say("So REMEMBER my name.");
	nl("For I am GREAT!");
	narrative::end();
	set_atlas(ninjaskeli_guy, "hiding");
	player::lock(false);
	group::enable("ninjaskeli", false);
}


[group ninjaskeli2]
void ninjaskeli2()
{
	
	player::lock(true);
	set_direction(get_player(), direction::right);
	
	set_atlas(ninjaskeli_guy2, "nothiding");
	animation::start(ninjaskeli_guy2);
	wait(0.2);
	
	narrative::show();
	narrative::set_expression("ninjaskeliexpr", "chill_talk");
	
	say("We meet again.\nThis must be fate.");
	say("");
	say("They are so creepy\nthey put shivers\ndown my....");
	narrative::set_expression("ninjaskeliexpr", "face");
	fsay("BONES!");
	wait(0.2);
	fnl("NYEH HEH HEH HEH HEH HEH\nHEH HEH~");
	narrative::set_expression("ninjaskeliexpr", "cough_talk");
	append(" *cough* *cough*");
	
	narrative::end();
	player::lock(false);
	group::enable("ninjaskeli", false);
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
