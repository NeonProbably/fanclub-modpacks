event = argument0
if global.laps == 3
	exit;
//show_message(event) 
if (event == "event:/modded/lap3" || event == "event:/neons-extras/lap3/lap3N" || event == "event:/music/pizzatime" || event == "event:/neons-extras/finalescape/finalescapePZ" || event == "event:/music/finalescape") && global.leveltosave == "exit" && (global.lapmode != 1 || global.lap3duringinf)
{
	//show_message(global.laps)
	if global.laps == 1
		return "event:/ctoplap/backforseconds";
	if global.laps == 2
		return "event:/ctoplap/odetomyBALLS";
}
