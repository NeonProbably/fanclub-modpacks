add_modifier("OrdinaryModifier", #b75589, function(val) // first argument is the name of the modifier, second is the hex value that the background becomes, and the third one is for making the custom exmaple on tbhe screen
{
    if val
        draw_sprite_ext(global.modifier_ordinary.spr_playerN_idle, -1, width / 2, height / 2, 1, 1, 0, c_white, 1);
    else
        draw_sprite_ext(spr_playerN_idle, -1, width / 2, height / 2, 1, 1, 0, c_white, 1);
    draw_set_color(c_white)
    if val
        draw_sprite_ext(global.modifier_ordinary.spr_soul, -1, width / 2 + irandom_range(-1, 1), height / 1.6 + irandom_range(-1, 1), 0.5, 0.5, 0, c_white, 1)
});