add_modifier("DeathMode", #5B36B3, function(val)
{
    static elapsed = 0
    static prev_v = 0
    static ypos = -400
    var spr_run_anim = spr_playerN_mach3
    var xscale = 1
    elapsed += 1

    if (prev_v != val) {
        prev_v = val
        if (val) {
            ypos = -400
        } else {
            ypos = -400
        }
    }
    if (val) {
        ypos += 4
        if (ypos > -25) {
            spr_run_anim = spr_playerN_deathend
            xscale = -1
        }
        if (width / 2 + ypos >= width / 2 + 100) {
            spr_run_anim = spr_playerN_mach3
            ypos = -400
        }
    } else {
        spr_run_anim = spr_playerN_idle
    }
    draw_sprite_ext(spr_run_anim, elapsed * 0.45, width / 2 + 100, height - 100, xscale, 1, 0, c_white, 1)
    draw_sprite(spr_pizzaface, elapsed * 0.45, min(width / 2 + ypos, width / 2 + 100), height - 100 + cos(elapsed / 16) * 8)

    draw_set_font(global.bigfont)
    draw_set_align(fa_center)
    if (val) 
        draw_text(width / 2, height / 2+35, string_concat("00:0", 5-floor((ypos+400)/100)))
});
