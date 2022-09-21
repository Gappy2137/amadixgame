event_inherited();

draw_sprite_ext(sprite_index, image_index, x, y, 1, 1, finalangle, c_white, alpha);

if (itemOverlay != -1){
	draw_sprite_ext(itemOverlay, itemOverlayState, x, y, 1, 1, finalangle, c_white, alpha);
}

if (object_index != obj_hazel_bush)
&& (object_index != obj_oak_2_bark)
&& (object_index != obj_birch_small)
&& (object_index != obj_lilac_bush){
	var col = collision_rectangle(
		x - sprite_get_xoffset(sprite_index) - 4,
		bbox_top - sprite_get_bbox_top(sprite_index) + 4,
		x + sprite_get_xoffset(sprite_index) + 4,
		bbox_top + 1,
		obj_amadix, false, false
	);
	
	if (col){
		alpha = approach(alpha, 0.5, 0.05);	
	}else{
		if (alpha != 1){
			alpha = approach(alpha, 1, 0.05);		
		}
	}
}
/*
shadowOriginX = 0;
shadowOriginY = 0;
shadowStyle = spr_shadow_big;
shadowAlpha = 0.6;

shadowEnable = true;