add_sprite = function(name, frames, xorigin, yorigin)
{
    var s = sprite_add(concat(MOD_PATH, "/sprites/", name, ".png"), frames, false, false, xorigin, yorigin);
    sprite_set_speed(s, 1, spritespeed_framespergameframe);
    return s;
}

global.ctoplap_sprites =
{
    spr_exitrubble_edge: add_sprite("spr_exitrubble_edge", 29, 266, 2),
    spr_exitrubble_space: add_sprite("spr_exitrubble_space", 1, 0, 0),
    sprite1122: add_sprite("sprite1122", 1, 0, 0),
    spr_pizzahead: add_sprite("spr_pizzahead", 16, 102, 86),
    spr_pizzahead_icon: add_sprite("spr_pizzahead_icon", 2, 46, 35),
    spr_lap3CTOPwarning: add_sprite("spr_lap3warning_CTOP", 1, 28, 27),
    bg_l3ctopforeground: add_sprite("bg_l3ctopforeground", 1, 0, 0),
    spr_lap3CTOP: add_sprite("spr_lap3CTOP", 1, 123, 0),
    spr_holdonfolks: add_sprite("spr_holdonfolks", 1, 0, 59)
}
instance_create(0, 0, obj_ctopcontroller)
//global.odetokys = fmod_event_create_instance("event:/ctoplap/odetopizzahead")
//global.backforseconds = fmod_event_create_instance("event:/ctoplap/backforseconds")