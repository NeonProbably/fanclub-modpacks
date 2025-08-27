draw_set_color(c_white)
draw_sprite_tiled(MOD_GLOBAL.bgmenu,0,scroll/2,sin(scroll/128)*64)
draw_set_font(global.bigfont)
draw_set_valign(fa_top)

var offset = (array_length(optArr)+1)*20

draw_set_halign(fa_left)
if option != 0 draw_set_color(c_gray)
draw_text(SCREEN_WIDTH/8,(SCREEN_HEIGHT/2)-offset,"BACK")
draw_set_color(c_white)

i = 0
repeat (array_length(optArr))
{
    if i != option-1 draw_set_color(c_gray)
    else draw_set_color(c_white)
    draw_set_halign(fa_left)
    draw_text(SCREEN_WIDTH/8,(SCREEN_HEIGHT/2)-offset+(i+1)*40,string_upper(optArr[i].optname))
    draw_set_halign(fa_right)
    draw_text(SCREEN_WIDTH*7/8,(SCREEN_HEIGHT/2)-offset+(i+1)*40,string_upper(optArr[i].choices[variable_global_get(optArr[i].optvar)]))
    i += 1
}