var panicID = argument0;
var event = argument1;

if event == "event:/tuc/music/panic" && !global.lap
{
    // Running out of time
    // ... but the song is unfinished, so do nothing
    
    secs = 60;
    if global.fill <= secs * 12
        fmod_event_instance_set_parameter(panicID, "state", 1, true);

}
if (obj_player1.character == "BO" && event == "event:/tuc/music/panic" && global.laps = 2 && check_lap_mode(2))
{
fmod_event_instance_set_parameter(panicID, "state", 20, true);
}
