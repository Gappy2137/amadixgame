if (pickedup){exit;}

event_inherited();

switch (type){
	case 0:
			draw_sprite_ext(sprite_index, anim_frame, x + shakex, y, 1, 1, finalangle, c_white, 1);
	break;
	case 1:
			draw_sprite_ext(sprite_index, anim_frame, x + shakex, y, 1, 1, finalangle, c_white, 1);
			draw_sprite_ext(itemOverlay, itemOverlayState, x + shakex, y, 1, 1, finalangle, c_white, 1);
	break;
	case 2:
			draw_sprite_ext(sprite_index, itemNum, x + shakex, y, 1, 1, finalangle, c_white, 1);
	break;
	case 3:
			draw_sprite_ext(sprite_index, anim_frame, x + shakex, y, 1, 1, finalangle, c_white, 1);
			draw_sprite_ext(itemOverlay, itemOverlayState, x + shakex, y, 1, 1, finalangle, c_white, 1);
	break;
	case 4:
			draw_sprite_ext(sprite_index, itemNum, x + shakex, y, 1, 1, finalangle, c_white, 1);
	break;
	case 5:
			draw_sprite_ext(sprite_index, anim_frame, x, y, 1, 1, 0, c_white, 1);
	break;
	case 6:
			draw_sprite_ext(sprite_index, anim_frame, x, y, 1, 1, finalangle, c_white, 1);
	break;
}