function scr_draw_player(px, py, pz) {

function drawPlayerNormal(xx, yy, zz){
	//----------------------------------------------------------------------------------------------------------------
	//Glowa
	draw_sprite_ext(head_index,anim_frame,xx,yy - zz,image_xscale,image_yscale,image_angle,image_blend,image_alpha);

	//Dlonie
	draw_sprite_ext(hands_index,anim_frame,xx,yy - zz,image_xscale,image_yscale,image_angle,image_blend,image_alpha);

	//Gorne ubranie
	draw_sprite_ext(torso_index,anim_frame,xx,yy - zz,image_xscale,image_yscale,image_angle,image_blend,image_alpha);

	//Spodnie
	draw_sprite_ext(legs_index,anim_frame,xx,yy - zz,image_xscale,image_yscale,image_angle,image_blend,image_alpha);

	//Buty
	draw_sprite_ext(boots_index,anim_frame,xx,yy - zz,image_xscale,image_yscale,image_angle,image_blend,image_alpha);	
					
	//Czapka
	draw_sprite_ext(hat_index,hat_frame,xx,yy - zz - 12 + hatY,image_xscale,image_yscale,image_angle,image_blend,image_alpha);	
	//----------------------------------------------------------------------------------------------------------------
}
function drawPlayerEating(xx, yy, zz){
	var sx = (itemeaten mod obj_inventory.spr_inv_items_columns) * 24;
	var sy = (itemeaten div obj_inventory.spr_inv_items_columns) * 24;
	//----------------------------------------------------------------------------------------------------------------
	//Glowa
	draw_sprite_ext(head_index,anim_frame_action,xx,yy - zz,image_xscale,image_yscale,image_angle,image_blend,image_alpha);
	
	//Gorne ubranie
	draw_sprite_ext(torso_index,anim_frame_action,xx,yy - zz,image_xscale,image_yscale,image_angle,image_blend,image_alpha);
	
	//Spodnie
	draw_sprite_ext(legs_index,0,xx,yy - zz,image_xscale,image_yscale,image_angle,image_blend,image_alpha);
	
	if (anim_frame_action >= 0.1) && (anim_frame_action <= 6){
		//Przedmiot jedzony
		draw_sprite_general(spr_inventory_items, 0, sx, sy + itemUsedSx, 23, 24 - itemUsedSx, xx - 7 + (itemUsedX), yy - zz + 13 + (itemUsedY), .5, .5, itemUsedAngle, c_white, c_white, c_white, c_white, 1);
	}
	
	//Dlonie
	draw_sprite_ext(hands_index,anim_frame_action,xx,yy - zz,image_xscale,image_yscale,image_angle,image_blend,image_alpha);

	//Buty
	draw_sprite_ext(boots_index,0,xx,yy - zz,image_xscale,image_yscale,image_angle,image_blend,image_alpha);	
					
	//Czapka
	draw_sprite_ext(hat_index,hat_frame,xx,yy - zz - 12 + hatY,image_xscale,image_yscale,image_angle,image_blend,image_alpha);	
	//----------------------------------------------------------------------------------------------------------------
}
function drawPlayerDrinking(xx, yy, zz){
	var sx = (itemeaten mod obj_inventory.spr_inv_items_columns) * 24;
	var sy = (itemeaten div obj_inventory.spr_inv_items_columns) * 24;
	//----------------------------------------------------------------------------------------------------------------
	//Glowa
	draw_sprite_ext(head_index,anim_frame_action,xx,yy - zz,image_xscale,image_yscale,image_angle,image_blend,image_alpha);
	
	//Gorne ubranie
	draw_sprite_ext(torso_index,anim_frame_action,xx,yy - zz,image_xscale,image_yscale,image_angle,image_blend,image_alpha);
	
	//Spodnie
	draw_sprite_ext(legs_index,0,xx,yy - zz,image_xscale,image_yscale,image_angle,image_blend,image_alpha);
	
	if ((anim_frame_action >= 0.1) && (anim_frame_action <= 1.8)) || ((anim_frame_action >= 8) && (anim_frame_action <= 10)){
		//Przedmiot pity
		draw_sprite_general(spr_inventory_items, 0, sx, sy + itemUsedSx, 24, 24 - itemUsedSx, xx - 7 + (itemUsedX), yy - zz + 13 + (itemUsedY), .5, (.5 * itemUsedYscale), itemUsedAngle, c_white, c_white, c_white, c_white, 1);
	}
	
	//Dlonie
	draw_sprite_ext(hands_index,anim_frame_action,xx,yy - zz,image_xscale,image_yscale,image_angle,image_blend,image_alpha);

	//Buty
	draw_sprite_ext(boots_index,0,xx,yy - zz,image_xscale,image_yscale,image_angle,image_blend,image_alpha);	
					
	//Czapka
	draw_sprite_ext(hat_index,hat_frame,xx,yy - zz - 12 + hatY,image_xscale,image_yscale,image_angle,image_blend,image_alpha);	
	//----------------------------------------------------------------------------------------------------------------
}
function drawPlayerMelee(xx, yy, zz){
	//----------------------------------------------------------------------------------------------------------------
	//Glowa
	draw_sprite_ext(head_index,anim_frame_action,xx,yy - zz,image_xscale,image_yscale,image_angle,image_blend,image_alpha);
	
	//Gorne ubranie
	draw_sprite_ext(torso_index,anim_frame_action,xx,yy - zz,image_xscale,image_yscale,image_angle,image_blend,image_alpha);
	
	//Spodnie
	draw_sprite_ext(legs_index,anim_frame_action,xx,yy - zz,image_xscale,image_yscale,image_angle,image_blend,image_alpha);
	
	//Dlonie
	draw_sprite_ext(hands_index,anim_frame_action,xx,yy - zz,image_xscale,image_yscale,image_angle,image_blend,image_alpha);

	//Buty
	draw_sprite_ext(boots_index,anim_frame_action,xx,yy - zz,image_xscale,image_yscale,image_angle,image_blend,image_alpha);	
					
	//Czapka
	draw_sprite_ext(hat_index,hat_frame,xx,yy - zz - 12 + hatY,image_xscale,image_yscale,image_angle,image_blend,image_alpha);	
	//----------------------------------------------------------------------------------------------------------------
}
function drawPlayerHandgun(xx, yy, zz){
	//----------------------------------------------------------------------------------------------------------------
	
	switch(facing){
		case dirc.down:
		//----------------------------------------------------------------------------------------------------------------
		
		//Glowa
		draw_sprite_ext(head_index,anim_frame,xx,yy - zz,image_xscale,image_yscale,image_angle,image_blend,image_alpha);
	
		//Gorne ubranie
		draw_sprite_ext(torso_index,anim_frame,xx,yy - zz,image_xscale,image_yscale,image_angle,image_blend,image_alpha);
	
		//Spodnie
		draw_sprite_ext(legs_index,anim_frame,xx,yy - zz,image_xscale,image_yscale,image_angle,image_blend,image_alpha);

		//Buty
		draw_sprite_ext(boots_index,anim_frame,xx,yy - zz,image_xscale,image_yscale,image_angle,image_blend,image_alpha);	
		
		//Rece i dlonie
		if (instance_exists(obj_gun_logic)){
			if (obj_gun_logic.state == gunState.reloading){
				draw_sprite_ext(arms_index,anim_frame_action,xx + hand_xoffset,yy - zz + hand_yoffset,image_xscale,image_yscale,hand_rot,image_blend,image_alpha);
		
				draw_sprite_ext(hands_index,anim_frame_action,xx + hand_xoffset,yy - zz + hand_yoffset,image_xscale,image_yscale,hand_rot,image_blend,image_alpha);
		
			}else if (obj_gun_logic.state == gunState.shooting){
				draw_sprite_ext(arms_index,anim_frame_action,xx + hand_xoffset,yy - zz + hand_yoffset,image_xscale,image_yscale,hand_rot,image_blend,image_alpha);
		
				draw_sprite_ext(hands_index,anim_frame_action,xx + hand_xoffset,yy - zz + hand_yoffset,image_xscale,image_yscale,hand_rot,image_blend,image_alpha);
		
				draw_sprite_ext(arms2_index,anim_frame_action,xx + hand_xoffset2,yy - zz + hand_yoffset2,image_xscale,image_yscale,hand_rot,image_blend,image_alpha);
		
				draw_sprite_ext(hands2_index,anim_frame_action,xx + hand_xoffset2,yy - zz + hand_yoffset2,image_xscale,image_yscale,hand_rot,image_blend,image_alpha);
			}else{
				draw_sprite_ext(arms_index,anim_frame,xx + hand_xoffset,yy - zz + hand_yoffset,image_xscale,image_yscale,hand_rot,image_blend,image_alpha);
		
				draw_sprite_ext(hands_index,anim_frame,xx + hand_xoffset,yy - zz + hand_yoffset,image_xscale,image_yscale,hand_rot,image_blend,image_alpha);
		
				draw_sprite_ext(arms2_index,anim_frame,xx + hand_xoffset2,yy - zz + hand_yoffset2,image_xscale,image_yscale,hand_rot,image_blend,image_alpha);
		
				draw_sprite_ext(hands2_index,anim_frame,xx + hand_xoffset2,yy - zz + hand_yoffset2,image_xscale,image_yscale,hand_rot,image_blend,image_alpha);
			}
		}
		//Bron
		draw_sprite_ext(gun_index,anim_frame_action,xx + hand_xoffset,yy - zz + hand_yoffset,image_xscale,image_yscale,hand_rot,image_blend,image_alpha);	
		
		//Czapka
		draw_sprite_ext(hat_index,hat_frame,xx,yy - zz - 12 + hatY,image_xscale,image_yscale,image_angle,image_blend,image_alpha);	
		//----------------------------------------------------------------------------------------------------------------
		break;
		case dirc.left:
		//----------------------------------------------------------------------------------------------------------------
		
		//Glowa
		draw_sprite_ext(head_index,anim_frame,xx,yy - zz,image_xscale,image_yscale,image_angle,image_blend,image_alpha);
	
		//Gorne ubranie
		draw_sprite_ext(torso_index,anim_frame,xx,yy - zz,image_xscale,image_yscale,image_angle,image_blend,image_alpha);
	
		//Spodnie
		draw_sprite_ext(legs_index,anim_frame,xx,yy - zz,image_xscale,image_yscale,image_angle,image_blend,image_alpha);

		//Buty
		draw_sprite_ext(boots_index,anim_frame,xx,yy - zz,image_xscale,image_yscale,image_angle,image_blend,image_alpha);	
		
		//Rece i dlonie
		if (instance_exists(obj_gun_logic)){
			if (obj_gun_logic.state == gunState.reloading) || (obj_gun_logic.state == gunState.shooting){
				draw_sprite_ext(arms_index,anim_frame_action,xx + hand_xoffset,yy - zz + hand_yoffset,image_xscale,image_yscale,hand_rot,image_blend,image_alpha);
		
				draw_sprite_ext(hands_index,anim_frame_action,xx + hand_xoffset,yy - zz + hand_yoffset,image_xscale,image_yscale,hand_rot,image_blend,image_alpha);
		
			}else{
				draw_sprite_ext(arms_index,anim_frame,xx + hand_xoffset,yy - zz + hand_yoffset,image_xscale,image_yscale,hand_rot,image_blend,image_alpha);
		
				draw_sprite_ext(hands_index,anim_frame,xx + hand_xoffset,yy - zz + hand_yoffset,image_xscale,image_yscale,hand_rot,image_blend,image_alpha);
		
			}
		}
		
		//Bron
		draw_sprite_ext(gun_index,anim_frame_action,xx + hand_xoffset,yy - zz + hand_yoffset,image_xscale,image_yscale,hand_rot,image_blend,image_alpha);	
		
		//Czapka
		draw_sprite_ext(hat_index,hat_frame,xx,yy - zz - 12 + hatY,image_xscale,image_yscale,image_angle,image_blend,image_alpha);	
		//----------------------------------------------------------------------------------------------------------------
		break;
		case dirc.right:
		//----------------------------------------------------------------------------------------------------------------
		
		//Glowa
		draw_sprite_ext(head_index,anim_frame,xx,yy - zz,image_xscale,image_yscale,image_angle,image_blend,image_alpha);
	
		//Gorne ubranie
		draw_sprite_ext(torso_index,anim_frame,xx,yy - zz,image_xscale,image_yscale,image_angle,image_blend,image_alpha);
	
		//Spodnie
		draw_sprite_ext(legs_index,anim_frame,xx,yy - zz,image_xscale,image_yscale,image_angle,image_blend,image_alpha);

		//Buty
		draw_sprite_ext(boots_index,anim_frame,xx,yy - zz,image_xscale,image_yscale,image_angle,image_blend,image_alpha);	
		
		//Rece i dlonie
		if (instance_exists(obj_gun_logic)){
			if (obj_gun_logic.state == gunState.reloading) || (obj_gun_logic.state == gunState.shooting){
				draw_sprite_ext(arms_index,anim_frame_action,xx + hand_xoffset,yy - zz + hand_yoffset,image_xscale,image_yscale,hand_rot,image_blend,image_alpha);
		
				draw_sprite_ext(hands_index,anim_frame_action,xx + hand_xoffset,yy - zz + hand_yoffset,image_xscale,image_yscale,hand_rot,image_blend,image_alpha);
		
			}else{
				draw_sprite_ext(arms_index,anim_frame,xx + hand_xoffset,yy - zz + hand_yoffset,image_xscale,image_yscale,hand_rot,image_blend,image_alpha);
		
				draw_sprite_ext(hands_index,anim_frame,xx + hand_xoffset,yy - zz + hand_yoffset,image_xscale,image_yscale,hand_rot,image_blend,image_alpha);
		
			}
		}
		
		//Bron
		draw_sprite_ext(gun_index,anim_frame_action,xx + hand_xoffset,yy - zz + hand_yoffset,image_xscale,image_yscale,hand_rot,image_blend,image_alpha);	
		
		//Czapka
		draw_sprite_ext(hat_index,hat_frame,xx,yy - zz - 12 + hatY,image_xscale,image_yscale,image_angle,image_blend,image_alpha);	
		//----------------------------------------------------------------------------------------------------------------
		break;
		case dirc.up:
		//----------------------------------------------------------------------------------------------------------------
		//Rece i dlonie
		if (instance_exists(obj_gun_logic)){
			if (obj_gun_logic.state == gunState.reloading) || (obj_gun_logic.state == gunState.shooting){
				draw_sprite_ext(arms_index,anim_frame_action,xx + hand_xoffset,yy - zz + hand_yoffset,image_xscale,image_yscale,hand_rot,image_blend,image_alpha);
		
				draw_sprite_ext(hands_index,anim_frame_action,xx + hand_xoffset,yy - zz + hand_yoffset,image_xscale,image_yscale,hand_rot,image_blend,image_alpha);
		
			}else{
				draw_sprite_ext(arms_index,anim_frame,xx + hand_xoffset,yy - zz + hand_yoffset,image_xscale,image_yscale,hand_rot,image_blend,image_alpha);
		
				draw_sprite_ext(hands_index,anim_frame,xx + hand_xoffset,yy - zz + hand_yoffset,image_xscale,image_yscale,hand_rot,image_blend,image_alpha);
		
			}
		}
		
		//Bron
		draw_sprite_ext(gun_index,anim_frame_action,xx + hand_xoffset,yy - zz + hand_yoffset,image_xscale,image_yscale,hand_rot,image_blend,image_alpha);	
		
		//Glowa
		draw_sprite_ext(head_index,anim_frame,xx,yy - zz,image_xscale,image_yscale,image_angle,image_blend,image_alpha);
	
		//Gorne ubranie
		draw_sprite_ext(torso_index,anim_frame,xx,yy - zz,image_xscale,image_yscale,image_angle,image_blend,image_alpha);
	
		//Spodnie
		draw_sprite_ext(legs_index,anim_frame,xx,yy - zz,image_xscale,image_yscale,image_angle,image_blend,image_alpha);

		//Buty
		draw_sprite_ext(boots_index,anim_frame,xx,yy - zz,image_xscale,image_yscale,image_angle,image_blend,image_alpha);	
		
		//Czapka
		draw_sprite_ext(hat_index,hat_frame,xx,yy - zz - 12 + hatY,image_xscale,image_yscale,image_angle,image_blend,image_alpha);	
		//----------------------------------------------------------------------------------------------------------------
		break;
	}
}




	switch(actionstate){
		case player_state_action.none:
			switch(state){
				case player_state.idle:
					drawPlayerNormal(px, py, pz);
				break;
				case player_state.moving:
					drawPlayerNormal(px, py, pz);
				break;
				case player_state.wading_idle:
					drawPlayerNormal(px, py, pz);
				break;
				case player_state.wading:
					drawPlayerNormal(px, py, pz);
				break;
				case player_state.swimming_idle:
					drawPlayerNormal(px, py, pz);
				break;
				case player_state.swimming:
					drawPlayerNormal(px, py, pz);
				break;
				default:
					drawPlayerNormal(px, py, pz);
				break;
			}
		break;
		case player_state_action.eating:
			switch(state){
				case player_state.idle:
					drawPlayerEating(px, py, pz);
				break;
				case player_state.moving:
					drawPlayerEating(px, py, pz);
				break;
				case player_state.wading_idle:
					drawPlayerEating(px, py, pz);
				break;
				case player_state.wading:
					drawPlayerEating(px, py, pz);
				break;
				case player_state.swimming_idle:
					drawPlayerEating(px, py, pz);
				break;
				case player_state.swimming:
					drawPlayerEating(px, py, pz);
				break;
				default:
					drawPlayerEating(px, py, pz);
				break;
			}
		break;
		case player_state_action.drinking:
			switch(state){
				case player_state.idle:
					drawPlayerDrinking(px, py, pz);
				break;
				case player_state.moving:
					drawPlayerDrinking(px, py, pz);
				break;
				case player_state.wading_idle:
					drawPlayerDrinking(px, py, pz);
				break;
				case player_state.wading:
					drawPlayerDrinking(px, py, pz);
				break;
				case player_state.swimming_idle:
					drawPlayerDrinking(px, py, pz);
				break;
				case player_state.swimming:
					drawPlayerDrinking(px, py, pz);
				break;
				default:
					drawPlayerDrinking(px, py, pz);
				break;
			}
		break;
		case player_state_action.attacking_melee:
			switch(state){
				case player_state.idle:
					drawPlayerMelee(px, py, pz);
				break;
				case player_state.moving:
					drawPlayerMelee(px, py, pz);
				break;
				case player_state.wading_idle:
					drawPlayerMelee(px, py, pz);
				break;
				case player_state.wading:
					drawPlayerMelee(px, py, pz);
				break;
				case player_state.swimming_idle:
					drawPlayerMelee(px, py, pz);
				break;
				case player_state.swimming:
					drawPlayerMelee(px, py, pz);
				break;
				default:
					drawPlayerMelee(px, py, pz);
				break;
			}
		break;
		case player_state_action.handgun:
		
			switch(state){
				case player_state.idle:
					drawPlayerHandgun(px, py, pz);
				break;
				case player_state.moving:
					drawPlayerHandgun(px, py, pz);
				break;
				case player_state.wading_idle:
					drawPlayerHandgun(px, py, pz);
				break;
				case player_state.wading:
					drawPlayerHandgun(px, py, pz);
				break;
				case player_state.swimming_idle:
					drawPlayerHandgun(px, py, pz);
				break;
				case player_state.swimming:
					drawPlayerHandgun(px, py, pz);
				break;
				default:
					drawPlayerHandgun(px, py, pz);
				break;
			}
			
		break;
	}





/*
	if (actionstate == player_state_action.none){
		if (state == player_state.idle){
			//Glowa
			draw_sprite_ext(head_index,anim_frame,px,py,image_xscale,image_yscale,image_angle,c_white,image_alpha);

			//Dlonie
			draw_sprite_ext(hands_index,anim_frame,px,py,image_xscale,image_yscale,image_angle,c_white,image_alpha);

			//Gorne ubranie
			draw_sprite_ext(torso_index,anim_frame,px,py,image_xscale,image_yscale,image_angle,c_white,image_alpha);

			//Spodnie
			draw_sprite_ext(legs_index,anim_frame,px,py,image_xscale,image_yscale,image_angle,c_white,image_alpha);

			//Buty
			draw_sprite_ext(boots_index,anim_frame,px,py,image_xscale,image_yscale,image_angle,c_white,image_alpha);	
		}
		if (state == player_state.moving){
			//Glowa
			draw_sprite_ext(head_index,anim_frame,px,py,image_xscale,image_yscale,image_angle,c_white,image_alpha);

			//Gorne ubranie
			draw_sprite_ext(torso_index,anim_frame,px,py,image_xscale,image_yscale,image_angle,c_white,image_alpha);

			//Spodnie
			draw_sprite_ext(legs_index,anim_frame,px,py,image_xscale,image_yscale,image_angle,c_white,image_alpha);

			//Buty
			draw_sprite_ext(boots_index,anim_frame,px,py,image_xscale,image_yscale,image_angle,c_white,image_alpha);
			
			//Dlonie
			draw_sprite_ext(hands_index,anim_frame,px,py,image_xscale,image_yscale,image_angle,c_white,image_alpha);
		}
		if (state == player_state.wading) || (state == player_state.wading_idle){
	
			//Glowa
			draw_sprite_ext(head_index,anim_frame,px,py + 4,image_xscale,image_yscale,image_angle,c_white,image_alpha);

			//Dlonie
			draw_sprite_ext(hands_index,anim_frame,px,py + 4,image_xscale,image_yscale,image_angle,c_white,image_alpha);

			//Gorne ubranie
			draw_sprite_ext(torso_index,anim_frame,px,py + 4,image_xscale,image_yscale,image_angle,c_white,image_alpha);

			//Spodnie
			draw_sprite_part_ext(legs_index,anim_frame, 0, sprite_yoffset, sprite_width, sprite_height - 4,px - sprite_xoffset,py + 4,image_xscale,image_yscale,c_white,image_alpha);
	
		}
		if (state == player_state.swimming) || (state == player_state.swimming_idle){
	
			//Glowa
			draw_sprite_part_ext(head_index,anim_frame, 0, sprite_yoffset, sprite_width, sprite_height - 16,px - sprite_xoffset,py + 16,image_xscale,image_yscale,c_white,image_alpha);
	
			//Gorne ubranie
			draw_sprite_part_ext(torso_index,anim_frame, 0, sprite_yoffset, sprite_width, sprite_height - 16,px - sprite_xoffset,py + 16,image_xscale,image_yscale,c_white,image_alpha);
		}
	}else
	if (actionstate == player_state_action.eating){
		var sx = (itemeaten mod obj_inventory.spr_inv_items_columns) * 24;
		var sy = (itemeaten div obj_inventory.spr_inv_items_columns) * 24;

		if (state == player_state.idle) || (state == player_state.moving){
			//Glowa
			draw_sprite_ext(head_index,anim_frame_action,px,py,image_xscale,image_yscale,image_angle,c_white,image_alpha);

			//Gorne ubranie
			draw_sprite_ext(torso_index,anim_frame_action,px,py,image_xscale,image_yscale,image_angle,c_white,image_alpha);
			
			//Spodnie
			draw_sprite_ext(legs_index,0,px,py,image_xscale,image_yscale,image_angle,c_white,image_alpha);
			
			if (anim_frame_action >= 0.1) && (anim_frame_action <= 6){
				//Przedmiot jedzony
				draw_sprite_general(spr_inventory_items, 0, sx, sy + itemUsedSx, 23, 24 - itemUsedSx, px - 7 + (itemUsedX), py + 13 + (itemUsedY), .5, .5, itemUsedAngle, c_white, c_white, c_white, c_white, 1);
			}
			//Dlonie
			draw_sprite_ext(hands_index,anim_frame_action,px,py,image_xscale,image_yscale,image_angle,c_white,image_alpha);

			//Buty
			draw_sprite_ext(boots_index,0,px,py,image_xscale,image_yscale,image_angle,c_white,image_alpha);	
		}
		if (state == player_state.wading_idle) || (state == player_state.wading){
			//Glowa
			draw_sprite_ext(head_index,anim_frame_action,px,py + 4,image_xscale,image_yscale,image_angle,c_white,image_alpha);

			//Gorne ubranie
			draw_sprite_ext(torso_index,anim_frame_action,px,py + 4,image_xscale,image_yscale,image_angle,c_white,image_alpha);
			
			//Spodnie
			draw_sprite_part_ext(legs_index,0, 0, sprite_yoffset, sprite_width, sprite_height - 4,px - sprite_xoffset,py + 4,image_xscale,image_yscale,c_white,image_alpha);
			
			if (anim_frame_action >= 1) && (anim_frame_action <= 6){
				//Przedmiot jedzony
				draw_sprite_general(spr_inventory_items, 0, sx, sy + itemUsedSx, 24, 24 - itemUsedSx, px - 7 + (itemUsedX), py + 13 + (itemUsedY), .5, .5, itemUsedAngle, c_white, c_white, c_white, c_white, 1);
			}
			
			//Dlonie
			draw_sprite_ext(hands_index,anim_frame_action,px,py + 4,image_xscale,image_yscale,image_angle,c_white,image_alpha);
		}
		if (state == player_state.swimming_idle) || (state == player_state.swimming){
	
			//Glowa
			draw_sprite_part_ext(head_index,anim_frame_action, 0, sprite_yoffset, sprite_width, sprite_height - 16,px - sprite_xoffset,py + 16,image_xscale,image_yscale,c_white,image_alpha);
	
			//Gorne ubranie
			draw_sprite_part_ext(torso_index,anim_frame_action, 0, sprite_yoffset, sprite_width, sprite_height - 16,px - sprite_xoffset,py + 16,image_xscale,image_yscale,c_white,image_alpha);	
			
			if (anim_frame_action >= 3) && (anim_frame_action <= 5){
				//Przedmiot jedzony
				draw_sprite_general(spr_inventory_items, 0, sx, sy + itemUsedSx, 24, 24 - itemUsedSx, px - 7 + (itemUsedX), py + 13 + (itemUsedY), .5, .5, itemUsedAngle, c_white, c_white, c_white, c_white, 1);
			}
			//Dlonie
			draw_sprite_part_ext(hands_index,anim_frame_action, 0, sprite_yoffset, sprite_width, sprite_height - 16,px - sprite_xoffset,py + 16,image_xscale,image_yscale,c_white,image_alpha);	
		}
	}else
	if (actionstate == player_state_action.drinking){
		var sx = (itemeaten mod obj_inventory.spr_inv_items_columns) * 24;
		var sy = (itemeaten div obj_inventory.spr_inv_items_columns) * 24;

		if (state == player_state.idle) || (state == player_state.moving){
			//Glowa
			draw_sprite_ext(head_index,anim_frame_action,px,py,image_xscale,image_yscale,image_angle,c_white,image_alpha);

			//Gorne ubranie
			draw_sprite_ext(torso_index,anim_frame_action,px,py,image_xscale,image_yscale,image_angle,c_white,image_alpha);
			
			//Spodnie
			draw_sprite_ext(legs_index,0,px,py,image_xscale,image_yscale,image_angle,c_white,image_alpha);
			
			if ((anim_frame_action >= 0.1) && (anim_frame_action <= 1.8)) || ((anim_frame_action >= 8) && (anim_frame_action <= 10)){
				//Przedmiot pity
				draw_sprite_general(spr_inventory_items, 0, sx, sy + itemUsedSx, 24, 24 - itemUsedSx, px - 7 + (itemUsedX), py + 13 + (itemUsedY), .5, (.5 * itemUsedYscale), itemUsedAngle, c_white, c_white, c_white, c_white, 1);
			}
			
			//Dlonie
			draw_sprite_ext(hands_index,anim_frame_action,px,py,image_xscale,image_yscale,image_angle,c_white,image_alpha);

			//Buty
			draw_sprite_ext(boots_index,0,px,py,image_xscale,image_yscale,image_angle,c_white,image_alpha);	
		}
		if (state == player_state.wading_idle) || (state == player_state.wading){
			//Glowa
			draw_sprite_ext(head_index,anim_frame_action,px,py + 4,image_xscale,image_yscale,image_angle,c_white,image_alpha);

			//Gorne ubranie
			draw_sprite_ext(torso_index,anim_frame_action,px,py + 4,image_xscale,image_yscale,image_angle,c_white,image_alpha);
			
			//Spodnie
			draw_sprite_part_ext(legs_index,0, 0, sprite_yoffset, sprite_width, sprite_height - 4,px - sprite_xoffset,py + 4,image_xscale,image_yscale,c_white,image_alpha);
			
			if (anim_frame_action >= 1) && (anim_frame_action <= 8){
				//Przedmiot pity
				draw_sprite_general(spr_inventory_items, 0, sx, sy + itemUsedSx, 24, 24 - itemUsedSx, px - 7 + (itemUsedX), py + 13 + (itemUsedY), .5, (.5 * itemUsedYscale), itemUsedAngle, c_white, c_white, c_white, c_white, 1);
			}
			
			//Dlonie
			draw_sprite_ext(hands_index,anim_frame_action,px,py + 4,image_xscale,image_yscale,image_angle,c_white,image_alpha);


		}
		if (state == player_state.swimming_idle) || (state == player_state.swimming){
	
			//Glowa
			draw_sprite_part_ext(head_index,anim_frame_action, 0, sprite_yoffset, sprite_width, sprite_height - 16,px - sprite_xoffset,py + 16,image_xscale,image_yscale,c_white,image_alpha);
	
			//Gorne ubranie
			draw_sprite_part_ext(torso_index,anim_frame_action, 0, sprite_yoffset, sprite_width, sprite_height - 16,px - sprite_xoffset,py + 16,image_xscale,image_yscale,c_white,image_alpha);	
			
			//Dlonie
			draw_sprite_part_ext(hands_index,anim_frame_action, 0, sprite_yoffset, sprite_width, sprite_height - 16,px - sprite_xoffset,py + 16,image_xscale,image_yscale,c_white,image_alpha);	
			
			if (anim_frame_action >= 3) && (anim_frame_action <= 7){
				//Przedmiot pity
				draw_sprite_general(spr_inventory_items, 0, sx, sy + itemUsedSx, 24, 24 - itemUsedSx, px - 7 + (itemUsedX), py + 13 + (itemUsedY), .5, (.5 * itemUsedYscale), itemUsedAngle, c_white, c_white, c_white, c_white, 1);
			}
		}
	}else
	if (actionstate == player_state_action.attacking_melee){
		if (state == player_state.idle) || (state == player_state.moving){
			
			var sx = (itemeaten mod obj_inventory.spr_inv_items_columns) * 24;
			var sy = (itemeaten div obj_inventory.spr_inv_items_columns) * 24;
			
			switch(facing){
				case dirc.down: //Za dlonia
					//Glowa
					draw_sprite_ext(head_index,anim_frame_action,px,py,image_xscale,image_yscale,image_angle,c_white,image_alpha);

					//Gorne ubranie
					draw_sprite_ext(torso_index,anim_frame_action,px,py,image_xscale,image_yscale,image_angle,c_white,image_alpha);

					//Spodnie
					draw_sprite_ext(legs_index,anim_frame_action,px,py,image_xscale,image_yscale,image_angle,c_white,image_alpha);

					//Buty
					draw_sprite_ext(boots_index,anim_frame_action,px,py,image_xscale,image_yscale,image_angle,c_white,image_alpha);	

					
					//Dlonie
					draw_sprite_ext(hands_index,anim_frame_action,px,py,image_xscale,image_yscale,image_angle,c_white,image_alpha);
				break;
				case dirc.left: // Roznie
			
					//Glowa
					draw_sprite_ext(head_index,anim_frame_action,px,py,image_xscale,image_yscale,image_angle,c_white,image_alpha);

					//Gorne ubranie
					draw_sprite_ext(torso_index,anim_frame_action,px,py,image_xscale,image_yscale,image_angle,c_white,image_alpha);

					//Spodnie
					draw_sprite_ext(legs_index,anim_frame_action,px,py,image_xscale,image_yscale,image_angle,c_white,image_alpha);

					//Buty
					draw_sprite_ext(boots_index,anim_frame_action,px,py,image_xscale,image_yscale,image_angle,c_white,image_alpha);	
			
					
					//Dlonie
					draw_sprite_ext(hands_index,anim_frame_action,px,py,image_xscale,image_yscale,image_angle,c_white,image_alpha);
				break;
				case dirc.right: // Roznie
			
					//Glowa
					draw_sprite_ext(head_index,anim_frame_action,px,py,image_xscale,image_yscale,image_angle,c_white,image_alpha);

					//Gorne ubranie
					draw_sprite_ext(torso_index,anim_frame_action,px,py,image_xscale,image_yscale,image_angle,c_white,image_alpha);

					//Spodnie
					draw_sprite_ext(legs_index,anim_frame_action,px,py,image_xscale,image_yscale,image_angle,c_white,image_alpha);

					//Buty
					draw_sprite_ext(boots_index,anim_frame_action,px,py,image_xscale,image_yscale,image_angle,c_white,image_alpha);	
		
					
					//Dlonie
					draw_sprite_ext(hands_index,anim_frame_action,px,py,image_xscale,image_yscale,image_angle,c_white,image_alpha);
				break;
				case dirc.up: // Za wszystkim
			
					//Glowa
					draw_sprite_ext(head_index,anim_frame_action,px,py,image_xscale,image_yscale,image_angle,c_white,image_alpha);

					//Gorne ubranie
					draw_sprite_ext(torso_index,anim_frame_action,px,py,image_xscale,image_yscale,image_angle,c_white,image_alpha);

					//Spodnie
					draw_sprite_ext(legs_index,anim_frame_action,px,py,image_xscale,image_yscale,image_angle,c_white,image_alpha);

					//Buty
					draw_sprite_ext(boots_index,anim_frame_action,px,py,image_xscale,image_yscale,image_angle,c_white,image_alpha);	
					
					//Dlonie
					draw_sprite_ext(hands_index,anim_frame_action,px,py,image_xscale,image_yscale,image_angle,c_white,image_alpha);
				break;
			}
		}
	}
	
	*/
	
}
