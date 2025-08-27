var playerid = obj_player1

if image_alpha == 0
{
    x = playerid.x
    y = playerid.y
}
// thanky ou random reddit user
var cam = view_camera[0]
var x1 = camera_get_view_x(view_camera[0])
var y1 = camera_get_view_y(view_camera[0])
var x2 = x1 + camera_get_view_width(view_camera[0])
var y2 = y1 + camera_get_view_height(view_camera[0])
var _canspawn = true
var _move = (!instance_exists(obj_fadeout) && !obj_player1.cutscene) && obj_player1.sprite_index != spr_playerN_rocketstart
with(obj_player1)
{
    if ((state == states.taxi || state == states.victory || state == states.spaceshuttle || state == 106 && sprite_index == spr_rockethitwall || sprite_index = spr_shotgunpullout || state == states.keyget || state == states.gottreasure || state == states.door || state == states.spaceshuttle || state = states.portal || state == states.tube || state == states.comingoutdoor || state == states.actor) || (state == states.comingoutdoor && place_meeting(x, y, obj_exitgate)) || room == timesuproom || place_meeting(obj_player.x, obj_player.y, obj_secretportalstart))
        _canspawn = false
    
    if (global.gameplay && state == 297)
        _canspawn = false
}
if (obj_player1.state == states.cheesepep || obj_player1.state == states.cheesepepjump || obj_player1.state == states.cheesepepstick || obj_player1.state == states.cheesepepfling || obj_player1.state == states.cheeseball)
    var divide = 2
else
    var divide = 1

if place_meeting(x, y, obj_player1) && !instance_exists(obj_genericdeath) && state != "spawning" && _move
    instance_create(0, 0, obj_genericdeath)
if !_canspawn
{
    if !(image_alpha < 0)
        image_alpha -= 0.025
    state = "spawning"
    hsp = 0
    vsp = 0
}
switch state
{
    case "spawning":
        if _canspawn || image_alpha < 0.025
            image_alpha += 0.025
        if image_alpha >= 1
        {
            sprite_index = global.modifier_ordinary.spr_humanidle
            state = "normal"
        }
        
    break;
    
    case "normal":
        image_xscale = (playerid.x != x) ? sign(playerid.x - x) : image_xscale
        
        var _d = point_direction(x, y, playerid.x, playerid.y)
        var dist = distance_to_object(playerid);
            
        if _move
        {
            var newmovespeed = dist / 25 / divide
        
            if newmovespeed > (5 / divide)
                movespeed = newmovespeed
        }
        else
            movespeed = lerp(movespeed, 0, 0.2)

        hsp = lengthdir_x(movespeed / divide , _d)
        vsp = lengthdir_y(movespeed / divide, _d)
        
        if dist < 70
        {
            sprite_index = global.modifier_ordinary.spr_humantransition1
            image_index = 0
            state = "charge"
            image_index = 0
            waittimer = 50
            movespeed = 2
            hsp = 0
            vsp = 0
            sound_play_3d("event:/ordinary/sfx/prepareattackywacky", x, y)
        }
    break;
    
    case "charge":
        var _d = movespeed == 20 ? lastdir :  point_direction(x, y, playerid.x, playerid.y)
        if !STOPFUCKINGDOINGTHAT
            image_xscale = (playerid.x != x) ? sign(playerid.x - x) : image_xscale
        
        if waittimer > 0
            waittimer--
        else if gobacktonormal == 0 && !STOPFUCKINGDOINGTHAT
        {
            lastdir = _d
            sprite_index = global.modifier_ordinary.spr_humantransition2
            movespeed = 20
            gobacktonormal = 60
            STOPFUCKINGDOINGTHAT = true
            sound_play_3d("event:/ordinary/sfx/attackywacky", x, y)
        }
        
        else if gobacktonormal > 0 && waittimer <= 1 && !point_in_rectangle( x, y, x1, y1, x2, y2)
            gobacktonormal--
        else if gobacktonormal == 0 && waittimer <= 1
        {
            state = "normal"
            sprite_index = global.modifier_ordinary.spr_humanidle
            STOPFUCKINGDOINGTHAT = false
        }
        
        hsp = lengthdir_x(movespeed / divide, _d)
        vsp = lengthdir_y(movespeed / divide, _d)
    
}

if (floor(image_index) == (image_number - 1)) && sprite_index == global.modifier_ordinary.spr_humantransition1
    sprite_index = global.modifier_ordinary.spr_humanprepare
if (floor(image_index) == (image_number - 1)) && sprite_index == global.modifier_ordinary.spr_humantransition2
    sprite_index = global.modifier_ordinary.spr_humanlaunch
x += hsp
y += vsp

if room != timesuproom && room != rank_room
    obj_drawcontroller.kidsparty_lightning = true;
if instance_exists(obj_baddie)
{
    with(obj_baddie)
    {
        elite = true
        use_elite = true
        paletteselect = elitepal
        mod_buffer = 0
        first_frame = 1
        mod_stun_buffer = 0
        hp = 1;
        elitehp = hp;
    }
}
instance_destroy(obj_tutorialbook)