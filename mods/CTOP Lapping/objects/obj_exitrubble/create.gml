
persistent = true
sprite_index = global.ctoplap_sprites.spr_exitrubble_edge

snd = fmod_event_create_instance("event:/ctoplap/collapse");
lost = 0;
vertical = 0;
hsp = 2;
vsp = 0;
width = 1;
height = 1;
edgespr = global.ctoplap_sprites.spr_exitrubble_edge;
bg = global.ctoplap_sprites.sprite1122;
bricks1 = bg_scrollingbricks;
bricks2 = bg_fallingbricksforefront;
bricks3 = bg_pizzafacefallout;
debrisspr = [];
visited = [];
brickscroll = 0;
drawsurf = surface_create(width, height);
playerAlpha = 0;
depth = -300
practicecaughttimer = 0;
cooldown = 0;
brickscrollamount = 4;
practicecaught = false;
image_speed = 0.35

if !check_lap_mode(2)
{
    persistent = false
    instance_destroy()
    return;
}