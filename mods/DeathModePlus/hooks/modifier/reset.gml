MODIFIERS.DeathMode = false
if !instance_exists(obj_chunktimer)
{
    var ct = instance_create(0, 0, obj_chunktimer)
    ct.depth = -70
}
if instance_exists(MOD_GLOBAL.core)
{
    MOD_GLOBAL.core.data_loaded = false
    MOD_GLOBAL.core.data_selected_entry = -1
    MOD_GLOBAL.core.active = false
    MOD_GLOBAL.core.show_text = false
    MOD_GLOBAL.core.collect_data = []
}
MOD_GLOBAL.timer_reached_zero = false
with obj_mod_object
{
    if __OBJECT.name == "obj_pizzaface_dm"
        instance_destroy(id, true)
}
