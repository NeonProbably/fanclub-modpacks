if MODIFIERS.DeathMode
{
    with MOD_GLOBAL.core
    {
        lap_respawn_collects()
        time_add(panic_time - 15)
    }
}
