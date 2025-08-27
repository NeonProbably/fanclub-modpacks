if MODIFIERS.DeathMode
{
    if check_panic()
    {
        if global.hud != 3 //minimal
			hide_timer();

        if global.fill > 0
            fixed_fill = global.fill
        else if global.fill != fixed_fill
            global.fill = fixed_fill
    }

    if (instance_exists(obj_secretportal) && !(global.leveltosave == "cyop_secret" || global.leveltosave == "secretworld" ))
    {
        with (obj_secretportal)
            instance_destroy()
    }

    if instance_exists(obj_baddie)
    {
        with (obj_baddie)
        {
            if !variable_instance_exists(id, "dmsetup")
            {
                visible = false
                dmsetup = true
                mod_hp = 3
                mod_buffer = 0
                first_frame = 1
                mod_stun_buffer = 0
            }
            else
                visible = true
            if variable_instance_exists(id, "dmsetup")
                elite = true
        }
    }
    global.baddierage = true
    global.baddiespeed = 2

    with (obj_lapportal)
    {
        time_attack = 0
    }

    if active
    {
        shiftv = max(0, shiftv - 0.025)

        if pizzaface == noone
            pizzaface = instance_create(MOD_GLOBAL.playerid.x, MOD_GLOBAL.playerid.y, obj_pizzaface_dm)

        if prep_time == 0
        {
            if time > 0
            {
                
                if (global.combokeeper)
                {
                    if (!instance_exists(obj_spaceshuttlecutscene) && !instance_exists(obj_taxitransition))
                    time--
                }
                else
                {
                time--
                }

                if pizzaface.mood == 2
                    pizzaface.go_docile()
            }
            else if data_loaded
            {
                MOD_GLOBAL.timer_reached_zero = true
                if pizzaface.mood == 0
                    pizzaface.go_angry()
            }
        }
        else
            prep_time--

        if instance_exists(obj_wartimer) && global.laps < 3
        {
            with obj_wartimer
            {
                alarm[0] = 60
                if !variable_instance_exists(id, "dmsetup")
                {
                    dmsetup = true
                    minutes = 0
                    seconds = 25
                    addseconds = 0
                }
            }
            with obj_nuketerminal
            {
                add_saveroom(id)
                instance_destroy(id, false)
            }
        }
    }
    else if !(room == rank_room || room == timesuproom)
    {
        if obj_player1.state != 95 && show_text == true && ((blink_timer - alarm[1]) >= 10)
        {
            active = true
            alarm[1] = -1
        }
    }
}
