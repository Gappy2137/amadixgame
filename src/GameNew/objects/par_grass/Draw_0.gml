
if (shallowwater){
	
	
	var _left = 0;
	var _top = 0;
	var _width = sprite_width;
	var _height = sprite_height;

	var waterangle = finalangle / 2;

	var _c = dcos(waterangle);
	var _s = dsin(waterangle);
	var _x = _left - sprite_get_xoffset(sprite_index);
	var _y = _width - sprite_get_yoffset(sprite_index) - (_height / 2);

	var posx = x + _c * _x + _s * _y;
	var posy = y - _s * _x + _c * _y;
	
	draw_sprite_ext(spr_entity_water_shallow, (obj_gamecontrol.refTimer * 4), posx, posy + _height, 1, 1, 0, c_white, .75);
	
	draw_sprite_general(sprite_index, anim_frame, _left, _top, _width, _height - 5, posx, posy, 1, 1, waterangle, c_white, c_white, c_white, c_white, 1);
	
	draw_sprite_ext(spr_entity_wateredge, 0, posx, posy + _height, 1, 1, 0, c_white, 1);
	
}else{
	draw_sprite_ext(sprite_index, anim_frame, (x), (y), 1, 1, finalangle, c_white, 1);
}