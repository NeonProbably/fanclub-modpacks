if MODIFIERS.DeathMode // custom P rank
{


    var all_toppins = global.shroomfollow && global.cheesefollow && global.tomatofollow && global.sausagefollow && global.pineapplefollow

    var res = all_toppins && !MOD_GLOBAL.timer_reached_zero
    var sres = !MOD_GLOBAL.timer_reached_zero && global.collect > 20000
    if global.leveltosave != "cyop_secret"
    {
    MOD_GLOBAL.gui.has_p_rank = res
    return res
    }
    else
    {
        MOD_GLOBAL.gui.has_p_rank = sres
        return sres
    }
}

