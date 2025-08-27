if (character == "BO")
{


if (state == states.grind && character == "BO")
{

    var slope = instance_place(x, y + 1, obj_grindrailslope);
    
    if (instance_exists(slope) && !place_meeting(x + hsp, y + vsp, obj_grindrail))
    {
        if (xscale != sign(slope.image_xscale))
            sprite_index = spr_grinddown;
        else
            sprite_index = spr_grindup;
    }
    else
    {
        sprite_index = !skateboarding ? spr_grind : spr_clown;
    }
	image_speed = 0.35;
	machhitAnim = false;
	crouchslideAnim = true;
	hsp = xscale * movespeed;
	if (movespeed < 10)
		movespeed = Approach(movespeed, 10, 0.5);
	if (!place_meeting(x, y + 18, obj_grindrail) && !place_meeting(x, y + 18, obj_grindrailslope))
	{
		if (movespeed < 12 || skateboarding)
		{
			state = states.mach2;
			sprite_index = spr_mach2jump;
		}
		else
		{
			state = states.mach3;
			sprite_index = spr_mach4;
		}
	}
	if (check_solid(x + xscale, y) && !place_meeting(x, y + 18, obj_grindrailslope) && !check_slope(x, y + 1))
	{
		if REMIX
		{
			instance_create(x + (10 * xscale), y + 10, obj_bumpeffect);
			fmod_event_one_shot_3d("event:/sfx/pep/bump", x, y)
		}
			xscale *= -1;
	}
	
	if (input_buffer_jump > 0)
	{
		input_buffer_jump = 0;
		vsp = IT_jumpspeed();
		jumpstop = false;
		if (skateboarding)
		{
			sprite_index = spr_clownjump;
			image_index = 0;
		}
		if (movespeed < 12 || skateboarding)
			state = states.mach2;
		else
			state = states.mach3;
		if (movespeed >= 12)
		sprite_index = spr_grindjump;
		else
		sprite_index = spr_mach2jump;
		image_index = 0;
	}
	if (!instance_exists(obj_grindeffect))
		instance_create(x, y, obj_grindeffect);

	return false;
}
}