if !instance_exists(obj_player1) exit;
if global.panic exit;
if room == plage_entrance && obj_player1.character == "N" && obj_music.music.event_name != "event:/neons-extras/levels/Neon_Stage"
{
    with(obj_music)
    {
        fmod_event_instance_stop(music.event, true);
        fmod_event_instance_release(music.event, true);
        music.event_name = "event:/neons-extras/levels/Neon_Stage";
        music.event = fmod_event_create_instance(music.event_name);
        fmod_event_instance_play(music.event);
    }
}