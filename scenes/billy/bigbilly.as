#include "../backend/shadows.as"
#include "../backend/float.as"

[start]
void start()
{
	music::open("FX_deepvibes");

	set_position(get_player(), vec(4.5, 8.5));
	
	entity bigbilly = add_entity("bigbilly");
	set_position(bigbilly, vec(4.5, 0.5));
	set_z(bigbilly, 0.5);
	shadows::add(bigbilly, shadows::shadow_size::big);
	
	//focus::move(vec(3.5, 6.5), 2);
	
	create_thread(function(args)
	{
		entity e = entity(args["e"]);
		float_entity(e, 0.2, 4, -1);
	}, dictionary = {{"e", bigbilly}});
	
	
}
