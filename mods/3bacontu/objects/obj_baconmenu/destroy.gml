if room == Mainmenu 
{
    instance_activate_object(obj_music);
    instance_activate_object(obj_mainmenu);
}
instance_activate_object(obj_option);
instance_activate_object(obj_modlist);
instance_activate_object(obj_pause);
instance_activate_object(obj_transfotip);


ini_open(MOD_PATH + "/saveData.ini");
i = 0
repeat(array_length(optArr))
{
    ini_write_real("Mod", optArr[i].optvar, variable_global_get(optArr[i].optvar))
    i += 1
}
ini_close();