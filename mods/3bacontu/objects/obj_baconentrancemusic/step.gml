function animation_end()
{
    return floor(image_index) == (image_number - 1);
}
function chancer(percent) {
	return percent > random(1);
}
function blueafters()
{
  
}
function baconcheck()
{

 if obj_player1.character = "B2"
return true
else
return false
}
global.yeeeesss = id
function scr_player_bacontrick()
{
if key_down2
vsp = 17
if vsp >= 0 && grounded
{
if key_attack
{

{
state = states.mach3
if movespeed < 12
movespeed = 12
if (move != 0)
			xscale = move;

sprite_index = spr_mach4
}
}
else
{
state = states.normal

if (move != 0)
			xscale = move;
image_index = 0
sprite_index = spr_land

}
}
if (scr_slapbuffercheck() || key_attack2)
{
	scr_resetslapbuffer();
state = states.Sjump
vsp = 0;
				image_index = 2
				sprite_index = spr_Sjumpcancelstart;
		
				sound_instance_move(sjumpcancelsnd, x, y);
				//if CHAR_OLDNOISE
				//	sound_play_3d(sfx_woag, x, y);
				fmod_event_instance_play(sjumpcancelsnd);

}

//spr_mach2jump
if character = "B2"
{
image_speed = 0.45
if sprite_index != spr_Sjumpcancelstart && sprite_index != spr_mach4
sprite_index = MOD_GLOBAL.spr_bacon2_gpt
}
else
{
image_speed = 0.53
if sprite_index != spr_Sjumpcancelstart && sprite_index != spr_mach4
sprite_index = spr_mach2jump
}
	hsp = movespeed;
		if move != 0
		movespeed = Approach(movespeed, move * 13, 1);
	else
		movespeed = Approach(movespeed, 0, 0.5);
	move = key_right + key_left;
}
function scr_player_baconbounce()
{
 
 move = key_left + key_right
	scr_dotaunt();
hsp = xscale * movespeed
if !grounded
{
if key_down2
{
if (move != 0)
			xscale = move;
vsp = 17
}
if scr_solid(x,y - 1)
{
if character = "B2"
sprite_index = MOD_GLOBAL.spr_bacon2_ballvbounce 
   sound_play_3d("event:/bacon2/ballbounce", x, y);
vsp=17
}

if key_jump2
{
	
		if scr_solid(x + xscale,y) && !place_meeting(x + xscale,y,obj_destructibles)
{
if character = "B2"
sprite_index = MOD_GLOBAL.spr_bacon2_ballhbounce 
xscale*=-1
   sound_play_3d("event:/bacon2/ballbounce", x, y);
vsp=-12

}
}
if (scr_slapbuffercheck() || key_attack2)
{
	scr_resetslapbuffer();
vsp = 0;
		if (move != 0)
			xscale = move;
			

{
		{
			jumpstop = true;
			
				vsp = -4;
			flash = true;
if movespeed < 13
			movespeed = 13;
			image_index = 0;
			sprite_index = spr_Sjumpcancel;
			state = states.mach3;
			with (instance_create(x, y, obj_crazyrunothereffect))
				copy_player_scale(other);
		}
}
}
}
image_speed = 0.45
if sprite_index = MOD_GLOBAL.spr_bacon2_ballvbounce && animation_end()
sprite_index = MOD_GLOBAL.spr_bacon2_ball
if sprite_index = MOD_GLOBAL.spr_bacon2_ballhbounce && animation_end()
sprite_index = MOD_GLOBAL.spr_bacon2_ball
if character != "B2" && sprite_index != spr_Sjumpcancel && sprite_index != spr_mach4
sprite_index = spr_mach2jump
if vsp >= 0 && grounded
{
if key_attack
{


state = states.mach3
if movespeed < 12
movespeed = 12
if (move != 0)
			xscale = move;

sprite_index = spr_mach4

}
else
{
state = states.normal

if (move != 0)
			xscale = move;
image_index = 0
sprite_index = spr_land
}

}
}
instance_activate_object(self);

