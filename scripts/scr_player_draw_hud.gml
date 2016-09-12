/// Draw player health

var i = 0;
while (i < i_max_health) {
    if (i_current_health > i && i_current_health >= i+1) {
        draw_sprite(spr_hud_hearts, 0, 50 + (25 * i), 50);
    } else if (i_current_health > i) {
        draw_sprite(spr_hud_hearts, 1, 50 + (25 * i), 50);
    } else {
        draw_sprite(spr_hud_hearts, 2, 50 + (25 * i), 50);
    }
    i++;
}
show_debug_message(i_current_health);

