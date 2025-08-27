bg_x -= 1
bg_y -= 1

scr_menu_getinput()

if (key_escape || key_slap || key_slap2 || key_back)
    instance_destroy()
