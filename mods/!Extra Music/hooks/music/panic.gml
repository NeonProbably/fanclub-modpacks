var event = argument0;
if obj_player1.character == "V"
{
    if event == "event:/music/pizzatime"
        return "event:/neons-extras/panic/panicV";
}

if obj_player1.character == "G"
{
    if event == "event:/music/pizzatime"
        return "event:/neons-extras/panic/mu_pestcontrol";
}

if obj_player1.character == "N"
{
	if (event != "event:/ctoplap/odetomyBALLS" && event == "event:/modded/lap3")
        return "event:/neons-extras/lap3/lap3N";
}

if obj_player1.character == "N"
{
	if event == "event:/music/w3/beach"
        return "event:/neons-extras/levels/Neon_Stage";
}

if obj_player1.character == "PZ"
{
    if event == "event:/music/finalescape"
        return "event:/neons-extras/finalescape/finalescapePZ";
}

