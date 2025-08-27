
if character == "BO"
{	
	global.mach_colors = [( #ff84ed), ( #edff84)];
    	global.mach_colors_dark = [( #0F3979), (#5F0920)];
	
	global.blueimg_color = #E093FF;

	if (sprite_index == spr_grindjump && floor(image_index) == (image_number - 1))
	sprite_index = spr_mach2jump

	if (sprite_index == spr_mach2jump && grounded && vsp > 0)
        sprite_index = spr_mach4;

	#region EFFECT OVERRIDES

	if (instance_exists(obj_chargeeffect))
	if (obj_chargeeffect.sprite_index != MOD_GLOBAL.spr_chargeeffectBN)
	with (obj_chargeeffect)
	{	
	sprite_index = MOD_GLOBAL.spr_chargeeffectBN
	image_speed = 1;
	}
	
	if (instance_exists(obj_superslameffect))
	if (obj_superslameffect.sprite_index != MOD_GLOBAL.spr_superslameffectBN)
	with (obj_superslameffect)
	{
	sprite_index = MOD_GLOBAL.spr_superslameffectBN
	image_speed = 1;
	}
	
	#endregion

	#region SPR AND IMG SPEED OVERRIDES

	switch sprite_index
    {
	case spr_breakdance:
	tv_do_expression(MOD_GLOBAL.spr_tv_exprbreakdance);
	break;
	
	case spr_machroll:
	sprite_index = spr_backslide
	break;
	
	case spr_backslide:
	image_speed = abs(movespeed) / 15;
	break;

	case spr_machclimbwall:
	image_speed = 0.6;
	break;

	case spr_kungfuair2transition:
	case spr_kungfuair3transition:
	sprite_index = spr_kungfuair1transition;
	break;

	case spr_cheesepep_walljump:
	sprite_index = spr_cheesepepfall;
	break;
    }
	 
	#endregion

	#region STATES

	switch state
    {
		
        #region CROUCH

			case states.crouch:
				if scr_slapbuffercheck()
				{
					scr_resetslapbuffer();
					scr_modmove_crouchslide();
				}
            break;
        
        #endregion
		
		#region PUNCH AND FREEFALL
			
			case states.punch:
				if (scr_slapbuffercheck() && (sprite_index == spr_breakdanceuppercut || sprite_index == spr_breakdanceuppercutend))
				{
					fmod_event_one_shot_3d("event:/sfx/pep/superjumpcancel", x, y);
					if move != 0
					xscale = move
					scr_resetslapbuffer();
					state = "9501"
					sprite_index = spr_jetpackboost
					vsp = -4
					
					hsp = (clamp(movespeed, 10, 12) * xscale)
				}
				break;

			case states.freefall:
				if (scr_slapbuffercheck() && freefallsmash > 0)
				{
					fmod_event_one_shot_3d("event:/sfx/pep/superjumpcancel", x, y);
					if move != 0
					xscale = move
					scr_resetslapbuffer();
					state = "9501"
					sprite_index = spr_jetpackboost
					vsp = -4
					hsp = (clamp(movespeed, 10, 12) * xscale)
				}
				break;
				
		#endregion

		#region BNCANCEL

			case "9501":
				if scr_solid((x + xscale), y) && !place_meeting((x + xscale), y, obj_slope)
				{
					fmod_event_one_shot_3d("event:/sfx/pep/splat", x, y)
        				state = states.bump
        				image_index = 0
        				sprite_index = spr_wallsplat
				}
				else if grounded
				{
					sprite_index = spr_mach
					state = states.mach2
				}

				if (key_down && !grounded)
				{
					sprite_index = spr_dive
					state = states.tumble;
				}
			hsp = (clamp(movespeed, 10, 12) * xscale)
			movespeed = abs(hsp)

			image_speed = 0.35
			break;
		#endregion
		
		#region CHEESEBALL
		
		case states.cheesepepstick:
		vsp = (key_down - key_up) * 4;
		if (vsp < 0)
			sprite_index = spr_cheesepepstickside;
		else if (vsp > 0)
			sprite_index = spr_cheesepepstickside;
		if (vsp == 0)
			image_index = 0;
		if (floor(image_index) % 4 == 0 && vsp != 0)
		{
			create_debris(x + (12 * xscale), y, spr_slimedebris);
			sound_play_3d("event:/sfx/cheese/ground", x, y);
		}
		break;

		/*
		case states.cheesepep:
		if (check_solid(x + sign(movespeed), y) && !check_slope(x, y + 1) && !place_meeting(x + sign(movespeed), y, obj_ratblock))
	{
		state = states.cheesepepstick;
		sound_play_3d("event:/sfx/cheese/step", x, y);
		sprite_index = spr_cheesepepstickside;
		hsp = 0;
		vsp = 2;
		xscale = sign(movespeed);
		repeat (3)
			create_debris(x + (xscale * 30), y + random_range(-8, 8), spr_cheesechunk);
		movespeed = 0;
	}
		*/
		#endregion
    }

	#endregion

	#region OBJECT WITH

    if (instance_exists(obj_treasure) && state == states.gottreasure)
	with (instance_place(x, y, obj_treasure))
	{
	x = other.x + 51
	y = other.y - 70
	}
	
	if (instance_exists(obj_exitgustavo))
	{
		with (obj_exitgustavo)
		{
			if (image_xscale = -1)
			{
    				spr_fall = MOD_GLOBAL.spr_escapeguy_left;
				spr_idle = MOD_GLOBAL.spr_escapeguy_left;
    				image_xscale *= -1;
			}
			if (image_xscale = 1 && spr_idle != MOD_GLOBAL.spr_escapeguy_left)
			{
				spr_fall = MOD_GLOBAL.spr_escapeguy_right;
				spr_idle = MOD_GLOBAL.spr_escapeguy_right;
			}

			if (state == states.fall)
			{
				y = ystart - 18
				fmod_event_one_shot_3d("event:/tuc/sound/evilteleport", x, y)
				state = states.normal
			}
			if (state = states.normal)
			y = ystart - 18
		}
	}
}
