function scr_player_pushout(){
	
	var col_list = ds_list_create();
	var col_num = instance_place_list(x, y, par_npc, col_list, true);
	
	if (col_num != noone){
		var __i = 0;
		repeat(col_num){
			if (variable_instance_exists(col_list[| __i], "cancollide")){
				if (col_list[| __i].cancollide == true){
					var npcxCoord = col_list[| __i].bbox_left + ((col_list[| __i].bbox_right - col_list[| __i].bbox_left) / 2);
					var npcyCoord = col_list[| __i].bbox_top + ((col_list[| __i].bbox_bottom - col_list[| __i].bbox_top) / 2);
					
					var myxCoord = bbox_left + ((bbox_right - bbox_left) / 2);
					var myyCoord = bbox_top + ((bbox_bottom - bbox_top) / 2);
					
					var dist = point_distance(myxCoord, myyCoord, npcxCoord, npcyCoord);
					var dir = point_direction(myxCoord, myyCoord, npcxCoord, npcyCoord);
					
					if (running != 2){
						hsp *= .5;
						vsp *= .5;
					}else{
						hsp *= .75;
						vsp *= .75;
					}
					
					if (!moving){
						x -= round_to4(lengthdir_x(dist, dir) / 16);
						y -= round_to4(lengthdir_y(dist, dir) / 16);
					}

				}
			}
			__i++;
		}
		ds_list_destroy(col_list);
	}
	
	
	/*
	var npc = instance_place(x, y, par_npc);
	
	if (npc){
		if (npc.cancollide){
			var npcxCoord = npc.bbox_left + ((npc.bbox_right - npc.bbox_left) / 2);
			var npcyCoord = npc.bbox_top + ((npc.bbox_bottom - npc.bbox_top) / 2);
					
			var myxCoord = bbox_left + ((bbox_right - bbox_left) / 2);
			var myyCoord = bbox_top + ((bbox_bottom - bbox_top) / 2);
					
			var dist = point_distance(myxCoord, myyCoord, npcxCoord, npcyCoord);
			var dir = point_direction(myxCoord, myyCoord, npcxCoord, npcyCoord);
					
			if (running != 2){
				hsp *= .5;
				vsp *= .5;
			}else{
				hsp *= .75;
				vsp *= .75;
			}
					
			if (!moving){
				x -= round_to4(lengthdir_x(dist, dir) / 16);
				y -= round_to4(lengthdir_y(dist, dir) / 16);
			}
		}
	}
*/

	
	
}