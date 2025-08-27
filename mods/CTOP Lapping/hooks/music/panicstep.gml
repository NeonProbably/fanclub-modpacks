var panicID = argument0;
var event = argument1;

if global.laps == 1 && global.leveltosave == "exit" && (check_lap_mode(2) || global.lap3duringinf) && event != "event:/ctoplap/backforseconds"
	panicstart = 0