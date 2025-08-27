if MODIFIERS.DeathMode
{
    with obj_baddie
    {
        if !variable_instance_exists(id,"mod_buffer") exit;
        if mod_buffer > 0
            mod_buffer--
    }
	
	with obj_tv
	{
		/*enum HUD_STYLES
		{
			final,
			old,
			april,
			minimal,
			debug
		}*/
		
		if !(global.hud == 0 || global.hud == 2)
			visible = false
	}
}
