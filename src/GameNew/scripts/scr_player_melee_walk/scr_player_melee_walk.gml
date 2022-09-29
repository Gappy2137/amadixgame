function scr_player_melee_walk(){
if (running != 2){
	switch(iteminhand){
		case item.none:
			melee_index = spr_none;
		break;
		case item.sword:
			switch(facing){
				case index_facing.down:
					melee_index = spr_melee_sword_d;
				break;
				case index_facing.left:
					melee_index = spr_melee_sword_l;
					if (floor(anim_frame) == 0){iteminhandX = -25 + 16;iteminhandY = 22;iteminhandAngle = 45;}
					if (floor(anim_frame) == 1){iteminhandX = -23 + 16;iteminhandY = 29;iteminhandAngle = 65;}
					if (floor(anim_frame) == 2){iteminhandX = -25 + 16;iteminhandY = 22;iteminhandAngle = 45;}
					if (floor(anim_frame) == 3){iteminhandX = -26 + 16;iteminhandY = 12;iteminhandAngle = 20;}
				break;
				case index_facing.right:
					melee_index = spr_melee_sword_r;
					if (floor(anim_frame) == 0){iteminhandX = 3 + 16;iteminhandY = 5;iteminhandAngle = -45;}
					if (floor(anim_frame) == 1){iteminhandX = -1 + 16;iteminhandY = 4;iteminhandAngle = -20;}
					if (floor(anim_frame) == 2){iteminhandX = 3 + 16;iteminhandY = 5;iteminhandAngle = -45;}
					if (floor(anim_frame) == 3){iteminhandX = 6 + 16;iteminhandY = 9;iteminhandAngle = -65;}
				break;
				case index_facing.up:
					melee_index = spr_melee_sword_u;
				break;
			}
		break;
		default:
			melee_index = spr_none;
		break;
	}
}else{
	melee_index = spr_none;
}
}