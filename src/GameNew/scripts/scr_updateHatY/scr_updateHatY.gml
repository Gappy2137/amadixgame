function scr_updateHatY(){
	switch(actionstate){
		case player_state_action.none:
				hat_rot = 0;
				if (skid){
					hatY = 1;
				}else{
					if (running != 2){
						if (floor(anim_frame) == 0){hatY = 0;}
						if (floor(anim_frame) == 1){hatY = 1;}
						if (floor(anim_frame) == 2){hatY = 0;}
						if (floor(anim_frame) == 3){hatY = 1;}
					}else{
						if (floor(anim_frame) == 0){hatY = 0;}
						if (floor(anim_frame) == 1){hatY = 1;}
						if (floor(anim_frame) == 2){hatY = 2;}
						if (floor(anim_frame) == 3){hatY = 3;}
						if (floor(anim_frame) == 4){hatY = 3;}
						if (floor(anim_frame) == 5){hatY = 1;}
						if (floor(anim_frame) == 6){hatY = 0;}
						if (floor(anim_frame) == 7){hatY = 1;}
						if (floor(anim_frame) == 8){hatY = 2;}
						if (floor(anim_frame) == 9){hatY = 3;}
						if (floor(anim_frame) == 10){hatY = 3;}
						if (floor(anim_frame) == 11){hatY = 1;}
					}
				}
		break;
		case player_state_action.eating:
			hat_rot = 0;
			hatY = 0;
		break;
		case player_state_action.drinking:
			hat_rot = 0;
			if (floor(anim_frame_action) == 0){hatY = 0;}
			if (floor(anim_frame_action) == 2){hatY = -1;}
			if (floor(anim_frame_action) == 3){hatY = -1;}
			if (floor(anim_frame_action) == 4){hatY = -1;}
			if (floor(anim_frame_action) == 5){hatY = -1;}
			if (floor(anim_frame_action) == 6){hatY = -1;}
			if (floor(anim_frame_action) == 7){hatY = -1;}
			if (floor(anim_frame_action) == 8){hatY = 0;}
		break;
		case player_state_action.attacking_melee:
			hat_rot = 0;
			if (floor(anim_frame_action) == 0){hatY = 0;}
			if (floor(anim_frame_action) == 1){hatY = 0;}
			if (floor(anim_frame_action) == 2){hatY = 1;}
			if (floor(anim_frame_action) == 3){hatY = 1;}
			if (floor(anim_frame_action) == 4){hatY = 2;}
			if (floor(anim_frame_action) == 5){hatY = 2;}
			if (floor(anim_frame_action) == 6){hatY = 2;}
			if (floor(anim_frame_action) == 7){hatY = 2;}
		break;
		case player_state_action.handgun:
				hat_rot = 0;
				if (skid){
					hatY = 1;
				}else{
					if (running != 2){
						if (floor(anim_frame) == 0){hatY = 0;}
						if (floor(anim_frame) == 1){hatY = 1;}
						if (floor(anim_frame) == 2){hatY = 0;}
						if (floor(anim_frame) == 3){hatY = 1;}
					}else{
						if (floor(anim_frame) == 0){hatY = 0;}
						if (floor(anim_frame) == 1){hatY = 1;}
						if (floor(anim_frame) == 2){hatY = 2;}
						if (floor(anim_frame) == 3){hatY = 3;}
						if (floor(anim_frame) == 4){hatY = 3;}
						if (floor(anim_frame) == 5){hatY = 1;}
						if (floor(anim_frame) == 6){hatY = 0;}
						if (floor(anim_frame) == 7){hatY = 1;}
						if (floor(anim_frame) == 8){hatY = 2;}
						if (floor(anim_frame) == 9){hatY = 3;}
						if (floor(anim_frame) == 10){hatY = 3;}
						if (floor(anim_frame) == 11){hatY = 1;}
					}
				}
		break;
		case player_state_action.pickup:
		
			var face = 0;
			switch(facing){
				case index_facing.down:
					face = 0;
				break;
				case index_facing.left:
					face = 1;
				break;
				case index_facing.right:
					face = -1;
				break;
				case index_facing.up:
					face = 0;
				break;
			}
		
			if (floor(anim_frame_action) == 0){hatY = 0; hat_rot = 0;}
			if (floor(anim_frame_action) == 1){hatY = 3; hat_rot = 0;}
			if (floor(anim_frame_action) == 2){hatY = 6; hat_rot = 0;}
		break;
	}
}