var _seen = false;
show_debug_message("try")
show_debug_message(string(obj_player1.targetRoom))
show_debug_message(string(visited))
for (var i = 0; i < array_length(visited); i++)
{
        if (obj_player1.targetRoom == other.visited[i])
        {
            if (obj_player1.state == states.debugstate)
                exit;

            if (obj_player1.state == states.backtohub)
                exit;

            if (obj_player1.state == states.titlescreen)
                exit;
                
            if (obj_player1.targetDoor == "LAP")
            {
                visited = []
                exit;
            }
            
            if (instance_exists(obj_jumpscare))
                exit;
                
                if (!lost)
                {
                    lost = true;
                    with(obj_player)
                    {
                        show_debug_message("kill")
                        fmod_event_instance_stop(other.snd, 1);
                        instance_destroy(obj_fadeout);
                        targetDoor = "A";
                        room = timesuproom;
                        state = states.timesup;
                        sprite_index = spr_Timesup;
                        image_index = 0;
        
                        if (isgustavo)
                            sprite_index = spr_player_ratmounttimesup;
        
                        visible = true;
                        image_blend = c_white;
                        stop_music();
                        fmod_event_one_shot("event:/music/timesup");
                        other.persistent = 0;
                        image_alpha = 1
                        instance_destroy(obj_exitrubble);
                    }
                }
        }
}

array_push(visited, room);
