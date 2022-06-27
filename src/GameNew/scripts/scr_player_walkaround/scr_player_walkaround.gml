function scr_player_walkaround(){
	
	var slope = instance_place(x + hsp, y + vsp, par_slope);
	
	if (slope){exit;}
	
	var half = (bbox_bottom - bbox_top)/2;
	
	var half_hor = (bbox_right - bbox_left)/2;
	
	var __spd = spd/1.5;
	
	// Podchodzenie do prawego dolu
	var rightbottom_col__righttop_empty = collision_rectangle(bbox_left, bbox_top, bbox_right + 1, bbox_top + half*2, par_collision, true, true);
	var rightbottom_empty__righttop_col = collision_rectangle(bbox_left, bbox_top + half*2, bbox_right + 1, bbox_bottom, par_collision, true, true);
	var righttop = collision_rectangle(bbox_left, bbox_top - half*2, bbox_right + 1, bbox_top, par_collision, true, true);
	
	if (rightbottom_col__righttop_empty){
		if ((rightbottom_col__righttop_empty != noone) && (rightbottom_col__righttop_empty.cancollide)){
			if (!rightbottom_empty__righttop_col) || ( (rightbottom_empty__righttop_col) && (rightbottom_empty__righttop_col != noone) && (!rightbottom_empty__righttop_col.cancollide) ){
				if (key_right) && (!key_up){
					vsp = __spd;
				}
			}
		}
	}
	// Podchodzenie do prawej gory
	if (rightbottom_empty__righttop_col){
		if ((rightbottom_empty__righttop_col != noone) && (rightbottom_empty__righttop_col.cancollide)){
			if (!righttop) || ( (righttop) && (righttop != noone) && (!righttop.cancollide) ){
				if (key_right) && (!key_down){
					vsp = -__spd;
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
			if (!leftbottom_empty__lefttop_col) || ( (leftbottom_empty__lefttop_col) && (leftbottom_empty__lefttop_col != noone) && (!leftbottom_empty__lefttop_col.cancollide) ){
				if (key_left) && (!key_up){
					vsp = __spd;
				}
			}
		}
	}
	//Podchodzenie do lewej gory
	if (leftbottom_empty__lefttop_col){
		if ((leftbottom_empty__lefttop_col != noone) && (leftbottom_empty__lefttop_col.cancollide)){
			if (!lefttop) || ( (lefttop) && (lefttop != noone) && (!lefttop.cancollide) ){
				if (key_left) && (!key_down){
					vsp = -__spd;
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
			if (!downtop_empty__downtop_col) || ( (downtop_empty__downtop_col) && (downtop_empty__downtop_col != noone) && (!downtop_empty__downtop_col.cancollide) ){
				if (key_down) && (!key_right){
					hsp = -__spd;
				}
			}
		}
	}
	// Podchodzenie do gornego prawa
	if (downtop_col__downtop_empty){
		if ((downtop_empty__downtop_col != noone) && (downtop_empty__downtop_col.cancollide)){
			if (!downtop) || ( (downtop) && (downtop != noone) && (!downtop.cancollide) ){
				if (key_down) && (!key_left){
					hsp = __spd;
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
			if (!upbottom_empty__upbottom_col) || ( (upbottom_empty__upbottom_col) && (upbottom_empty__upbottom_col != noone) && (!upbottom_empty__upbottom_col.cancollide) ){
				if (key_up) && (!key_right){
					hsp = -__spd;
				}
			}
		}
	}
	// Podchodzenie do dolnego prawa
	if (upbottom_col__upbottom_empty){
		if ((upbottom_empty__upbottom_col != noone) && (upbottom_empty__upbottom_col.cancollide)){
			if (!upbottom) || ( (upbottom) && (upbottom != noone) && (!upbottom.cancollide) ){
				if (key_up) && (!key_left){
					hsp = __spd;
				}
			}
		}
	}
	
}