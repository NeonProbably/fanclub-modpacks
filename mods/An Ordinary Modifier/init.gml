add_sprite = function(name, frames, xorigin, yorigin)
{
    var s = sprite_add(concat(MOD_PATH, "/sprites/", name, ".png"), frames, false, false, xorigin, yorigin);
    sprite_set_speed(s, 1, spritespeed_framespergameframe);
    return s;
}
global.modifier_ordinary = 
{
    icon: add_sprite("icon", 1, 0, 0), // keep the icon arount 24x24 :)
    spr_static: add_sprite("spr_static", 4, 0, 0),
    spr_soul: add_sprite("spr_soul", 3, 22, 17),
    spr_humanspawning: add_sprite("spr_humanspawning", 10, 32, 28),
    spr_humanidle: add_sprite("spr_humanidle", 1, 32, 32),
    spr_humantransition1: add_sprite("spr_humantransition1", 4, 32, 28),
    spr_humanprepare: add_sprite("spr_humanprepare", 1, 32, 28),
    spr_humantransition2: add_sprite("spr_humantransition2", 3, 32, 28),
    spr_humanlaunch: add_sprite("spr_humanlaunch", 1, 32, 28),
    spr_playerN_idle: add_sprite("spr_playerN_idle_OUTLINE", 15, 50, 50),
    spr_savefile: add_sprite("spr_savefile", 1, 0, 0),
}
MODIFIERS.OrdinaryModifier = false