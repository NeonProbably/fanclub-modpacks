if !instance_exists(obj_player1) exit;
if  instance_exists(obj_cosmicclone) exit;
if global.panic exit;
if obj_music.music = -4 exit;
if global.b2ent = 0
{
if room == entrance_1 && obj_player1.character == "B2" && obj_music.music.event_name = "event:/music/w1/entrance"
{
    with(obj_music)
    {
        fmod_event_instance_stop(music.event, true);
        fmod_event_instance_release(music.event, true);
        music.event_name = "event:/bacon2/music/entrance";
        music.event = fmod_event_create_instance(music.event_name);
        fmod_event_instance_play(music.event);
//secret
    fmod_event_instance_stop(music.event_secret, true);
        fmod_event_instance_release(music.event_secret, true);
        music.event_secret_name = "event:/bacon2/music/secretjg";
        music.event_secret = fmod_event_create_instance(music.event_secret_name);
      //  fmod_event_instance_play(music.event_secret);
    }
}
}
if global.b2ent = 1
{
if room == entrance_1 && obj_player1.character == "B2" && obj_music.music.event_name != "event:/music/w1/entrance"
{
    with(obj_music)
    {
        fmod_event_instance_stop(music.event, true);
        fmod_event_instance_release(music.event, true);
        music.event_name = "event:/music/w1/entrance";
        music.event = fmod_event_create_instance(music.event_name);
        fmod_event_instance_play(music.event);
//secret
    fmod_event_instance_stop(music.event_secret, true);
        fmod_event_instance_release(music.event_secret, true);
        music.event_secret_name = "event:/music/w1/entrancesecret";
        music.event_secret = fmod_event_create_instance(music.event_secret_name);
      //  fmod_event_instance_play(music.event_secret);
    }
}
}