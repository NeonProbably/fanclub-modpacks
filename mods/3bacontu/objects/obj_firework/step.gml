vspeed = Approach(vspeed,-8,0.2)
	if (punch_afterimage > 0)
			punch_afterimage--;
		else
		{
			punch_afterimage = 5;
			with (create_mach3effect(x, y, sprite_index, image_index, true))
				image_xscale = 1
		}