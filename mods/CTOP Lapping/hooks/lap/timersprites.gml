if global.leveltosave == "exit" && check_lap_mode(2)
{
    var struct = 
    {
        pizzaface1: spr_timer_tower,
        pizzaface2: spr_timer_tower,
        pizzaface3: spr_timer_tower,
        pizzafaceback: spr_timer_tower,
        pizzafaceparry: spr_timer_tower,
        pizzafacewait: spr_timer_tower
    }
    return struct;
}