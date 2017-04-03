entity fade_left;
entity fade_right;

entity wacker;


void billywackergame()
{
	wacker = add_character("billywackclone");
	set_position(wacker, vec(3.5, 5.5));
	while(yield())
	{
		set_atlas(wacker, "dance");
		animation::start(wacker);
		wait(1);
		stop_animation(wacker);
		pathfind_move(wacker, get_position(get_player()), 4);
		set_atlas(wacker,"attack");
		animation::start(wacker);
		wait(0.3);
		if (get_position(get_player()).distance(get_position(wacker)) <= 1)
		{
			fx::sound("bad");
			music::stop();
			wait(1);
		}
		wait(0.3);
		animation::stop(wacker);
	}
}

[group happy_mushroom]
void happy_mushroom()
{
	say("It's a happy mushroom");
	narrative::end();
}

int nothing_phrase_index = 0;
[group nothinghere]
void nothinghere()
{
	switch(nothing_phrase_index)
	{
	case 0:
		say("There is nothing in here...");
		break;
	case 1:
		say("Don't stare for too long...");
		nl("You look weird.");
		break;
	case 2:
		say("Hmmmm...");
		break;
	case 3:
		say("You start questioning\nyour existence.");
		break;
	case 4:
		say("Why...?");
		break;
	case 5:
		say("It's so empty...");
		break;
	case 6:
		say("Hmmmmmmm...");
		break;
	}
	narrative::end();
	
	nothing_phrase_index = rand()%7;
}

entity treedoor;

[start]
void create_treedoor()
{
	treedoor = add_entity("forest", "tree");
	set_position(treedoor, vec(3.5, 2));
}

[group billyhere]
void billyhere()
{
	if (has_flag("billy1"))
	{
		nothinghere();
		return;
	}
	
	music::stop();
	
	fx::sound("billylaugh2");
	
	entity billy = add_character("someguy");
	set_position(billy, vec(3.5, 3.5));
	set_atlas(billy, "dance");
	start_animation(billy);
	say("BOOOO!");
	say("Billy has given you a frighten!");
	
	set_atlas(billy, "talk");
	narrative::set_speaker(billy);
	say("You have found me!");
	say("I'll unlock the tree door\nfor you.");
	narrative::hide();
	focus::move(midpoint(get_position(get_player()), vec(3.5, 2.2)), 1);
	move(billy, vec(3.5, 2.2), speed(2));
	
	create_thread(function(args){ fx::fade_out(treedoor, 1); remove_entity(treedoor); });
	
	{
		scoped_entity leaves = add_entity("leavesinwind");
		set_position(leaves, vec(4, 3.5));
		start_animation(leaves);
		wait(1);
	}
	
	set_atlas(billy, "talk");
	say("Now find the rest of US!");
	
	fx::sound("billylaugh1");
	
	create_thread(function(args){ move(entity(args["e"]), direction::up, 3, speed(2)); }, dictionary = {{"e", billy}});
	say("HEH HEH HEH");
	narrative::end();
	
	group::enable("blocked", false);
	
	focus::move(get_position(get_player()), 1);
	focus::player();
	player::lock(false);
	
	set_flag("billy1");
}

[start]
void create_side_fades()
{
	const float distance = .45;
	fade_left = add_entity("fade", "fade_left");
	set_anchor(fade_left, anchor::topleft);
	make_gui(fade_left, 0);
	set_position(fade_left, vec(-distance, 0));
	
	fade_right = add_entity("fade", "fade_right");
	set_anchor(fade_right, anchor::topright);
	make_gui(fade_right, 0);
	set_position(fade_right, pixel(get_display_size().x, 0) + vec(distance, 0));
}

void add_bush(vec pPosition)
{
	entity bush = add_entity("forest", "bush");
	set_position(bush, pPosition);
}


void add_tree(vec pPosition)
{
	entity tree = add_entity("forest", "tree");
	set_position(tree, pPosition);
}

