// setup
mask = spr_player_mask
persistent = true
image_speed = 0.35
// the good shit
movespeed = 5
hsp = 0
vsp = 0
image_alpha = 0.025
state = "spawning"
sprite_index = global.modifier_ordinary.spr_humanspawning
gobacktonormal = 0
waittimer = 20
STOPFUCKINGDOINGTHAT = false
depth = obj_player1.depth - 1
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