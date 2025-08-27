if variable_global_exists("jukebox")
{
if MODIFIERS.DeathMode
{
    if !fmod_event_instance_is_playing(MOD_GLOBAL.mus_dm) && alarm[0] >= 1 && global.jukebox == -4
        fmod_event_instance_play(MOD_GLOBAL.mus_dm)

    if fmod_event_instance_is_playing(MOD_GLOBAL.mus_dm) && alarm[0] >= 1 && global.jukebox != -4
        fmod_event_instance_stop(MOD_GLOBAL.mus_dm,false)

    fmod_event_instance_set_volume(MOD_GLOBAL.mus_dm, global.option_music_volume)

	if instance_exists(obj_music)
	{
        with(obj_music)
        {
            if variable_instance_exists(music, "event")
            {
                if fmod_event_instance_is_playing(music.event)
                    fmod_event_instance_stop(music.event, false)
            }

            cyop_freemusic()
        }
    }
}
}