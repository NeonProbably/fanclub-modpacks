if MODIFIERS.DeathMode
{
	if global.hud == 4
	{
		exit
	}

	if global.hud == 0 || global.hud == 2
	{
		if MOD_GLOBAL.core.show_text
		{
			draw_set_font(global.bigfont);
			draw_set_colour(c_white);
			draw_set_align(fa_center);
			var size = 1 + (0.5 * MOD_GLOBAL.core.shiftv);
			draw_text_transformed(SCREEN_WIDTH / 2, SCREEN_HEIGHT - (65 + (75 * MOD_GLOBAL.core.shiftv)), MOD_GLOBAL.core.time_stringify(max(MOD_GLOBAL.core.time, 0)), size, size, 0);
		}
	}

	with (obj_tv)
	{
		if !hud_is_forcehidden() && !hud_is_hidden() // hud fuckery
		{
			var rx = 0
			var ry = 0

			if global.hud == 1
			{
				var tvx = SCREEN_WIDTH - 128 + irandom_range(-obj_camera.collect_shake, obj_camera.collect_shake);
				var tvy = 74 + irandom_range(-obj_camera.collect_shake, obj_camera.collect_shake);

				static comboprev = 0;

				if tvreset != global.hud
				{
					alarm[0] = -1;
					tvreset = global.hud;
					imageindexstore = 0;
					once = false;
					yi = 600;
					showtext = false;
					tvsprite = spr_tvdefault;
					image_speed = 0.1;
				}

				#region SPRITE

				alpha = 1;
				if (instance_exists(obj_player1) && obj_player1.y < camera_get_view_y(view_camera[0]) + 200 && obj_player1.x > camera_get_view_x(view_camera[0]) + SCREEN_WIDTH - 200)
				or obj_camera.manualhide
					alpha = 0.5;

				if instance_exists(obj_itspizzatime)
				{
					old_hud_message(lang_get_value_newline("message_panic"), 200);
					tvsprite = spr_tvexit;
					image_speed = 0.25;
				}

				// good job you don't in fact suck
				else if instance_exists(obj_player1) && obj_player1.sprite_index == obj_player1.spr_levelcomplete
				{
					alarm[0] = 50
					tvsprite = spr_tvclap
					once = true
				}

				// owie moans in pain uwu
				else if instance_exists(obj_player1) && obj_player1.state == states.hurt
				{
					if !once
						message = lang_get_value_newline(concat("message_hurt", choose(1, 2, 3, 4)));
					once = true

					old_hud_message(message, 50);
					tvsprite = spr_tvhurt
				}

				// skull emoji face ass
				else if instance_exists(obj_player1) && (obj_player1.state == states.timesup or obj_player1.state == states.ejected)
				{
					alarm[0] = 50
					tvsprite = spr_tvskull
				}

				// combo
				else if global.combo != comboprev && (tvsprite == spr_tvdefault or tvsprite == spr_tvcombo or tvsprite == spr_tvescape)
				{
					if global.combo == 0
					{
						if obj_player1.state == states.comingoutdoor
							event_perform(ev_alarm, 0);
						else
						{
							tvsprite = spr_tvcomboresult;
							image_speed = 0;
							image_index = min(comboprev, 3);
							alarm[0] = 50;
						}
					}
					else
					{
						tvsprite = spr_tvcombo;
						imageindexstore = global.combo - 1;

						if REMIX && !global.timeattack
							alarm[0] = 80;
					}
					comboprev = global.combo;
				}

				if instance_exists(obj_player1) && obj_player1.state == states.keyget
					old_hud_message(lang_get_value_newline("message_key"), 50); // GOT THE KEY!

				if global.timeattack && tvsprite == spr_tvdefault
				{
					if global.combo > 0 && global.combotime > 0
						tvsprite = spr_tvcombo;
					else
						tvsprite = spr_tvescape;
				}

				#endregion
				#region DRAW

				var sprite = tvsprite, def = spr_tvdefault, combo = spr_tvcombo;

				if global.combo > 0 && global.combotime > 0 && (tvsprite == spr_tvcombo or tvsprite == spr_tvdefault)
				{
					// combo tv
					var wd = 16 + (global.combotime / 60) * sprite_get_width(sprite);

					draw_sprite_part_ext(def, image_index, wd, 0, sprite_get_width(sprite), sprite_get_height(sprite), tvx + wd - sprite_get_xoffset(sprite), tvy - sprite_get_yoffset(sprite), 1, 1, c_white, alpha);
					draw_sprite_part_ext(combo, global.combo - 1, 0, 0, wd, sprite_get_height(sprite), tvx - sprite_get_xoffset(sprite), tvy - sprite_get_yoffset(sprite), 1, 1, c_white, alpha);
				}
				else
					draw_sprite_ext(sprite, image_index, tvx, tvy, 1, 1, 0, c_white, alpha);

				draw_set_align(fa_center);
				draw_set_font(lang_get_font("bigfont"));
				if tvsprite == spr_tvcombo
				{
					var comboclear = spr_tvcomboclear;
					draw_sprite_ext(comboclear, 0, tvx, tvy, 1, 1, 0, c_white, alpha);
					draw_text_new(tvx + 20, tvy + 1, string(global.combo));
				}
				if tvsprite == spr_tvdefault
					draw_text_new(tvx - 4, tvy - 14, string(global.collect));
				draw_set_alpha(1);
				draw_set_align();
				// frame
				var tv_palette = global.tvcolor;
				if tv_palette != 0
				{
					pal_swap_set(spr_tv_palette, tv_palette);
					draw_sprite_ext(spr_tvempty, image_index, tvx, tvy, 1, 1, 0, c_white, alpha);
					pal_swap_reset();
				}

				if MOD_GLOBAL.core.show_text
				{
					draw_set_align(fa_center);
					draw_set_font(lang_get_font("bigfont"));
					draw_set_colour(MOD_GLOBAL.core.time == 0 ? c_red : c_white);
					var yoffset = min(yi - SCREEN_HEIGHT - (string_height(message) - 20), 0);
					var shake = max((300 - MOD_GLOBAL.core.time) div 60, 0)
					draw_text_new(timer_x + 153 + random_range((shake * -1), shake), SCREEN_HEIGHT - 60 + random_range((shake * -1), shake) + yoffset, MOD_GLOBAL.core.time_stringify(max(MOD_GLOBAL.core.time, 0)));
				}

				// bullets
				var showbullet = obj_player1.character != "V" && obj_player1.character != "S" && !obj_player1.isgustavo;
				var by = 130, bpad = 10;
				if global.shootstyle == 7 && showbullet
					scr_draw_fuel(SCREEN_WIDTH - 180, by, spr_bulletHUD, global.bullet, 3, -3);
				if global.doublegrab == 6 && showbullet
					scr_draw_fuel(SCREEN_WIDTH - 100, by, spr_fuelHUD, global.fuel, 3, -20);
				#endregion
			}
			if global.hud == 3
			{
				static combo_prev = 0;
				static combo_shake = 0;

				var pad = round(global.minimal_pad * 50);

				// combo bar
				var cw = sprite_get_width(spr_combobar_minimal), ch = sprite_get_height(spr_combobar_minimal);
				var slice = global.combo == 0 ? 0 : (global.combotime / 60);

				var cx = SCREEN_WIDTH - cw - 20 - pad;
				var cy = 16 + hud_posY + pad;

				if slice > 0
				{
					draw_mask_start();
					draw_sprite_part(spr_combobar_minimal, 1, 0, 0, cw * slice, ch, cx, cy);
					draw_mask_end();

					var img = scr_can_p_rank() ? 0 : 1;
					draw_sprite(spr_combofill_minimal, img, cx - (scr_current_time() / 100) % cw, cy);
					draw_sprite(spr_combofill_minimal, img, cx + cw - (scr_current_time() / 100) % cw, cy);
					draw_reset_clip();
				}

				draw_sprite(spr_combobar_minimal, 0, cx, cy);
				draw_sprite(spr_combocursor_minimal, 0, cx + clamp(cw * slice, 8, cw - 12), cy + lerp(4, 3, slice));

				// combo number
				draw_set_font(global.minimal_number);
				pal_swap_set(spr_numpalette_minimal, 3);
				draw_set_align(fa_center);

				if combo_prev != global.combo
				{
					combo_prev = global.combo;
					combo_shake = 2;
				}

				var combo = string(global.combo);
				var textx = cx - 3 + (cw - ((string_length(combo) - 1) * 18)) / 2;

				if global.minimal_combospot == 1
				{
					draw_set_align(fa_right);
					textx = cx - 10 - ((string_length(combo) - 1) * 18);
				}

				for(var i = 1; i <= string_length(combo); i++)
				{
					var xo = random_range(-combo_shake, combo_shake), yo = random_range(-combo_shake, combo_shake);
					draw_text(textx + ((i - 1) * 18) + xo, cy + 3 + yo, string_char_at(combo, i));
				}

				combo_shake = Approach(combo_shake, 0, 0.1);
				if global.combotime < 5 && global.combo != 0
					combo_shake = 3;
				if global.combotime < 20 && global.combo != 0 && combo_shake < 1
					combo_shake = 1;

				pal_swap_reset();

				// heat meter
				if global.heatmeter
				{
					var hx = cx + 1, hy = cy + 30;
					var hw = sprite_get_width(spr_heatmeter_minimal), hh = sprite_get_height(spr_heatmeter_minimal);

					var slice = min(global.style / 50, 1);
					draw_rectangle_color(hx + 4, hy + 4, hx + (hw - 4) * slice, hy + hh - 4, c_red, c_red, c_red, c_red, false);

					pal_swap_set(spr_heatmeter_palette, global.stylethreshold);
					draw_sprite(spr_heatmeter_minimal, 0, hx, hy);
					pal_swap_reset();
				}

				// panic timer
				var war = instance_find(obj_wartimer, 0);
				var ta = global.timeattack;

				if !ta
				{
					draw_set_align(fa_center);

					var tx = SCREEN_WIDTH / 2, ty = (SCREEN_HEIGHT - 50) - pad;
					var txo = sprite_get_xoffset(spr_bartimer_minimal);

					if false
					{
						draw_sprite(spr_bartimer_minimal, 0, tx, ty);
						var barw = sprite_get_width(spr_timer_barfill);
						draw_set_mask(tx, ty, spr_bartimer_minimal, 1);
						draw_sprite(spr_timer_barfill, 0, tx - txo + barfill_x % barw, ty);
						draw_sprite(spr_timer_barfill, 0, tx - txo + barw + barfill_x % barw, ty);
						draw_reset_clip();
					}

					if war && MOD_GLOBAL.core.time == 0
					{
						draw_sprite(spr_bartimer_minimal, 2, tx, ty);
						var minutes = war.minutes, seconds = war.seconds;
						var alpha = clamp((war.alarm[0] - 45) / 15, 0, 1);
						draw_sprite_ext(spr_bartimer_minimal, 1, tx, ty, 1, 1, 0, c_red, alpha);
						draw_set_colour(c_red);
					}
					else
					{
						var minutes = string(MOD_GLOBAL.core.time div 3600)
						var seconds = string((MOD_GLOBAL.core.time div 60) % 60)
					}

					pal_swap_set(spr_numpalette_minimal, 2);

					var time_str = concat(minutes, ":", seconds < 10 ? "0" : "", seconds);
					tx -= (14 * (string_length(time_str) - 1)) / 2;

					var shake = global.timer_shake, col = c_white;
					if (minutes == 0 && seconds < 30 && seconds > 0 && MOD_GLOBAL.core.time == 0 && war)
						shake = 1;
					else if (minutes == 0 && seconds < 3 && MOD_GLOBAL.core.time > 0)
						shake = max(0, (3 - seconds))

					if !MOD_GLOBAL.core.data_loaded
						shake = 0

					if MOD_GLOBAL.core.show_text
					{
						for(var i = 0; i < string_length(time_str); i++)
						{
							var xo = random_range(-shake, shake), yo = random_range(-shake, shake);
							draw_text_color(tx + 14 * i + xo, ty + 3 + yo, string_char_at(time_str, i + 1), col, col, col, col, 1);
						}
					}
					pal_swap_reset();
				}
				draw_set_colour(c_white);
				draw_set_align();
			}
		}
	}

	if global.hud == 3 exit

	if variable_global_exists("BRMP_RankSprMode")
		if global.BRMP_RankSprMode != -4 && (global.hud == 0 || global.hud == 2) exit

	with obj_camera
	{
		if !hud_is_forcehidden() && !hud_is_hidden()
		{
			var rx = other.rankx
			var ry = other.ranky
			var hud_xx = 121 + irandom_range(-collect_shake, collect_shake);
			var hud_yy = 90 + irandom_range(-collect_shake, collect_shake) + hud_posY;

			if global.hud == 2 && !lap3
			{
				hud_xx += 28;
				hud_yy += 15;
			}

			if REMIX && global.laps >= 2 && !global.timeattack
			{
				hud_xx += Wave(-4, 4, 2, 10);
				hud_yy += Wave(-1, 1, 4, 0);
			}

			if global.hud == 0 || global.hud == 2
			{
				var rx = hud_xx + 142; // rank bubble
				var ry = hud_yy - 22;
			}
			var _score = global.collect;
			var rank_ix = 0;

			if _score >= global.srank && other.has_p_rank
				rank_ix = 5;
			else if _score >= global.srank
				rank_ix = 4;
			else if _score >= global.arank
				rank_ix = 3;
			else if _score >= global.brank
				rank_ix = 2;
			else if _score >= global.crank
				rank_ix = 1;

			if rank_ix == 5 && REMIX && MOD_GLOBAL.core.time < 4
			{
				// shake
				rx += random_range(-2, 2);
				ry += random_range(-2, 2);
			}

			if previousrank != rank_ix
			{
				previousrank = rank_ix;
				rank_scale = 3;
			}

			var ranksprite = MOD_GLOBAL.deathrank.normal

			draw_sprite_ext(ranksprite, rank_ix, rx, ry, rank_scale, rank_scale, 0, c_white, 1);

			var spr_w = sprite_get_width(ranksprite);
			var spr_h = sprite_get_height(ranksprite);
			var spr_xo = sprite_get_xoffset(ranksprite);
			var spr_yo = sprite_get_yoffset(ranksprite);

			var perc = 0;
			switch rank_ix
			{
				case 4:
				case 5:
					perc = 0;
					break;
				case 3:
					perc = (_score - global.arank) / (global.srank - global.arank);
					break;
				case 2:
					perc = (_score - global.brank) / (global.arank - global.brank);
					break;
				case 1:
					perc = (_score - global.crank) / (global.brank - global.crank);
					break;
				default:
					perc = _score / global.crank;
			}

				var t = spr_h * perc;
				var top = spr_h - t;

				var rankfillsprite = MOD_GLOBAL.deathrank.fill

				if rank_scale == 1 or !REMIX
					draw_sprite_part(rankfillsprite, rank_ix, 0, top, spr_w, spr_h - top, rx - spr_xo, (ry - spr_yo) + top);
		}
	}
}

