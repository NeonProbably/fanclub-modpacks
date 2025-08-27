sound_play("event:/sfx/ui/back")
if room == Mainmenu
{
    instance_activate_object(obj_music)
    instance_activate_object(obj_mainmenu)
}
instance_activate_object(obj_option)
obj_option.bg_x = bg_x
obj_option.bg_y = bg_y
instance_activate_object(obj_modlist)

var fade = instance_create(0, 0, obj_fadedmbg)
fade.depth = obj_modlist.depth + 1
fade.timer_amount = timer_amount
fade.alarm[0] = timer_amount
fade.bg_x = bg_x + 1
fade.bg_y = bg_y + 1

instance_activate_object(obj_pause)
