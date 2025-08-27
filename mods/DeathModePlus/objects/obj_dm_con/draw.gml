var grid = 0

if grid
{
	var grid_cell_size = 32
	draw_set_colour(c_black)
	draw_set_alpha(1)
	for (i = 0; i <= room_width; i = i + grid_cell_size)
		draw_line(i, 0, i, room_height)
	for (i = 0; i <= room_height; i = i + grid_cell_size)
		draw_line(0, i, room_width, i)
}

if MODIFIERS.DeathMode
{
    draw_set_alpha(1)
    with obj_baddie
    {
        if !variable_instance_exists(id,"mod_hp") exit;

        if MOD_GLOBAL.core.debug
        {
            draw_set_font(global.font_small);
            draw_set_colour(c_white);
            draw_set_align(fa_center);
            draw_text(x,y-64,mod_hp)
        }

        if mod_hp != 3
        {
            draw_sprite_part_ext(MOD_GLOBAL.baddie_healthbar,5,17,18,((86*mod_hp)/3),36,x+40+1,y-40+2,-1,1,c_white,1)
            draw_sprite(MOD_GLOBAL.baddie_healthbar,3,x,y)
            //draw_sprite(MOD_GLOBAL.baddie_healthbar,2-mod_hp,x,y)
            draw_sprite(MOD_GLOBAL.baddie_healthbar,mod_hp >= 3 ? 0 : 1,x,y)
        }
    }
}
