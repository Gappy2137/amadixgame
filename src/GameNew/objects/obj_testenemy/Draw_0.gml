// Inherit the parent event
event_inherited();

draw_sprite(sprite_index, image_index, x, y);

draw_rectangle_color(x - 8, y - 6, x + 8, y - 4, c_black, c_black, c_black, c_black, false);
draw_rectangle_color(x - 8, y - 6, (x - 8) + (16 * (hp / maxhp)), y - 4, c_red, c_red, c_red, c_red, false);