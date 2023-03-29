

if (wtr){
	var waterangle = finalangle / 2;
	
	draw_sprite_ext(spr_entity_water_shallow, (obj_gamecontrol.refTimer * 4), x, y + 1, 1, 1, 0, c_white, .75);
	
	draw_sprite_general(sprite_index, 0, 0, 0, sprite_width, sprite_height - 4,
	    x - lengthdir_x(sprite_get_xoffset(sprite_index), waterangle) - lengthdir_x(sprite_get_yoffset(sprite_index), waterangle - 90),
	    y - lengthdir_y(sprite_get_xoffset(sprite_index), waterangle) - lengthdir_y(sprite_get_yoffset(sprite_index), waterangle - 90) + 4,
	    1, 1, waterangle, c_white, c_white, c_white, c_white, 1);

	draw_sprite_ext(spr_entity_wateredge, 0, x, y + 1, 1, 1, 0, c_white, 1);
	
}else{
	
	draw_sprite_ext(spr_shadow_grass, 0, x, y, 1, 1, 0, c_white, obj_shadows.shadowAlpha / 2);
	
	draw_sprite_ext(sprite_index, anim_frame, (x), (y), 1, 1, finalangle, c_white, 1);
	
}