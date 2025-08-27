with MOD_GLOBAL.playerid
{
    if place_meeting(x, y, obj_hallway)
    {
        other.playerdir = xscale
        other.transition_used = 1
    }
    else if place_meeting(x, y, obj_verticalhallway)
    {
        other.playerdir = state == states.climbwall ? -1 : clamp(vsp * 100, -1, 1)
        other.transition_used = 2
    }
    else
        other.transition_used = 0
}
