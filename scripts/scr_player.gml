/// Player's normal state

// Get the player's inputs
scr_get_inputs();

// React to inputs 
var move = i_key_left + i_key_right;
i_hspeed = move * i_speed;
if (i_key_jump_p && i_is_grounded) {
    i_is_grounded = false;
    i_vspeed -= i_jumpspeed;
    audio_play_sound(snd_player_jump, 0, false);
    sprite_index = spr_player_g_jump;
}
if (i_key_right_p > 0) {
    image_xscale = abs(image_xscale);
} else if (i_key_left_p < 0) {
    image_xscale = -1 * abs(image_xscale);
}

// Apply Gravity
if (i_vspeed < 10) {
    i_vspeed += i_gravity;
}

// Collisoin Detection
if (place_meeting(x+i_hspeed, y, obj_tile)) {
    while(!place_meeting(x+sign(i_hspeed), y, obj_tile)) {
        x += sign(i_hspeed);
    }
    i_hspeed = 0;
}
if (place_meeting(x, y+i_vspeed, obj_tile)) {
    // TODO: only set i_is_grounded if colliding with the top of a tile.
    i_is_grounded = true;
    if (move != 0) {
        sprite_index = spr_player_g_walk;
    } else {
        sprite_index = spr_player_g_idle;
    }
    while(!place_meeting(x, y+sign(i_vspeed), obj_tile)) {
        y += sign(i_vspeed);
    }
    i_vspeed = 0;
}

// Set position
x += i_hspeed;
y += i_vspeed;
