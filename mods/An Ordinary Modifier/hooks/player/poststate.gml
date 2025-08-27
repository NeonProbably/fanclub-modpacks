var create = true
with(obj_mod_object)
{
    if __OBJECT.name == "obj_chasercontroller" // maaaybee there could be a random rerun? idk
        create = false
}
if MODIFIERS.OrdinaryModifier && create && room != trickytreat_1 && state != states.actor && !instance_exists(obj_titlecard) && state != states.victory
{
    instance_create(0, 0, obj_savefilecreated)
    instance_create(obj_player1.xstart, obj_player1.ystart, obj_chasercontroller)
}
