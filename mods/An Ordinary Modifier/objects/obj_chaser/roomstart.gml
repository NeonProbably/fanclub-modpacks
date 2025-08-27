state = "spawning"
image_alpha = 0
sprite_index = global.modifier_ordinary.spr_humanspawning
hsp = 0
vsp = 0
movespeed = 5
STOPFUCKINGDOINGTHAT = false
gobacktonormal = 0
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