void add_mushroom(vec pPosition)
{
	entity mushroom = add_entity("forest", "mushroom");
	set_position(mushroom, pPosition);
	animation::start(mushroom);
}

[start]
void create_bushes()
{
	add_mushroom(vec(1.5, 8.5));
	add_bush(vec(2.5, 7.5));
	add_bush(vec(5.5, 8.5));
	add_bush(vec(5.5, 6.5));
	add_bush(vec(3.5, 4.5));
	add_bush(vec(2.5, 2.5));
}

entity billy;

[start]
void create_billy()
{
	billy = add_character("someguy");
	set_position(billy, vec(3.5, 6.5));
	set_direction(billy, direction::down);
	set_color(billy, 0, 0, 0);
}

[group billy]
void introduce_billy()
{
	player::lock(true);
	
	focus::move(midpoint(get_position(get_player()), get_position(billy)), 1);
	
	set_atlas(billy, "talk");
	narrative::set_speaker(billy);
	say("You made it!");
	say("I has introduce myself!");
	narrative::hide();
	
	entity clone1 = add_character("billyclones");
	set_position(clone1, vec(2.5, 7.4));
	set_color(clone1, 0, 0, 0);
	move(clone1, vec(3, 6.5), speed(2));
	set_direction(clone1, direction::down);
	
	entity clone2 = add_character("billyclones");
	set_position(clone2, vec(5.5, 6.4));
	set_color(clone2, 0, 0, 0);
	move(clone2, vec(4, 6.5), speed(2));
	set_direction(clone2, direction::down);
	
	
	say("I have...");
	
	fx::sound("heh");
	music::stop();
	
	set_color(billy, 255, 255, 255);
	set_color(clone1, 255, 255, 255);
	set_color(clone2, 255, 255, 255);
	
	set_atlas(clone1, "dance");
	set_atlas(clone2, "dance");
	animation::start(clone1);
	animation::start(clone2);
	
	remove_entity(fade_left);
	remove_entity(fade_right);
	
	say("A BILLY!");
	
	music::open("doodle90");
	
	animation::stop(clone1);
	animation::stop(clone2);
	set_atlas(clone1, "talk");
	set_atlas(clone2, "talk");
	
	set_atlas(billy, "talk");
	say("I have a very happy to see\nsomeone new.");
	say("No soul other than WE down\nhere...");
	say("Don't have a worry.");
	nl("We just want to have a fun!");
	say("I have know! Lets play\na hide and go seek!");
	
	create_thread(function(args){
		move(entity(args["e"]), direction::up, 1, speed(2));
		scoped_entity wind = add_entity("leavesinwind");
		set_position(wind, get_position(entity(args["e"])));
		animation::start(wind);
		fx::sound("wind1");
		wait(1);
	}
	, dictionary = {{"e", clone1}});
	create_thread(function(args){
		move(entity(args["e"]), direction::up, 4, speed(2));
		remove_entity(entity(args["e"])); }
	, dictionary = {{"e", clone2}});
	
	set_atlas(billy, "dance");
	animation::start(billy);
	narrative::clear_speakers();
	say("SCATTER!!");
	move(billy, direction::up, 3, speed(2));
	remove_entity(billy);
	
	narrative::hide();
	
	music::fade_volume(0, 1);
	
	wait(1);
	
	narrative::set_speaker(clone1);
	set_atlas(clone1, "talk");
	wait(1);
	say("Big billy has spoken.");
	
	pathfind_move(clone1, (get_position(get_player()) + vec(0, -2)).floor(), 2);
	
	say("He is... ");
	set_texture(clone1, "billywackclone");
	append("HAPPY you are here.");
	narrative::end();
	
	focus::move(get_position(get_player()), 1);
	focus::player();
	player::lock(false);
	
	group::enable("billy", false);
	
	music::open("FX_deepvibes");
	music::volume(100);
	billywackergame();
}

[start]
void start()
{
	set_position(get_player(), vec(3.5, 16.5));
	set_direction(get_player(), direction::up);
	music::open("doodle89");
}

