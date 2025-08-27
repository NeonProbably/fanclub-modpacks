// original code by Electro Pea (edited by justxyz_h)

if !instance_exists(tracker)
{
    tracker = instance_create(0, 0, obj_objecticontracker)
    tracker.objectID = id
    tracker.image_speed = 0.5
    tracker.sprite_index = spr_icon_pizzagooch
    tracker.depth = -700
}

var playerid = MOD_GLOBAL.playerid
var inradius = point_in_circle(x, y, playerid.x, playerid.y, 250)
var dir = point_direction(x, y, (playerid.x + playerid.hsp), (playerid.y + playerid.vsp))
var next_pos = point_direction(x, y, (x + hsp), (y + vsp))
    
var mvsp = maxspeed + abs(obj_player1.hsp)/8
    
if (playerid.state == states.comingoutdoor) ||
    (playerid.state == states.shotgun) {
    _active = false
    alarm[0] = 60
    alarm[2] = 10
}
else if _active == false
{
    if alarm[0] == -1
        alarm[0] = 60
    image_alpha = 1 - (alarm[0]/60)
}

var time = MOD_GLOBAL.core.time
spd_mult = 0

switch mood
{
    case 0: // docile
        sprite_index = spr_docile
    var hallwaybuffer = 40
        tracker.sprite_index = spr_icon_pizzagooch
        spd_mult = 0.44
        break
    case 1:
        sprite_index = spr_to_angry
        tracker.sprite_index = spr_icon_pizzaface
        break
    case 2: // angry
        sprite_index = spr_angry
        tracker.sprite_index = spr_icon_pizzaface
        spd_mult = 1.75
        break
    case 3:
        sprite_index = spr_to_docile
        tracker.sprite_index = spr_icon_pizzagooch
        break
}

mvsp *= spd_mult

var turnspd = mvsp/50

if playerid.cutscene || _active == false {
    state = 0
    exit
}

if _active
{
    with playerid
    {
        if (place_meeting(x, y, other)) && !instance_exists(obj_taxitransition) && !instance_exists(obj_spaceshuttlecutscene) && ((x == clamp(x, 0, room_width)) && (y == clamp(y, 0, room_height)))
        {
            instance_destroy(obj_fadeout)
            instance_destroy(obj_wartimer)
            targetDoor = "A"
            MOD_GLOBAL.core.active = false
            MOD_GLOBAL.core.alarm[0] = -1
            MOD_GLOBAL.core.alarm[1] = -1
            other.persistent = false
            scr_room_goto(timesuproom)
            state = states.timesup
            sprite_index = spr_Timesup
            image_index = 0
            if (isgustavo)
                sprite_index = spr_ratmount_timesup
            visible = true
            image_blend = c_white
            stop_music()
            fmod_event_one_shot("event:/music/timesup")
        }
    }

    switch(state)
    {
        case 1: // chase
            hsp = Approach(hsp, lengthdir_x(mvsp, dir), turnspd)
            vsp = Approach(vsp, lengthdir_y(mvsp, dir), turnspd)

            if (inradius && (!end_turn))
            {
                state = 0
                saved_angle = dir
                if ((saved_angle - 10) <= next_pos && (saved_angle + 10) >= next_pos)
                    state = 1
            }
            else if (!inradius)
                end_turn = 0
            break
        case 0: // brake
            hsp = Approach(hsp,0,turnspd)
            vsp = Approach(vsp,0,turnspd)

            if (abs(hsp) <= 0 && abs(vsp) <= 0)
            {
                state = 1
                end_turn = 1
            }
            break
    }
}
x += hsp
y += vsp