if instance_exists(obj_player1)
{
if obj_player1.character != "B2"
dancechance = false
/*
if obj_player1.character = "B2"
{
if dancechance = false
{
if (chancer(0.05))
{
with(obj_player1)
{
spr_breakdance = MOD_GLOBAL.spr_bacon2_dance 
}
}
dancechance = true
}
}
*/
with(obj_player1)
{
if state != spr_Sjumpcancelstart 
global.fart = 0
if character = "B2"
{

if state = states.Sjump && sprite_index = spr_Sjumpcancelstart && floor(image_index) = 0

{


other.alarm[2] = 6


}
}

if !baconcheck()
exit;

if character = "B2"
{
if state != 9090
{
if (sprite_index = MOD_GLOBAL.spr_bacon2_ballvbounce || sprite_index = MOD_GLOBAL.spr_bacon2_ballhbounce || sprite_index = MOD_GLOBAL.spr_bacon2_ball) 
state = states.normal
}
if global.b2mach  = 1
{
spr_mach4 = MOD_GLOBAL.NEWm3
spr_mach3jump = MOD_GLOBAL.NEWm3j
spr_mach3hit = MOD_GLOBAL.NEWm3ht
spr_mach1 = MOD_GLOBAL.NEWm1
spr_mach3boost = MOD_GLOBAL.NEWm3bst
spr_mach = MOD_GLOBAL.NEWm2
spr_mach3boostfall = MOD_GLOBAL.NEWm3tf
}
else
{
spr_mach4 = MOD_GLOBAL.OLDm3
spr_mach1 = MOD_GLOBAL.OLDm1
spr_mach = MOD_GLOBAL.OLDm2
spr_mach3jump = MOD_GLOBAL.OLDm3j
spr_mach3boost = MOD_GLOBAL.OLDm3bst
spr_mach3hit = MOD_GLOBAL.OLDm3
spr_mach3boostfall = MOD_GLOBAL.OLDm3tf
}
if global.b2brk = 1
spr_breakdance = MOD_GLOBAL.spr_bacon2_dance
else
spr_breakdance = MOD_GLOBAL.spr_bacon2_dancer
if state = states.crouch
{
            if scr_slapbuffercheck()
            {
                scr_resetslapbuffer();
                scr_modmove_crouchslide();
            }
}
}
/*
used for referencee
MOD_GLOBAL.spr_bacon2_ball = sprite_add(MOD_PATH + "/sprites/bacon2ball.png", 9, false, false, 50, 50);
MOD_GLOBAL.spr_bacon2_ballvbounce = sprite_add(MOD_PATH + "/sprites/bacon2ballbouncev.png", 4, false, false, 50, 50);
MOD_GLOBAL.spr_bacon2_ballhbounce = sprite_add(MOD_PATH + "/sprites/bacon2ballbounceh.png", 4, false, false, 50, 50);
*/
if !sound_is_playing(MOD_GLOBAL.B2_snd_wallkick) && state = 9090
fmod_event_instance_play(MOD_GLOBAL.B2_snd_wallkick);
if !sound_is_playing(MOD_GLOBAL.B2_snd_wallkick2) && state = 9091
fmod_event_instance_play(MOD_GLOBAL.B2_snd_wallkick2);
   if state = 9090
{
        sound_instance_move(MOD_GLOBAL.B2_snd_wallkick, x, y);
   fmod_event_instance_set_parameter(MOD_GLOBAL.B2_snd_wallkick, "state", 0, true);
}
    else if sound_is_playing(MOD_GLOBAL.B2_snd_wallkick) && state != states.backbreaker
        fmod_event_instance_set_parameter(MOD_GLOBAL.B2_snd_wallkick, "state", 1, true);
  if state = 9091
{
        sound_instance_move(MOD_GLOBAL.B2_snd_wallkick2, x, y);
   fmod_event_instance_set_parameter(MOD_GLOBAL.B2_snd_wallkick2, "state", 0, true);
}
    else if sound_is_playing(MOD_GLOBAL.B2_snd_wallkick2) && state != states.backbreaker
        fmod_event_instance_set_parameter(MOD_GLOBAL.B2_snd_wallkick2, "state", 1, true);
if ((state == 9090) || (state == 9091))
   global.force_blue_afterimage = true
if character = "B2"
{
    global.force_mach_shader = true;
    global.mach_colors = [( #922592), ( #259225)];
    global.mach_colors_dark = [( #ff2525), ( #922525)];

    global.blueimg_color =  #e352f6;
    global.blueimg_color_dark = #e352f6;
}
if global.b2gp = 0
{
if sprite_index = spr_groundpoundjump && key_jump2
{
vsp = -16
state = 9091
if character = "B2"
sprite_index = MOD_GLOBAL.spr_bacon2_ball
}
}
if global.b2ball = 0 || global.b2ball = 1
{
if global.b2ball = 1
{
if (sprite_index = spr_machroll && key_jump2 && grounded && !scr_solid(x + 27, y - 32) && !scr_solid(x - 27, y - 32) && !scr_solid(x, y - 32) && !scr_solid(x, y - 16))
{
vsp = -14
state = 9090
   sound_play_3d("event:/bacon2/ballbounce", x, y);
if character = "B2"
sprite_index = MOD_GLOBAL.spr_bacon2_ballvbounce
}
}
if sprite_index = spr_dive && grounded
{
vsp = -14
state = 9090
   sound_play_3d("event:/bacon2/ballbounce", x, y);
if character = "B2"
sprite_index = MOD_GLOBAL.spr_bacon2_ballvbounce
}
// noise shitfuck
if (sprite_index = spr_playerN_divebomb || sprite_index = spr_playerN_divebombfall || sprite_index = spr_playerN_divebombland) && grounded
{
vsp = -14
state = 9090
   sound_play_3d("event:/bacon2/ballbounce", x, y);
if character = "B2"
sprite_index = MOD_GLOBAL.spr_bacon2_ballvbounce
if move > 0
xscale = 1
if move < 0 
{
xscale = -1
movespeed = -movespeed
}
}
}
switch state
{
case 9090:
scr_player_baconbounce()
break
case 9091:
scr_player_bacontrick()
break
}
}
}
if instance_exists(obj_player1)
{
 if sound_is_playing(MOD_GLOBAL.B2_snd_wallkick2) &&  !baconcheck() 
        fmod_event_instance_set_parameter(MOD_GLOBAL.B2_snd_wallkick2, "state", 1, true);
 if sound_is_playing(MOD_GLOBAL.B2_snd_wallkick) &&  !baconcheck()
        fmod_event_instance_set_parameter(MOD_GLOBAL.B2_snd_wallkick, "state", 1, true);
if obj_player1.character = "B2"
{
if global.b2esc = 1
{
with(all)
{
if object_index = obj_itspizzatime
sprite_index = MOD_GLOBAL.ssotw
}
}
}
}
 if sound_is_playing(MOD_GLOBAL.B2_snd_wallkick2) && !instance_exists(obj_player1)
        fmod_event_instance_set_parameter(MOD_GLOBAL.B2_snd_wallkick2, "state", 1, true);
 if sound_is_playing(MOD_GLOBAL.B2_snd_wallkick) && !instance_exists(obj_player1)
        fmod_event_instance_set_parameter(MOD_GLOBAL.B2_snd_wallkick, "state", 1, true);
