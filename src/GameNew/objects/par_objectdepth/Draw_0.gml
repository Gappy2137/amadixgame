

//draw_rectangle(bbox_left,bbox_top,bbox_right,bbox_bottom,true);

// Shadows

if (instance_exists(obj_shadows)){
	if (!customSpr) && (shadowEnable) && (sprite_index != -1){
		var _skew = obj_shadows.skewX;
		var _h = shadowHeight;
		if (variable_instance_exists(id, "anim_frame")){
			var _index = variable_instance_get(id, "anim_frame");
		}else{
			var _index = image_index;	
		}
		
		
		
		gpu_set_fog(true, c_black, 0, 1);
		//gpu_set_blendmode(bm_max);
		
		draw_sprite_pos(shadowStyle, 0, 
			(x)-(sprite_width/2)-_skew+shadowOriginX,
			(y)-_h+shadowOriginY + 4, 
			(x)+(sprite_width/2)-_skew+shadowOriginX,
			(y)-_h+shadowOriginY + 4, 
			(x)+(sprite_width/2)+shadowOriginX,
			(y)+shadowOriginY + 4, 
			(x)-(sprite_width/2)+shadowOriginX,
			(y)+shadowOriginY + 4, 
			shadowAlpha);
			
		
		//gpu_set_blendmode(bm_normal);
		gpu_set_fog(false, c_white, 0, 0);
			
	}
}

if (global.debugBbox){
	draw_set_color(c_yellow);
	draw_rectangle(bbox_left,bbox_top,bbox_right,bbox_bottom,true);
	draw_set_color(c_white);
}

event_inherited();