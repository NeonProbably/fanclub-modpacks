if variable_global_exists("laps")
{
if REMIX && check_lap_mode(2)
{
    with (obj_objecticontracker)
    {
	    if (objectID.object_index == obj_pizzaface) && global.laps == 1 && global.leveltosave == "exit" && (global.lapmode != 1 || global.lap3duringinf)
	    {
		    sprite_index = global.ctoplap_sprites.spr_pizzahead_icon
		    image_speed = 0.25
	    }
    }
}
else if !instance_exists(obj_objecticontracker) && check_lap_mode(2)
{
    with(obj_pizzaface)
    {
        with instance_create(x, y, obj_objecticontracker)
        {
	        if global.laps == 1 && global.leveltosave == "exit" && check_lap_mode(2)
	        {
	            objectID = other.id
		        sprite_index = global.ctoplap_sprites.spr_pizzahead_icon
		        image_speed = 0.25
	        }
        }
    }
}

// cant be bothered to indent rn sorry
with(obj_tv)
{
	if global.laps == 1
		 timer_y = timer_ystart // so it cant remove the pizza time timer
}
if global.panic && global.laps != 2 && global.leveltosave == "exit" && global.fill <= 0
{
	with (obj_player)
    {
		instance_destroy(obj_fadeout);
		targetDoor = "A";
		room = timesuproom;
		state = states.timesup;
		sprite_index = spr_Timesup;
		image_index = 0;
		backtohubroom = tower_finalhallway;
		backtohubstartx = 206;
		backtohubstarty = 690;
            
		if (isgustavo)
			sprite_index = spr_player_ratmounttimesup;
            
		visible = true;
		image_blend = c_white;
		audio_stop_all();
		stop_music();
            
			fmod_event_one_shot("event:/music/timesup");
	}
}
}