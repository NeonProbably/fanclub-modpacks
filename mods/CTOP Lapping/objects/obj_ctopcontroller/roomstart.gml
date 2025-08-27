var modded_instance_exists = function(objname)
{
    var create = false
    with(obj_mod_object)
    {
        if __OBJECT == objname
            create = true
    }
    return create
}

if room == tower_finalhallway && global.laps == 2 && !modded_instance_exists(obj_exitrubble) && (check_lap_mode(2))
{
    instance_destroy(obj_pizzaface, false)
    instance_create(0, 0, obj_exitrubble)
}
if variable_global_exists("leveltosave") && (check_lap_mode(2))
{
    if global.leveltosave == "exit" && global.laps != 0
    {
        with(obj_baddie)
        {
            if !escape
                instance_destroy(id, false)
        }
        var listtokill = [obj_shotgunblock, obj_ratblock]
        
        for (var i = 0; i < array_length(listtokill); i++)
        {
            var shoo = listtokill[i];
        
            with (shoo)
            {
                if (!place_meeting(x, y, obj_secretportal))
                {
                    ds_list_add(global.saveroom, id);
                    instance_destroy(id, false);
                }
            }
        }
        instance_destroy(obj_pizzaball, false)
        instance_destroy(obj_pizzaballblock, false)
    }
    /*if global.leveltosave == "exit" && global.laps == 2 && room != timesuproom && room != rank_room
    {
        layer_create(-1000, "CTOP_Foreground");
        var fg_id = layer_get_id("CTOP_Foreground")
        var fg_create = layer_background_create(fg_id, global.ctoplap_sprites.bg_l3ctopforeground)
        var fg = layer_background_get_id(fg_create)
        layer_background_vtiled(fg, true)
        layer_background_htiled(fg, true)
    }*/
}

if room == tower_entrancehall && global.laps == 2 && (check_lap_mode(2))
{
    with instance_create(188, 635, obj_minipillar)
    {
        image_yscale = 3
        visible = false
    }
    
}
if room == tower_escape8 && global.laps != 0 && (check_lap_mode(2))
{
    instance_create(1792, 832, obj_escapecollectbig)
    instance_create(1152, 1184, obj_escapecollectbig)
    instance_create(1696, 480, obj_escapecollectbig)
    instance_create(1606, 1926, obj_escapecollectbig)
}
if room == tower_escape9 && global.laps != 0 && (check_lap_mode(2))
    instance_create(976, 818, obj_escapecollectbig)