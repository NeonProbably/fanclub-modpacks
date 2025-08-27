persistent = true
depth = -200
time = 0
prep_time = 0
shiftv = 0
size = 0
check_state = false
active = false
show_text = false
debug = 0
blink_timer = 20
data = -4
data_loaded = false
data_selected_entry = -1
collect_data = []
placement_mode = false
panic_time = 0
pizzaface = noone
fixed_fill = 0

show_text = false

hide_timer = function()
{
	with obj_tv
	{
		timer_y = SCREEN_HEIGHT + 50
	}
}

time_stringify = function(time)
{
	var fancify = function(value) 
	{
		var res = string(value)
		if value < 10
		{
			res = "0" + res
		}
		return res
	}
	var minutes = string(time div 3600)
	var seconds = fancify((time div 60) % 60)
	if alarm[0] >= 0 || MOD_GLOBAL.core.data_loaded
		return minutes + ":" + seconds
	return "-:--"
}

time_add = function(timetoadd)
{
	MOD_GLOBAL.core.time += timetoadd * 60
}

room_string = function(roomstri)
{
	if is_string(roomstri)
		return roomstri
	return room_get_name(roomstri)
}

room_is = function(colroom)
{
	var clockroom = room_string(colroom)

	if (instance_exists(obj_cyop_loader))
		return obj_cyop_loader.room_name == clockroom

	return room_string(room) == clockroom
}

collect_place = function()
{
	var coll_l = array_length(collect_data)
	for (var entrynum = 0; entrynum < coll_l; entrynum++)
	{
		var entry = collect_data[entrynum]
		var obj = entry.inst
		if is_string(entry.inst)
		{
			switch entry.inst
			{
				case "obj_dmcollect":
					obj = obj_dmcollect
					break
				case "obj_dmcollect_escape":
					obj = obj_dmcollect_escape
					break
			}
		}
		var pos_l = array_length(entry.positions)
		for (var i = 0; i < pos_l; i++)
		{
			if room_is(entry.positions[i].colroom)
			{
				var room_coll = entry.positions[i].data
				for (var collID = 0; collID < array_length(room_coll); collID++)
				{
					var collect = room_coll[collID]
					if !struct_exists(collect, "blockspawn") || collect.blockspawn == false
					{
						var clock = instance_create(collect.x, collect.y, obj)
						clock.entrynum = entrynum
						clock.ID = collID
						clock.roomID = room_string(room)
						if (instance_exists(obj_cyop_loader))
							clock.roomID = obj_cyop_loader.room_name

						if struct_exists(collect, "time")
							clock.time = collect.time
					}
				}
			}
		}
	}
}

lap_respawn_collects = function()
{
	var coll_l = array_length(collect_data)
	for (var entrynum = 0; entrynum < coll_l; entrynum++)
	{
		var entry = collect_data[entrynum]
		var pos_l = array_length(entry.positions)
		if entry.escape == true
		{
			for (var i = 0; i < pos_l; i++)
			{
				var room_coll = entry.positions[i].data
				for (var collID = 0; collID < array_length(room_coll); collID++)
				{
					var collect = room_coll[collID]
					if struct_exists(collect, "blockspawn") && collect.blockspawn == true
						collect.blockspawn = false
				}
			}
		}
	}
}

