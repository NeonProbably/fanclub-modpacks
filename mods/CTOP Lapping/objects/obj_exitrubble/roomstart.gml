var modded_instance_exists = function(objname)
{
    var create = false
    with(obj_modded_object)
    {
        if __OBJECT == objname
            create = true
    }
    return create
}
if (!(global.laps == 2)) || modded_instance_exists(obj_exitrubble)
{
    persistent = 0;
    instance_destroy();
    exit;
}

alarm[0] = 1;
brickscroll = 0;
lost = 0;
width = 4096;
height = 2048;

if (surface_exists(drawsurf))
    surface_resize(drawsurf, width, height);

var yy = 0;
var xx = 0;

switch (room)
{
    case entrance_9:
        vertical = 0;
        hsp = 6;
        break;
    
    case tower_finalhallway:
        vertical = 0;
        hsp = 9.9;
        break;
    
    case tower_5:
        vertical = 1;
        yy = 620;
        vsp = 4.8;
        break;
    
    case tower_escape1:
        vertical = 0;
        hsp = -20.1;
        xx = 1110;
        break;
    
    case tower_escape2:
        vertical = 1;
        vsp = 4.2;
        break;
    
    case tower_escape3:
        vertical = 0;
        hsp = 12;
        xx = -100;
        break;
    
    case tower_4:
        vertical = 1;
        vsp = 3.4;
        yy = -260;
        break;
    
    case tower_escape4:
        vertical = 0;
        hsp = 15;
        xx = -130;
        break;
    
    case tower_escape5:
        vertical = 1;
        vsp = 3;
        yy = -305;
        break;
    
    case tower_escape6:
        vertical = 0;
        hsp = -6.8;
        xx = 2200;
        break;
    
    case tower_3:
        vertical = 0;
        hsp = -5.2;
        break;
    
    case tower_escape7:
        vertical = 0;
        hsp = -9.1;
        xx = 2610;
        break;
    
    case tower_escape8:
        vertical = 1;
        vsp = 4.5;
        yy = -520;
        break;
    
    case tower_escape9:
        vertical = 0;
        hsp = 11.4;
        xx = -2400;
        break;
    
    case tower_2:
        vertical = 0;
        hsp = 10;
        xx = -200;
        break;
    
    case tower_escape10:
        vertical = 0;
        hsp = 17.5;
        xx = -380;
        break;
    
    case tower_escape11:
        vertical = 1;
        vsp = 5.6;
        yy = -2250;
        break;
    
    case tower_escape12:
        vertical = 0;
        hsp = -24.5;
        xx = 10720;
        break;
    
    case tower_1:
        vertical = 0;
        hsp = -11.2;
        xx = 300;
        break;
    
    case tower_johngutterhall:
        vertical = 0;
        hsp = -23.5;
        break;
    
    case tower_entrancehall:
        vertical = 0;
        hsp = -20.5;
        xx = 550;
        break;
    
}

brickscrollamount = 4;

if (!vertical)
{
    x = ((hsp >= 0) ? (-width - 100) : (width + 100)) + xx;
    y = 0 + yy;
    vsp = 0;
}
else
{
    hsp = 0;
    x = 0 + xx;
    y = -height + yy;
}
