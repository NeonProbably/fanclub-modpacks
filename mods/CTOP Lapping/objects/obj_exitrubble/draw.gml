
var wavex = Wave(-25, 25, 5, 5);
if room == tower_entrancehall && global.laps == 2
{
    draw_sprite(global.ctoplap_sprites.spr_holdonfolks, 1, -40, 707)
}
if (!surface_exists(drawsurf))
    drawsurf = surface_create(width, height);

if (surface_exists(drawsurf))
    surface_set_target(drawsurf);

draw_clear_alpha(#280040, 0);
draw_sprite_tiled_ext(global.ctoplap_sprites.spr_exitrubble_space, 0, width, height, width, height, c_white, 1);
surface_reset_target();
gpu_set_blendenable(false);

if (surface_exists(drawsurf))
    draw_surface(drawsurf, x, y);

gpu_set_blendenable(true);
var f = vertical ? width : height;
var w = x;
var h = y + height;
var ang = 90;

if (hsp >= 0)
    w += width;
else
    ang = -90;

var i = 0;

while (i < f)
{
    if (vertical)
        draw_sprite_ext(edgespr, image_index, x + i, h, 1, 1, 0, c_white, 1);
    else
        draw_sprite_ext(edgespr, image_index, w, y + i, 1, 1, ang, c_white, 1);
    
    i += sprite_get_height(edgespr);
}

if (playerAlpha < 1) && obj_player1.visible
{
    var pA = playerAlpha;
    
    obj_player1.image_alpha = playerAlpha
    with(obj_player1)
        draw_player()
   /// }
}
