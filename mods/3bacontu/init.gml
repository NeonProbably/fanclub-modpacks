
MOD_GLOBAL.B2_snd_wallkick2 = fmod_event_create_instance("event:/bacon2/gpkick");
MOD_GLOBAL.B2_snd_wallkick = fmod_event_create_instance("event:/bacon2/wallkick");
//bacon2ballbouncev.png
add_sprite = function(name, frames, xorigin, yorigin)
{
    var s = sprite_add(concat(MOD_PATH, "/sprites/", name, ".png"), frames, false, false, xorigin, yorigin);
    sprite_set_speed(s, 1, spritespeed_framespergameframe);
    return s;
}
global.baconknight = 0
add_sigmasigma = function()
{
    var s = sprite_add(concat(MOD_PATH, "/sprites/", "sigmasigma", ".png"), 8, false, false, 125, 100);
    sprite_set_speed(s, 1, spritespeed_framespergameframe);
    return s;
}
MOD_GLOBAL.spr_bacon2_ball = add_sprite("bacon2ball", 8, 50, 50);
MOD_GLOBAL.spr_bacon2_ballvbounce = add_sprite("bacon2ballbouncev", 6,  50, 50);
MOD_GLOBAL.brian = add_sprite("brian2", 1,  50, 50);
MOD_GLOBAL.bgmenu = add_sprite("menubg", 1, 0, 0);
MOD_GLOBAL.ssotw = add_sigmasigma()
MOD_GLOBAL.spr_bacon2_ballhbounce = add_sprite("bacon2ballbounceh", 5, 50, 50);
MOD_GLOBAL.spr_bacon2_dance = add_sprite("dance", 250, 50, 50);
MOD_GLOBAL.spr_bacon2_dancer = add_sprite("spr_breakdance", 33, 50, 50);
MOD_GLOBAL.smilecodisk = add_sprite("BaconSmileDisc", 1, 202, 202);
MOD_GLOBAL.spr_bacon2_gpt = add_sprite("bacon2gpt", 8, 50, 50);
MOD_GLOBAL.lf = add_sprite("lonefirework", 3, 65, 65);
instance_create(0,0,obj_baconentrancemusic)
// Variables
ini_open(MOD_PATH + "/saveData.ini");


global.b2ent = ini_read_real("Mod", "b2ent", 0);
global.b2esc = ini_read_real("Mod", "b2esc", 0);
global.b2brk = ini_read_real("Mod", "b2brk", 0);
global.b2gpb = ini_read_real("Mod", "b2grb", 0);
global.b2mach = ini_read_real("Mod", "b2mach", 1);
global.b2gp = ini_read_real("Mod", "b2gp", 1);
global.b2ball = ini_read_real("Mod", "b2ball", 0);
// scapped variable before you could enable both movesets together
global.b2moves = ini_read_real("Mod", "b2moves", 0);
ini_close()
// New machs booo
MOD_GLOBAL.NEWm1 = add_sprite("NEWmachs/spr_mach1", 10, 50, 50);
MOD_GLOBAL.NEWm2 = add_sprite("NEWmachs/spr_mach", 10, 50, 50);
MOD_GLOBAL.NEWm3 = add_sprite("NEWmachs/spr_mach4", 3, 50, 50);
MOD_GLOBAL.NEWm3j = add_sprite("NEWmachs/spr_mach3jump", 8, 50, 50);
MOD_GLOBAL.NEWm3bst = add_sprite("NEWmachs/spr_mach3boost", 15, 50, 50);
MOD_GLOBAL.NEWm3ht = add_sprite("NEWmachs/spr_mach3hit", 6, 50, 50);
MOD_GLOBAL.NEWm3tf = add_sprite("NEWmachs/spr_mach3boostfall", 3, 50, 50);
// Old machs yeeeeah
MOD_GLOBAL.OLDm3 = add_sprite("OLDmachs/m3", 3, 50, 50);
MOD_GLOBAL.OLDm3bst = add_sprite("OLDmachs/mach3boost", 14, 50, 50);
MOD_GLOBAL.OLDm3j = add_sprite("OLDmachs/m3jmp", 6, 50, 50);
MOD_GLOBAL.OLDm1 = add_sprite("OLDmachs/m1", 9, 50, 50);
MOD_GLOBAL.OLDm2 = add_sprite("OLDmachs/m2", 8, 50, 50);
MOD_GLOBAL.OLDm3tf = add_sprite("OLDmachs/m3bf", 3, 50, 50);
// combo blyad
MOD_GLOBAL.fontcb = add_sprite("fontcmb", 10, 0, 0);
MOD_GLOBAL.b2st = add_sprite("b2st", 15, 480, 270);
global.b2cmbfn = font_add_sprite_ext(MOD_GLOBAL.fontcb , "0123456789", true, 0);
global.fart = 0
global.yeeeesss = 0
// Feeling Baconly Modifier
MOD_GLOBAL.spr_baconfeel_icon = sprite_add(MOD_PATH + "/sprites/BaconFeel/icon.png", 1, false, false, 0, 0);
//MODIFIERS.BaconFeel = false;