event_inherited();

// Shadows

if (instance_exists(obj_shadows)){
	if (shadowEnable) && (sprite_index != -1){
		var _skew = obj_shadows.skewX;
		var _h = shadowHeight;
		var _alpha = obj_shadows.shadowAlpha;
		//var _index = 0;
		//if (variable_instance_exists(id, "anim_frame")){
		//	_index = variable_instance_get(id, "anim_frame");
		//}else{
		//	_index = image_index;	
		//}
		
		
		
		gpu_set_fog(true, c_black, 0, 1);
		//gpu_set_blendmode(bm_max);
		
		/*
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
		*/
		
		draw_sprite_pos(shadowStyle, 0, 
			(x)-(sprite_width/2)-_skew+shadowOriginX + shadowSizeX,
			(y)-_h+shadowOriginY + 4 + shadowSizeY, 
			(x)+(sprite_width/2)-_skew+shadowOriginX - shadowSizeX,
			(y)-_h+shadowOriginY + 4 + shadowSizeY, 
			(x)+(sprite_width/2)+shadowOriginX - shadowSizeX,
			(y)+shadowOriginY + 4 - shadowSizeY, 
			(x)-(sprite_width/2)+shadowOriginX + shadowSizeX,
			(y)+shadowOriginY + 4 - shadowSizeY, 
			shadowAlpha * _alpha
		);
		
		//gpu_set_blendmode(bm_normal);
		gpu_set_fog(false, c_white, 0, 0);
			
	}
}

if (global.debugBbox){
	draw_set_color(c_yellow);
	draw_rectangle(bbox_left,bbox_top,bbox_right,bbox_bottom,true);
	draw_set_color(c_white);
}

if (playerVisible){
	scr_draw_player(round_to4(x), round_to4(y), round_to4(zaxis));
	
	if (state == player_state.wading) || (state == player_state.wading_idle){
		draw_sprite_ext(spr_entity_water_shallow, (obj_gamecontrol.refTimer * 4), x, y + sprite_height, 1, 1, 0, c_white, .9);
		draw_sprite_ext(spr_entity_wateredge, 0, x, y + sprite_height, 1, 1, 0, c_white, 1);
	}
	
	if (state == player_state.swimming) || (state == player_state.swimming_idle){
		draw_sprite_ext(spr_entity_water, (obj_gamecontrol.refTimer * 4), x, y + sprite_height, 1, 1, 0, c_white, .9);
		draw_sprite_ext(spr_entity_wateredge, 1, x, y + sprite_height, 1, 1, 0, c_white, 1);
	}
	
}

//if (instance_exists(obj_gun_logic)){draw_text(x + 32, y, obj_gun_logic.state);}
//if (instance_exists(obj_gun_logic)){draw_text(x + 32, y+8, obj_gun_logic.canShoot);}
//if (instance_exists(obj_gun_logic)){draw_text(x + 32, y+16, obj_gun_logic.canReload);}
//draw_text(x + 32, y, zaxis);
//draw_text(x + 32, y + 8, zfloor);
//draw_text(x + 32, y + 16, zheight);

//draw_rectangle(bbox_left,bbox_top,bbox_right,bbox_bottom,true);

//draw_sprite(head_index, 0, x + 32, y - 32);

//draw_sprite(torso_index, 0, x + 32, y - 16);

//draw_sprite(hands_index, 0, x + 32, y);

//draw_sprite(legs_index, 0, x + 32, y + 16);

//draw_sprite(arms_index, 0, x + 32, y + 32);

//draw_sprite(arms2_index, 0, x + 32, y + 48);


//draw_text(x + 32, y, hsp);
//draw_text(x + 32, y + 8, vsp);

//draw_text(x + 32, y + 24, running);
//draw_text(x + 32, y + 32, spd);
//draw_text(x + 32, y + 46, skid);
//draw_text(x + 32, y + 64, skidTimer);

//draw_text(x - 32, y + 48, depth);
//draw_text(x + 32, y + 48, zfloor);