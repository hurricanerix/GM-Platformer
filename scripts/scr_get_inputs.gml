// Get the player's inputs
i_key_right = keyboard_check(vk_right) || gamepad_button_check(0, gp_padr);
i_key_left = -(keyboard_check(vk_left) || gamepad_button_check(0, gp_padl));
i_key_jump = keyboard_check_pressed(vk_space) || gamepad_button_check_pressed(0, gp_face1);
