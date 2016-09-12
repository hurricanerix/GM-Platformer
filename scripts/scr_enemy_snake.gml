/// Snake normal state

// Update location
if (i_alive) {
    i_hspeed += i_speed;
} else {
    i_hspeed = 0;
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
    i_hspeed = i_hspeed * -1;
}
if (place_meeting(x, y+i_vspeed, obj_tile)) {
    while(!place_meeting(x, y+sign(i_vspeed), obj_tile)) {
        y += sign(i_vspeed);
    }
    i_vspeed = 0;
}

if (i_hspeed > 0) {
    image_xscale = abs(image_xscale);
} else {
    image_xscale = -1 * abs(image_xscale);
}

// Check for damage
if (i_alive && place_meeting(x, y, obj_player_g)) {
    if (obj_player_g.y < y-1) {
        with (obj_player_g) {
            i_vspeed = -i_jumpspeed;
        }
        i_alive = false;
        sprite_index = spr_enemy_snake_dead;
        audio_play_sound(snd_snake_death, 0, false);
    } else {
        with (obj_player_g) {
            scr_player_damage();
        }      
    }
}

// Set position
x += i_hspeed;
y += i_vspeed;
