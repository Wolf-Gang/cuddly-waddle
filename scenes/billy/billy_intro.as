
void add_tree(vec pPosition)
{
	entity tree = add_entity("forest", "tree");
	set_position(tree, pPosition);
}

[start]
void create_trees()
{
	// Todo
}

[start]
void start()
{
	set_position(get_player(), vec(5.5, 5.5));
	set_direction(get_player(), direction::up);
	music::open("doodle89");
}

