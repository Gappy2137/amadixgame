if (!showgui){exit;}
//swiatlo
//draw_sprite_ext(spr_attack_ui_light, 0, x_l, y_l, 1, 1, lengthdir_x(96, point_direction(x_ch, y_ch, x_l, y_l)), c_white, .5);

draw_sprite_ext(spr_attack_ui_ch, 0, x_ch, y_ch + animY, 1, 1, 90, c_white, alpha);



draw_sprite_ext(spr_attack_ui_ch, 1, x_m[0], y_m[0] + animY, scale[0], scale[0], 0, c_white, alpha);

draw_sprite_ext(spr_attack_ui_ch, 2, x_m[1], y_m[1] + animY, scale[1], scale[1], 0, c_white, alpha);

draw_sprite_ext(spr_attack_ui_ch, 3, x_m[2], y_m[2] + animY, scale[2], scale[2], 0, c_white, alpha);
