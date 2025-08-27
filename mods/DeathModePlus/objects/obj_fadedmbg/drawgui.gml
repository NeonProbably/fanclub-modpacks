// bg transition
bg_x -= 1
bg_y -= 1
draw_set_alpha(alarm[0] / timer_amount)
draw_sprite_tiled(MOD_GLOBAL.options_bg, 0, bg_x, bg_y)
draw_set_alpha(1)
