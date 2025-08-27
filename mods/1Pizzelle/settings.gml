with obj_modlist
{
    buffer = 5;
}
sound_play_centered("event:/sfx/ui/select");

instance_deactivate_object(obj_option);
instance_deactivate_object(obj_modlist);
instance_deactivate_object(obj_pause);
instance_deactivate_object(obj_transfotip);
if room == Mainmenu
{ 
	instance_deactivate_object(obj_music);
	instance_deactivate_object(obj_mainmenu);
}

instance_create(0, 0, obj_modded_config);