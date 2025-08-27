if !drawstatic
    fmod_event_instance_stop(snd, true)

with(obj_player1)
    var dist = distance_to_object(obj_exitgate)
    
var create = true
    
with(obj_mod_object)
{
    if __OBJECT.name == "obj_chaser" // maaaybee there could be a random rerun? idk
        create = false
}

if drawstatic
    create = false
if (dist > 125 || room == trickytreat_2 || global.laps > 1) && create
{
    if global.laps < 1
    {
        drawstatic = true
        alarm[1] = 30
    
        fmod_event_instance_play(snd);
    }
    else
        alarm[1] = 1
}

if instance_exists(obj_genericdeath) || room == timesuproom || room == rank_room
    fmod_event_instance_stop(snd_chase, true);

if !create && !instance_exists(obj_cosmicclone)
{
    with (obj_music)
    {
        if (music != -4)
        {
            if (obj_pause.pause)
            {
                fmod_event_instance_stop(music.event, true);
                fmod_event_instance_stop(music.event_secret, true);
            }
            else
            {
                fmod_event_instance_stop(music.event, false);
                fmod_event_instance_stop(music.event_secret, false);
            }
        }
        fmod_event_instance_stop(pillarmusicID, true);
        fmod_event_instance_stop(panicmusicID, true);
        cyop_freemusic();
    }
}