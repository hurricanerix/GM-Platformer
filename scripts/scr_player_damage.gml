i_current_health -= 0.5;
i_vspeed = -i_jumpspeed;
sprite_index = spr_player_g_hurt;

if (i_current_health <= 0) {
    game_restart();
}
