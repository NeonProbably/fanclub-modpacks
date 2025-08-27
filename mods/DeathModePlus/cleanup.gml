instance_activate_object(obj_chunktimer)
if !instance_exists(obj_chunktimer)
{
    var ct = instance_create(0, 0, obj_chunktimer)
    ct.depth = -70
}
instance_deactivate_object(obj_chunktimer)
destroy_sounds([MOD_GLOBAL.sfx_collect_orig, MOD_GLOBAL.mus_dm_orig, MOD_GLOBAL.sfx_collect, MOD_GLOBAL.mus_dm])
