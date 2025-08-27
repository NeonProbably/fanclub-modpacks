if !instance_exists(obj_lap2visual) || global.laps != 2 || !check_lap_mode(2) || global.leveltosave != "exit"
    exit;

obj_lap2visual.visible = 0

xx = obj_lap2visual.x + irandom_range(-1, 1)
yy = obj_lap2visual.y + irandom_range(-1, 1)
draw_set_colour(c_white);
draw_sprite(global.ctoplap_sprites.spr_lap3CTOP, 0, xx, yy)