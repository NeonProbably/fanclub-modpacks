switch expressionsprite
{
    case MOD_GLOBAL.spr_tv_exprbreakdance:
        with obj_player1
        {
            if sprite_index != spr_breakdance
            {
                other.state = states.tv_whitenoise;
                other.expressionsprite = noone;
            }
        }
        return false;
    	break;
}