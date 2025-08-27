if instance_exists(obj_lapportal) && global.leveltosave == "exit" && global.laps == 1 && check_lap_mode(2) && room == tower_lap
{
    if obj_lapportal.sprite_index == spr_pizzaportal
    {
        //show_message("try draw")
        draw_set_color(#262626)
        draw_rectangle(obj_lapportal.x - 30, obj_lapportal.y - 50, obj_lapportal.x + 30, obj_lapportal.y + 50, false) // to hide the L and 3 from the other warning
        draw_sprite(spr_pizzaportal, -1, obj_lapportal.x, obj_lapportal.y)
        draw_sprite(global.ctoplap_sprites.spr_lap3CTOPwarning, 0, obj_lapportal.x, obj_lapportal.y + Wave(-5, 5, 0.5, 5));
    }
}
var room_list = [tower_escape12, tower_escape11, tower_escape10, tower_escape9, tower_escape7, tower_escape6, tower_escape4, tower_escape3, tower_escape1]
if variable_global_exists("leveltosave")
{
    if (global.leveltosave == "exit" && global.laps == 2 && room != timesuproom && room != rank_room && !array_contains(room_list, room)) && (check_lap_mode(2))
    {
       /* layer_create(-1000, "CTOP_Foreground");
        var fg_id = layer_get_id("CTOP_Foreground")
        var fg_create = layer_background_create(fg_id, global.ctoplap_sprites.bg_l3ctopforeground)
        var fg = layer_background_get_id(fg_create) */
        var drawx = CAMX * -0.15;
        var drawy = CAMY * -0.15;
        draw_sprite_tiled(global.ctoplap_sprites.bg_l3ctopforeground, drawx, drawy, 0)
        //layer_background_vtiled(fg, true)
        //layer_background_htiled(fg, true)
    }
}
