if object_index == obj_pizzaball exit;
if object_index == obj_hamkuff exit;
if MODIFIERS.DeathMode
{
    var in_saveroom = ((ds_list_find_index(global.saveroom, id) != -1) || (ds_list_find_index(global.baddieroom, id) != -1) || (ds_list_find_index(global.escaperoom, id) != -1))

    if !in_saveroom
    {
        switch object_index
        {
            case obj_baddiecollisionbox: // code by Hell's Encyclopedia
                if !variable_instance_exists(baddieID,"mod_hp") exit
                if !instance_exists(baddieID) exit
                if baddieID.mod_hp > 0 return 0
            break;
        }
    }

    var slm_enabled = function()
    {
		var res = false

		with obj_mod_object
		{
			if __OBJECT.name == "obj_lapping_controller"
				other.res = true
		}

		return res
    }

    if object_get_parent(object_index) == obj_baddie && !slm_enabled()
    {
        if in_saveroom exit
        if variable_instance_exists(id, "mod_hp")
        {
            if instance_exists(obj_player1)
            {
                if (obj_player1.state == states.backbreaker)
                {
                    mod_buffer = 10
                    exit
                }
            }

            if mod_buffer == 0
            {
                mod_hp--
                state = states.stun
            }
            if mod_hp > 0
            {
                if mod_buffer == 0
                {
                    global.combotime = 60
                    global.combo++
                    global.enemykilled++
                    var combototal = 10 + floor(global.combo * 1.5)
                    global.collect += combototal
                    global.comboscore += combototal
                    if (global.prank_cankillenemy && !global.prank_enemykilled)
                    {
                        global.prank_enemykilled = true
                    }
                    with (obj_player1) supercharge += 1
                    sound_play_3d("event:/sfx/enemies/kill", x, y)
                    shake_camera(3, 3 / room_speed)
                    mod_buffer = 10
                }
                state = states.stun
               
                return false;
            }
            else
            {
                var thermometer_part1 = instance_create(x + 41, y - 38, obj_sausageman_dead)
                with thermometer_part1
                {
                    sprite_index = MOD_GLOBAL.baddie_healthbar
                    image_index = 4
                    image_speed = 0
                }
                var thermometer_part2 = instance_create(x + 41, y - 38, obj_sausageman_dead)
                with thermometer_part2
                {
                    sprite_index = MOD_GLOBAL.baddie_healthbar
                    image_index = 2
                    image_speed = 0
                }
                var combototal = global.combo
                global.collect += combototal
                global.comboscore += combototal
                return true
            }
        }
    }
}
