if MODIFIERS.DeathMode
{
    MOD_GLOBAL.pizza_time_stop()

    if !data_loaded
    {
        data = MOD_GLOBAL.get_level_settings(global.leveltosave)

        if data.level == "none" && instance_exists(obj_cyop_loader)
            data = MOD_GLOBAL.get_level_settings(global.cyop_level_name)

        prep_time = 60 // 1 second
        time = 0 // no collects?
        panic_time = 0

        if data.level != "none"
        {
            time = 600 // default time (10 seconds, multiplied by 60 FPS)
            panic_time = 30 // default panic time (30 seconds)
            collect_data = data.collects
            data_loaded = true

            if variable_struct_exists(data, "properties") // properties
            {
                if variable_struct_exists(data.properties, "time")
                    time = data.properties.time * 60
            }
        }
    }
    if data_loaded
        collect_place()

    if !active
    {
        show_text = false
        pizzaface = noone
        with obj_mod_object
        {
            if __OBJECT.name == "obj_pizzaface_dm"
                instance_destroy(id, true)
        }
        alarm[1] = blink_timer
        shiftv = 1
    }
}
else
    fixed_fill = 0
