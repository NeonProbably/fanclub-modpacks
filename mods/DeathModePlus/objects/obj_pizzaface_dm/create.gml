persistent = true
mask = spr_player_mask
image_speed = 0.35
mvsp = 25
spd_mult = 0
state = 1   // 0 - brake, 1 - chase
mood = 0    // 0 - docile, 2 - angry, 1 and 3 - transitional
hsp = 0
vsp = 0
end_turn = 0
saved_angle = 0
maxspeed = 8
flash = false
depth = -599
tracker = noone
_active = false

spr_docile = MOD_GLOBAL.spr_pizzaface_docile.cu
spr_to_angry = spr_pizzaface_attackend
spr_angry = spr_pizzaface
spr_to_docile = spr_pizzaface_recovering

// handling the transitions between rooms

playerdir = 0
transition_used = 0  // 0 - default, 1 - hallways, 2 - vertical hallways
targetDoor = ""
hallway = false
box = false

alarm[2] = 10

go_angry = function() {
    image_index = 0
    mood = 2
}

go_docile = function() {
    image_index = 0
    mood = 0
}
