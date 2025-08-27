/*if obj_player1.targetDoor == "LAP" && global.laps == 1 && global.leveltosave == "exit" && (check_lap_mode(2))
{
   with instance_create(x, y, obj_pizzaface)
   {
       sprite_index = global.ctoplap_sprites.spr_pizzahead
       fmod_event_one_shot_3d("event:/sfx/voice/pizzahead", x, y);
   }
}