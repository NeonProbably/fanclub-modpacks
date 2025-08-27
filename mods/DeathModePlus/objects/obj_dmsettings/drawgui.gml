// bg transition

if alarm[6] > 0
    draw_sprite_tiled(spr_optionsBG, 7, bg_x, bg_y)
draw_set_alpha((timer_amount - max(0, alarm[6])) / timer_amount)

draw_sprite_tiled(MOD_GLOBAL.options_bg, 0, bg_x, bg_y)
