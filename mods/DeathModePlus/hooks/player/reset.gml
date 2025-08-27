if MODIFIERS.DeathMode == true {
	MOD_GLOBAL.core.data_loaded = false
	MOD_GLOBAL.timer_reached_zero = false
	MOD_GLOBAL.core.alarm[0] = 1
	MOD_GLOBAL.core.active = false
	if fmod_event_instance_is_playing(MOD_GLOBAL.mus_dm)
        fmod_event_instance_stop(MOD_GLOBAL.mus_dm, false)
}
