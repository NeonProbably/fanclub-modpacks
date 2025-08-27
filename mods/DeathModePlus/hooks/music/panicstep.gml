if MODIFIERS.DeathMode
{
	if fmod_event_instance_is_playing(panicmusicID)
        fmod_event_instance_stop(panicmusicID, true)
    return false
}
