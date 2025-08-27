if (obj_player1.character == "BO")
{
var tucCrumbs = [];
var tv_x = obj_screensizer.actual_width - 115
var tv_y = 80

var savedCombo = 0

var collect_x = irandom_range(-collect_shake, collect_shake);
var collect_y = irandom_range(-collect_shake, collect_shake);
var _cx = tv_x + combo_posX;
var _cy = tv_y + 150 + hud_posY + combo_posY;
var _perc = global.combotime / 60;
var _minX = _cx - 70;
var _maxX = _cx + 55;
combofill_x = lerp(combofill_x, _maxX + ((_minX - _maxX) * _perc), 0.5);
combofill_y = _cy + 35 + Wave(-1, 1, 1, 0);
var _isP = !global.combodropped && global.prank_enemykilled;
var _barspr = MOD_GLOBAL.spr_combotuc;
var _pointerspr = MOD_GLOBAL.spr_combopointer;

if (_isP)
{
    _barspr = MOD_GLOBAL.spr_combotucP;
    _pointerspr = MOD_GLOBAL.spr_combopointerP;
}
var _tper = clamp(1 - (floor(100 * _perc) / 100), 0, 1);
var _tucindex = _tper * sprite_get_number(_barspr);
_tucindex = floor(clamp(_tucindex, 0, sprite_get_number(_barspr) - 1));
/*
if (_tucindex > tucindex)
{
    var c = [combofill_x + irandom_range(2, -6), combofill_y + irandom_range(-5, -70), 2, random_range(-4, 2)];
    array_push(c, irandom_range(0, sprite_get_number(MOD_GLOBAL.spr_tuccrumb) - 1));
    array_push(tucCrumbs, c);
}*/
// if all else fails just remove the crumble effect
var tucindex = _tucindex;
draw_sprite(_barspr, tucindex, _cx, _cy);
draw_sprite(_pointerspr, combofill_index, combofill_x, combofill_y);
/*
for (var i = 0; i < array_length(tucCrumbs); i++)
{
    var crumb = tucCrumbs[i];
    var _xx = crumb[0];
    var _yy = crumb[1];
    crumb[0] += crumb[2];
    crumb[1] += crumb[3];
    
    if (crumb[3] < 12)
        crumb[3] += 0.2;
    
    if (_xx > camera_get_view_width(view_camera[0]) || _yy > camera_get_view_height(view_camera[0]) || _xx < 0 || _yy < 0)
        array_delete(tucCrumbs, i, 1);
    else
        draw_sprite(MOD_GLOBAL.spr_tuccrumb, crumb[4], _xx, _yy);
}
*/
draw_set_font(MOD_GLOBAL.combofont2BO);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
var _tx = _cx - 19;
var _ty = _cy + 30;

if (global.combo > 0 && global.combotime != 0)
   var savedCombo = global.combo;

var _str = string(savedCombo);
var num = string_length(_str);

for (var i = num; i > 0; i--)
{
    var char = string_char_at(_str, i);
    draw_text(_tx, _ty, char);
    _tx -= 22;
    _ty -= 4;
}

return false;
}
