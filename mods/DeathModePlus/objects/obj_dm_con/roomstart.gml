if MODIFIERS.DeathMode
{
    alarm[0] = 1;

    with obj_gustavo_war
		instance_destroy(id, false)
}

if room == rank_room || room == timesuproom || !MODIFIERS.DeathMode
{
    active = false
    show_text = false
    alarm[0] = -1
    alarm[1] = -1
    if fmod_event_instance_is_playing(MOD_GLOBAL.mus_dm)
        fmod_event_instance_stop(MOD_GLOBAL.mus_dm, false)
}
