// Inherit the parent event
event_inherited();

draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, 0, colorBlend, 1);

/*
draw_rectangle_color(x - 8, y - 6, x + 8, y - 4, c_black, c_black, c_black, c_black, false);
draw_rectangle_color(x - 8, y - 6, (x - 8) + (16 * (hp / maxhp)), y - 4, c_red, c_red, c_red, c_red, false);
*/

draw_text(x,y + 16,detectionMeter);
draw_text(x,y,detected);
