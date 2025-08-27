if (MOD_GLOBAL.PZ_snd_wallkick) {
destroy_sounds([
    MOD_GLOBAL.PZ_snd_wallkick
]);
}
var i = 0
while i <array_length(global.mods)
{
    if variable_struct_exists(global.mods[i],"name")
    {
        var name = variable_struct_get(global.mods[i],"name")
        if name = "Pizzelle"
        {	
            variable_struct_set(global.mods[i],"icon", MOD_GLOBAL.ogicon)
        }
    }
    i++
}
var i = 0
if instance_exists(obj_modlist)
{
	while i < array_length(obj_modlist.mods)
	{
		if variable_struct_exists(obj_modlist.mods[i],"name")
		{
			var name = variable_struct_get(obj_modlist.mods[i],"name")
			if name = "Pizzelle"
			{	
				variable_struct_set(obj_modlist.mods[i],"icon", MOD_GLOBAL.ogicon)
			}
		}
		i++
	}
}