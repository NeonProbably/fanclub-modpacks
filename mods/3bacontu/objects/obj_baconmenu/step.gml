if key_jump2 && option = 0 instance_destroy()
scr_menu_getinput()
scroll += 1

if key_quit2 or key_back instance_destroy()

UoD = key_down2 - key_up2
LoR = key_right2 + key_left2

if UoD != 0
{
	prev_opt = option
	option = clamp(option+UoD,0,array_length(optArr))
	if prev_opt != option sound_play("event:/sfx/ui/step");
}
if LoR != 0 && option != 0
{
	prev_opt = variable_global_get(optArr[option-1].optvar)
	variable_global_set(optArr[option-1].optvar,clamp(variable_global_get(optArr[option-1].optvar)+LoR,0,array_length(optArr[option-1].choices)-1))
	if prev_opt != variable_global_get(optArr[option-1].optvar) sound_play_centered("event:/sfx/ui/select");
}

