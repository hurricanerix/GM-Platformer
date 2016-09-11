/// Player's normal state
// Get the player's inputs
scr_get_inputs();

// React to inputs 
move = key_left + key_right;
hsp = move * movespeed;
if (vsp < 10) {
    vsp += grav;
}
if (place_meeting(x, y+1, obj_tile)) {
    vsp = key_jump * -jumpspeed;
}

// Horizontal Collisoin
if (place_meeting(x+hsp, y, obj_tile))
{
    while(!place_meeting(x+sign(hsp), y, obj_tile))
    {
        x += sign(hsp);
    }
    hsp = 0;
}
x += hsp;

// Vertical Collision
if (place_meeting(x, y+vsp, obj_tile))
{
    jumping = false;
    while(!place_meeting(x, y+sign(vsp), obj_tile))
    {
        y += sign(vsp);
    }
    vsp = 0;
}
y += vsp;
