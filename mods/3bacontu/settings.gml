

if room == Mainmenu
{
    instance_deactivate_object(obj_music);
    instance_deactivate_object(obj_mainmenu);
}
sound_play_centered("event:/sfx/ui/select");
instance_deactivate_object(obj_option);
instance_deactivate_object(obj_modlist);
instance_deactivate_object(obj_pause);
instance_deactivate_object(obj_transfotip);
//obj_transfotip
instance_create(0,0,obj_baconmenu)