
pal_swap_player_palette();
		pal_swap_supernoise();
		draw_self();
		
		// noise jetpack
		var _red = global.noisejetpack && (obj_player1.character != "N" || obj_player1.noisepizzapepper);
		if _red
		{
			cuspal_reset();
			pal_swap_set(obj_player1.spr_palette, 2, false);
			draw_self();
		}
		pal_swap_reset();