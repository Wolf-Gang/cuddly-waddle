
enum emote_type
{
	silence,
	surprise,
	question,
	angry,
	idea,
	frustrated,
	embarrassed
};

class emote
{
	entity em;
	entity target;
	
	void add_emote(entity tEntity, emote_type eType)
	{
	
		target = tEntity;

		switch(eType)
		{
			case emote_type::silence:
				em = add_entity("emotes", "silence");
				break;
			case emote_type::surprise:
				em = add_entity("emotes", "surprise");
				break;
			case emote_type::question:
				em = add_entity("emotes", "question");
				break;
			case emote_type::angry:
				em = add_entity("emotes", "angry");
				break;
			case emote_type::idea:
				em = add_entity("emotes", "idea");
				break;	
			case emote_type::frustrated:
				em = add_entity("emotes", "frustrated");
				break;	
			case emote_type::embarrassed:
				em = add_entity("emotes", "embarrassed");
				break;	
		}
		
		set_anchor(em, anchor::center);
		set_depth(em, fixed_depth::overlay);
		set_z(em, pixel(get_size(target)).y + 0.25);
		
		start_animation(em);
		set_position(em, get_position(target));
	}

	void remove_emote()
	{
		remove_entity(em);
		dprint("blaha");
	}	
};