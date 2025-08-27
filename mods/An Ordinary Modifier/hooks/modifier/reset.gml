with(obj_mod_object)
{
    if __OBJECT.name == "obj_chaser" || __OBJECT.name == "obj_chasercontroller"
    {
        if __OBJECT.name == "obj_chasercontroller"
            fmod_event_instance_stop(snd_chase, true)
        instance_destroy()
    }
}
MODIFIERS.OrdinaryModifier = false;