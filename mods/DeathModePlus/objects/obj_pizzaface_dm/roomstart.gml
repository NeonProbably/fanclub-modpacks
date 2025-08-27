if instance_exists(MOD_GLOBAL.playerid)
{
    alarm[0] = 60
    alarm[2] = 10
    _active = 0

    switch targetDoor // some code from CU repo
    {
        case "A": door_obj = obj_doorA; break;
        case "B": door_obj = obj_doorB; break;
        case "C": door_obj = obj_doorC; break;
        case "D": door_obj = obj_doorD; break;
        case "E": door_obj = obj_doorE; break;
        case "F": door_obj = obj_doorF; break;
        case "G": door_obj = obj_doorG; break;
		case "LAP": door_obj = obj_lapportalentrance; break;
        case "TIMED": door_obj = obj_lapportalentrance; break;
        case "ROCKET": 
            door_obj = obj_spaceshuttlestop; 
            door_obj.y -= 5;
            alarm[0] = 120;
        break;
        case "S": 
            if global.leveltosave == "secretworld"
                {door_obj = obj_secretportalstart}
                else
            {door_obj = obj_doorA;}
        break;
        default:
            with obj_doorX if self[$ "door"] == other.targetDoor
            {
                door_obj = self
                break
            }
    }
    if instance_exists(obj_taxidud)
    {
     door_obj = obj_stopsign;
     alarm[0] = 100;
    }
    targetDoor = ""
  
    if instance_exists(door_obj)
    {
        var pos = scr_door_spawnpos(door_obj)
        x = pos[0]
        y = pos[1]
    }

    var dist = 100

    switch transition_used
    {
        case 1: // hallways
            alarm[0] = 40
            if playerdir == 1
                x = 0 - dist
            else
                x = room_width + dist
            break
        case 2: // vert hallways
            alarm[0] = 40
            if playerdir == 1
                y = 0 - dist
            else
                y = room_height + dist
            break
        case 0: // other passages
            hsp = 0
            vsp = 0
            image_alpha = 0
            break
    }
}

if room == rank_room || room == timesuproom || !MODIFIERS.DeathMode
    instance_destroy()
