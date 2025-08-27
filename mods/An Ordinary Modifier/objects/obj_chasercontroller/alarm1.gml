var xe = instance_exists(obj_doorA) && instance_exists(obj_exitgate) ? obj_doorA.x : obj_player1.x
var ye = instance_exists(obj_doorA) && instance_exists(obj_exitgate) ? obj_doorA.y : obj_player1.y
if instance_exists(obj_player1)
    instance_create(xe, ye, obj_chaser)
drawstatic = false

if instance_exists(obj_cosmicclone) || global.jukebox
    exit;
    
fmod_event_instance_play(snd_chase)