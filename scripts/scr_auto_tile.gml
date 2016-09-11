/// Platformer auto-tile

enum tiles {
    single = 0,
    single_cap_l = 1,
    middle = 2,
    single_cap_r = 3,
    inner = 4,
    cap_l = 5,
    cap_r = 6,
}

var tile, iw, w_left, w_right, w_up, w_down;
iw          = sprite_width;
w_left      = place_meeting(x-iw, y, object_index);
w_right     = place_meeting(x+iw, y, object_index);
w_up        = place_meeting(x, y-iw, object_index);
w_down      = place_meeting(x, y+iw, object_index);

if (w_up) {
    return tiles.inner;
}

if (w_right && w_left) {
    return tiles.middle;
}

if (w_left && !w_right) {
    if (w_down) {
        return tiles.cap_r;
    } else {
        return tiles.single_cap_r;
    }
}

if (w_right && !w_left) {
    if (w_down) {
        return tiles.cap_l;
    } else {
        return tiles.single_cap_l;
    }
}

if (w_down) {
    return tiles.middle
}

return tiles.single;
