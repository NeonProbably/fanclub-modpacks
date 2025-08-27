if (instance_exists(obj_endlevelfade))
{
    instance_destroy();
    exit;
}

brickscroll += brickscrollamount;
x += hsp;
y += vsp;
fmod_event_instance_set_3d_attributes(snd, ((x + width) < obj_player1.x) ? (x + width) : obj_player1.x, obj_player1.y);

if (!fmod_event_instance_is_playing(snd))
    fmod_event_instance_play(snd);

var fademusic = 0;
var xcheck = obj_player1.x;
var ycheck = obj_player1.y;
var check = 0;
var cx1 = camera_get_view_x(view_camera[0]);
var cx2 = cx1 + 960;
var cy1 = camera_get_view_y(view_camera[0]);
var cy2 = cy1 + 540;
var edgew = sprite_get_width(edgespr);
var edgew2 = sprite_get_width(edgespr) - 125;
var fadew = 500 + edgew;

if (!vertical)
{
    if (hsp >= 0)
    {
        fademusic = fadew - point_distance(((x + width) < obj_player1.x) ? (x + width) : obj_player1.x, 0, obj_player1.x, 0);
        
        if ((x + width + edgew) > obj_player1.x)
            xcheck = x + width + edgew;
    }
    else
    {
        fademusic = fadew - point_distance((x > obj_player1.x) ? x : obj_player1.x, 0, obj_player1.x, 0);
        
        if ((x - edgew) < obj_player1.x)
            xcheck = x - edgew;
    }
}
else
{
    fademusic = fadew - point_distance(0, ((y + height) < obj_player1.y) ? (y + height) : obj_player1.y, 0, obj_player1.y);
    
    if ((y + height + edgew) > obj_player1.y)
        ycheck = y + height + edgew;
}

fademusic = clamp(fademusic, 0, fadew);
fademusic /= fadew;
playerAlpha = 1 - fademusic;
var _dolose = 0;

with (obj_player1)
{
    var d = point_distance(x, y, xcheck, ycheck);
    
    if (d > (400 + edgew) && !other.lost && other.practicecaught == false && !instance_exists(obj_fadeout))
    {
        other.lost = 1;
        _dolose = 1;
    }
    
    other.playerAlpha = clamp((900 - d) / 900, 0, 1);
    
}

if (_dolose == 1)
{
    with(obj_player)
    {
        fmod_event_instance_stop(other.snd, 1);
        instance_destroy(obj_fadeout);
        targetDoor = "A";
        room = timesuproom;
        state = states.timesup;
        sprite_index = spr_Timesup;
        image_index = 0;
        
        if (isgustavo)
            sprite_index = spr_player_ratmounttimesup;
        
        visible = true;
        image_blend = c_white;
        image_alpha = 1
        stop_music();
        fmod_event_one_shot("event:/music/timesup");
        other.persistent = 0;
        instance_destroy(other);
    }
}

if (vertical && room_width > width)
    x = obj_player1.x - 1024;
else if (!vertical && room_height > height)
    y = obj_player1.y - 1024;
