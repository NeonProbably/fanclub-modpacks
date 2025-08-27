if room == Mainmenu
{
    instance_deactivate_object(obj_music);
    instance_deactivate_object(obj_mainmenu);
}
sound_play_centered("event:/sfx/ui/select");

var bg_x = obj_option.bg_x
var bg_y = obj_option.bg_y

instance_deactivate_object(obj_option);
instance_deactivate_object(obj_modlist);
instance_deactivate_object(obj_pause);
var s = instance_create(0, 0, obj_dmsettings)

s.bg_x = bg_x
s.bg_y = bg_y
