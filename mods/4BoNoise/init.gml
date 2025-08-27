MOD_GLOBAL.opt_pronoun = "X";
MOD_GLOBAL.spr_tv_paletteBO = sprite_add(MOD_PATH + "/sprites/spr_tv_paletteBO.png", 1, false, false, 50, 50)
MOD_GLOBAL.spr_tv_exprbreakdance = sprite_add(MOD_PATH + "/sprites/spr_tv_exprbreakdance.png", 6, false, false, 139, 134);
MOD_GLOBAL.spr_chargeeffectBN = sprite_add(MOD_PATH + "/sprites/spr_chargeeffectBN.png", 8, false, false, 43, 58)
MOD_GLOBAL.spr_superslameffectBN = sprite_add(MOD_PATH + "/sprites/spr_superslameffectBN.png", 4, false, false, 50, 27)

add_sprite = function(name, frames, xorigin, yorigin, spritefps = -1)
{
    spritefps = spritefps == 0 ? -1 : spritefps;
    var s = sprite_add(concat(MOD_PATH, "/sprites/", name, ".png"), frames, false, false, xorigin, yorigin);
    sprite_set_speed(s, abs(spritefps), spritefps ? spritespeed_framespersecond : spritespeed_framespergameframe);
    return s ?? undefined;
}

MOD_GLOBAL.spr_combopointer = sprite_add(MOD_PATH + "/sprites/tucmeter/spr_combopointer.png", 11, false, false, 20, 30);
MOD_GLOBAL.spr_combopointerP = sprite_add(MOD_PATH + "/sprites/tucmeter/spr_combopointerP.png", 11, false, false, 20, 30);

MOD_GLOBAL.spr_combotuc = sprite_add(MOD_PATH + "/sprites/tucmeter/spr_combotuc.png", 10, false, false, 96, 112);
MOD_GLOBAL.spr_combotucP = sprite_add(MOD_PATH + "/sprites/tucmeter/spr_combotucP.png", 10, false, false, 96, 112);

MOD_GLOBAL.spr_tuccrumb = sprite_add(MOD_PATH + "/sprites/tucmeter/spr_tuccrumb.png", 3, false, false, 4, 4);

MOD_GLOBAL.spr_font_combobubble = sprite_add(MOD_PATH + "/sprites/tucmeter/spr_font_combobubble.png", 10, false, false, 0, 0);

MOD_GLOBAL.combofont2BO = font_add_sprite_ext(MOD_GLOBAL.spr_font_combobubble, "1234567890", true, 0);

MOD_GLOBAL.spr_escapeguy_right = sprite_add(MOD_PATH + "/sprites/pointerguy/spr_escapeguy_right.png", 1, false, false, 72, 67)
MOD_GLOBAL.spr_escapeguy_left = sprite_add(MOD_PATH + "/sprites/pointerguy/spr_escapeguy_left.png", 1, false, false, 72, 67)
