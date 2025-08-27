if ((state = 9090) || (state = 9091))
{
     
            if punch_afterimage > 0
                punch_afterimage--;
            else
            {
                punch_afterimage = 5;
                with create_blue_afterimage(x, y, sprite_index, image_index, xscale)
                    playerid = other.id;
            }

}
if state = states.Sjump &&  character == "B2"
{
  move = key_left + key_right;
            if move != 0 && sprite_index == spr_superjump
            {
                if xscale != move
                {
                    movespeed = 0;
                    xscale = move;
                }
                hsp = movespeed * sign(move);
                movespeed = Approach(movespeed, 5, 0.5);
            }
}
/*
if state = states.comingoutdoor
{
	if floor(image_index) >= image_number - 2 && sprite_index  = spr_Timesup
	{
	
		
		if character == "B2" && room == medieval_1
		{
			state = states.animation;
			sprite_index = MOD_GLOBAL.spr_bacon2_gpt
			image_index = 0;
			xscale = 1;
			sound_play_3d("event:/sfx/playerN/freezerintro", x, y);
global.baconknight = 1
			exit;
		}
      }
}
if state = states.animation
{
if sprite_index = MOD_GLOBAL.spr_bacon2_gpt &&  (floor(image_index) == (image_number - 1) )
			{
				create_transformation_tip("[G] to swing with your mighty sword!");
				state = states.normal;
				
			}
}
*/
if sprite_index = spr_fireassground && character = "B2"
{
repeat (8)
			instance_create(x, y, obj_firemouthflame);
movespeed = 0;
				landAnim = false;
				alarm[5] = 2;
				alarm[7] = 60;
				hurted = true;

{
				state = states.normal;
				sprite_index = spr_idle;
				if isgustavo
				{
					state = states.ratmount;
					sprite_index = spr_ratmount_idle;
				}
				image_index = 0;
}

}