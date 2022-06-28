function scr_player_walkaround(){
	
	if (!canmove){exit;}
	
	var slope = instance_place(x + hsp, y + vsp, par_slope);
	
	if (slope){exit;}
	
	var half = (bbox_bottom - bbox_top)/2;
	
	var half_hor = (bbox_right - bbox_left)/2;
	
	var __spd = spd;
	
	
	var bbox_tox = collision_rectangle(bbox_left - key_left, bbox_top, bbox_right + key_right, bbox_bottom, par_collision, true, true);
	var bbox_tox_down = collision_rectangle(bbox_left - key_left, bbox_bottom, bbox_right + key_right, bbox_bottom + 1, par_collision, true, true);
	var bbox_tox_up = collision_rectangle(bbox_left - key_left, bbox_top - 1, bbox_right + key_right, bbox_top, par_collision, true, true);
	
	
	
	if (bbox_tox){
		
		if ((bbox_tox != noone) && (bbox_tox.cancollide)){
			
			//-------------------------------------
			// Podchodzenie do prawego i lewego dolu
			if (!bbox_tox_down){
				if (((key_right) && (!key_up)) || ((key_left) && (!key_up))) {
					vsp = __spd;
				}
			}else{
				if (bbox_tox_down != noone) && (!bbox_tox_down.cancollide){
					if (((key_right) && (!key_up)) || ((key_left) && (!key_up))){
						vsp = __spd;
					}
				}
			}
			//-------------------------------------
			
			
			//-------------------------------------
			// Podchodzenie do prawej i lewej gory
			if (!bbox_tox_up){
				if (((key_right) && (!key_down)) || ((key_left) && (!key_down))){
					vsp = -__spd;
				}
			}else{
				if (bbox_tox_up != noone) && (!bbox_tox_up.cancollide){
					if (((key_right) && (!key_down)) || ((key_left) && (!key_down))){
						vsp = -__spd;
					}
				}
			}
			//-------------------------------------
			
			
		}
	}
	
	
	var bbox_toy = collision_rectangle(bbox_left, bbox_top - key_up, bbox_right, bbox_bottom + key_down, par_collision, true, true);
	var bbox_toy_left = collision_rectangle(bbox_left - 1, bbox_top - key_up, bbox_left, bbox_bottom + key_down, par_collision, true, true);
	var bbox_toy_right = collision_rectangle(bbox_right, bbox_top - key_up, bbox_right + 1, bbox_bottom + key_down, par_collision, true, true);
	
	
	if (bbox_toy){
		
		if ((bbox_toy != noone) && (bbox_toy.cancollide)){
			
			//-------------------------------------
			// Podchodzenie do gornego lewa i dolnego lewa
			if (!bbox_toy_left){
				if (((key_down) && (!key_right)) || ((key_up) && (!key_right))) {
					hsp = -__spd;
				}
			}else{
				if (bbox_toy_left != noone) && (!bbox_toy_left.cancollide){
					if (((key_down) && (!key_right)) || ((key_up) && (!key_right))){
						hsp = -__spd;
					}
				}
			}
			//-------------------------------------
			
			
			//-------------------------------------
			// Podchodzenie do gornego prawa i dolnego prawa
			if (!bbox_toy_right){
				if (((key_down) && (!key_left)) || ((key_up) && (!key_left))){
					hsp = __spd;
				}
			}else{
				if (bbox_toy_right != noone) && (!bbox_toy_right.cancollide){
					if (((key_down) && (!key_left)) || ((key_up) && (!key_left))){
						hsp = __spd;
					}
				}
			}
			//-------------------------------------
			
			
		}
	}
	
	/*
	// Podchodzenie do prawego dolu
	var rightbottom_col__righttop_empty = collision_rectangle(bbox_left, bbox_top, bbox_right + 1, bbox_bottom, par_collision, true, true);
	var rightbottom_empty__righttop_col = collision_rectangle(bbox_left, bbox_bottom, bbox_right + 1, bbox_bottom + half*2, par_collision, true, true);
	var righttop = collision_rectangle(bbox_left, bbox_top - half*2, bbox_right + 1, bbox_top, par_collision, true, true);
	
	if (rightbottom_col__righttop_empty){
		if ((rightbottom_col__righttop_empty != noone) && (rightbottom_col__righttop_empty.cancollide)){
			if (!rightbottom_empty__righttop_col){
				if (key_right) && (!key_up){
					vsp = __spd;
				}
			}else{
				if (rightbottom_empty__righttop_col != noone) && (!rightbottom_empty__righttop_col.cancollide){
					if (key_right) && (!key_up){
						vsp = __spd;
					}
				}
			}
		}
	}
	// Podchodzenie do prawej gory
	if (rightbottom_empty__righttop_col){
		if ((rightbottom_empty__righttop_col != noone) && (rightbottom_empty__righttop_col.cancollide)){
			if (!righttop){
				if (key_right) && (!key_down){
					vsp = -__spd;
				}
			}else{
				if (righttop != noone) && (!righttop.cancollide){
					if (key_right) && (!key_down){
						vsp = -__spd;
					}
				}
			}
		}
	}
	
	
	
	//Podchodzenie do lewego dolu
	var leftbottom_col__lefttop_empty = collision_rectangle(bbox_left - 1, bbox_top, bbox_right, bbox_top + half*2, par_collision, true, true);
	var leftbottom_empty__lefttop_col = collision_rectangle(bbox_left - 1, bbox_top + half*2, bbox_right, bbox_bottom, par_collision, true, true);
	var lefttop = collision_rectangle(bbox_left - 1, bbox_top - half*2, bbox_right, bbox_top, par_collision, true, true);
	
	if (leftbottom_col__lefttop_empty){
		if ((leftbottom_col__lefttop_empty != noone) && (leftbottom_col__lefttop_empty.cancollide)){
			if (!leftbottom_empty__lefttop_col){
				if (key_left) && (!key_up){
					vsp = __spd;
				}
			}else{
				if (leftbottom_empty__lefttop_col != noone) && (!leftbottom_empty__lefttop_col.cancollide){
					if (key_left) && (!key_up){
						vsp = __spd;
					}
				}
			}
		}
	}
	//Podchodzenie do lewej gory
	if (leftbottom_empty__lefttop_col){
		if ((leftbottom_empty__lefttop_col != noone) && (leftbottom_empty__lefttop_col.cancollide)){
			if (!lefttop){
				if (key_left) && (!key_down){
					vsp = -__spd;
				}
			}else{
				if (lefttop != noone) && (!lefttop.cancollide){
					if (key_left) && (!key_down){
						vsp = -__spd;
					}
				}
			}
		}
	}
	
	
	
	
	// Podchodzenie do gornego lewa
	var downtop_col__downtop_empty = collision_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom + 1, par_collision, true, true);
	var downtop = collision_rectangle(bbox_right, bbox_top, bbox_right + half_hor*2, bbox_bottom + 1, par_collision, true, true);
	var downtop_empty__downtop_col = collision_rectangle(bbox_left - half_hor*2, bbox_top, bbox_left, bbox_bottom + 1, par_collision, true, true);
	
	if (downtop_col__downtop_empty){
		if ((downtop_col__downtop_empty != noone) && (downtop_col__downtop_empty.cancollide)){
			if (!downtop_empty__downtop_col){
				if (key_down) && (!key_right){
					hsp = -__spd;
				}
			}else{
				if (downtop_empty__downtop_col != noone) && (!downtop_empty__downtop_col.cancollide){
					if (key_down) && (!key_right){
						hsp = -__spd;
					}
				}
			}
		}
	}
	// Podchodzenie do gornego prawa
	if (downtop_col__downtop_empty){
		if ((downtop_empty__downtop_col != noone) && (downtop_empty__downtop_col.cancollide)){
			if (!downtop){
				if (key_down) && (!key_left){
					hsp = __spd;
				}
			}else{
				if (downtop != noone) && (!downtop.cancollide){
					if (key_down) && (!key_left){
						hsp = __spd;
					}
				}
			}
		}
	}
	
	// Podchodzenie do dolnego lewa
	var upbottom_col__upbottom_empty = collision_rectangle(bbox_left, bbox_top - 1, bbox_right, bbox_bottom, par_collision, true, true);
	var upbottom_empty__upbottom_col = collision_rectangle(bbox_left - half_hor*2, bbox_top - 1, bbox_left, bbox_bottom, par_collision, true, true);
	var upbottom = collision_rectangle(bbox_right, bbox_top - 1, bbox_right + half_hor*2, bbox_bottom, par_collision, true, true);
	
	if (upbottom_col__upbottom_empty){
		if ((upbottom_col__upbottom_empty != noone) && (upbottom_col__upbottom_empty.cancollide)){
			if (!upbottom_empty__upbottom_col){
				if (key_up) && (!key_right){
					hsp = -__spd;
				}
			}else{
				if (upbottom_empty__upbottom_col != noone) && (!upbottom_empty__upbottom_col.cancollide){
					if (key_up) && (!key_right){
						hsp = -__spd;
					}
				}
			}
		}
	}
	// Podchodzenie do dolnego prawa
	if (upbottom_col__upbottom_empty){
		if ((upbottom_empty__upbottom_col != noone) && (upbottom_empty__upbottom_col.cancollide)){
			if (!upbottom){
				if (key_up) && (!key_left){
					hsp = __spd;
				}
			}else{
				if (upbottom != noone) && (!upbottom.cancollide){
					if (key_up) && (!key_left){
						hsp = __spd;
					}
				}
			}
		}
	}
	*/
}