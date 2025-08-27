if global.laps == 2 && global.leveltosave == "exit" && check_lap_mode(2)
{
    instance_destroy(obj_pizzaface, false)
    var create = true
    with(obj_mod_object)
    {
        if __OBJECT == obj_exitrubble
            create = false
    }
    if create
        instance_create(0, 0, obj_exitrubble)
    return false;
}