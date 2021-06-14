function scr_player_action_animation(){
var fixY = 0;
if (state == player_state.wading) || (state == player_state.wading_idle) {
    fixY = 4;
}
else if (state == player_state.swimming) || (state == player_state.swimming_idle) {
    fixY = 16;
}
else {
    fixY = 0;
}

switch (actionstate){
	case player_state_action.eating:
			anim_frame_action_num = 8;
			if (floor(anim_frame_action) == 0){eatingX = 1;eatingY = -1 + fixY;eatingAngle = -15;eatingSx = 0;}
			if (floor(anim_frame_action) == 1){eatingX = 1;eatingY = -1.2 + fixY;eatingAngle = -10;eatingSx = 0;}
			if (floor(anim_frame_action) == 2){eatingX = 0.75;eatingY = -3 + fixY;eatingAngle = -5;eatingSx = 0;}
			if (floor(anim_frame_action) == 3){eatingX = 0.5;eatingY = -0.5 + fixY;eatingAngle = 0;eatingSx = 10;
				var part = instance_create_layer(x + eatingX - 2, y + eatingY + 13 + fixY, "Instances", obj_food_part);
				with(part){
					sx = (obj_amadix.itemeaten mod obj_inventory.spr_inv_items_columns) * 24;
					sy = (obj_amadix.itemeaten div obj_inventory.spr_inv_items_columns) * 24;
					spd = random_range(0.1, 0.6);
					direction = irandom_range(0, 359);
				}
		
			}
			if (floor(anim_frame_action) == 4){eatingX = 0.5;eatingY = -0.5 + fixY;eatingAngle = 0;eatingSx = 10;}
			if (floor(anim_frame_action) == 5){eatingX = 0.75;eatingY = 0 + fixY;eatingAngle = -5;eatingSx = 14;}
			if (floor(anim_frame_action) == 6){eatingX = 1;eatingY = 0 + fixY;eatingAngle = -10;eatingSx = 20;}
	break;
	case player_state_action.drinking:
			anim_frame_action_num = 11;
			if (floor(anim_frame_action) == 0){eatingX = 0;eatingY = -1 + fixY;eatingAngle = -15;eatingYscale = 1;}
			if (floor(anim_frame_action) == 1){eatingX = -0.25;eatingY = -1.25 + fixY;eatingAngle = -10;eatingYscale = 1;}
			if (floor(anim_frame_action) == 2){eatingX = 0;eatingY = -1.5 + fixY;eatingAngle = -5;eatingYscale = 1;}
			if (floor(anim_frame_action) == 3){eatingX = 0.5;eatingY = -0.25 + fixY;eatingAngle = 15;eatingYscale = -1;}
			if (floor(anim_frame_action) == 4){eatingX = 1;eatingY = 0 + fixY;eatingAngle = 15;eatingYscale = -1;}
			if (floor(anim_frame_action) == 5){eatingX = 1;eatingY = 0 + fixY;eatingAngle = 15;eatingYscale = -1;}
			if (floor(anim_frame_action) == 6){eatingX = 1;eatingY = 0 + fixY;eatingAngle = 15;eatingYscale = -1;}
			if (floor(anim_frame_action) == 7){eatingX = 0.5;eatingY = -0.25 + fixY;eatingAngle = 15;eatingYscale = -1;}
			if (floor(anim_frame_action) == 8){eatingX = 0;eatingY = -1.5 + fixY;eatingAngle = -5;eatingYscale = 1;}
			if (floor(anim_frame_action) == 9){eatingYscale = 0;}
	break;
	case player_state_action.attacking_melee:
				switch(facing){
				case dirc.down:
					if (anim_frame_action == anim_speed_action){
						var swing = instance_create_layer(x, y + 16, "Instances", obj_melee_swing);
						var sp = anim_speed_action;
						with (swing){
							animation_speed = sp;
						}	
						instance_create_layer(x, y, "Instances", obj_melee_attack);
						with (obj_melee_attack){
							animation_speed = sp;
							face = dirc.down;
						}
					}
					if (floor(anim_frame_action) == 0){eatingX = 28.5;eatingY = 1.5 + fixY;eatingAngle = 280;eatingSx = 0;}
					if (floor(anim_frame_action) == 1){eatingX = 26;eatingY = 7 + fixY;eatingAngle = 260;eatingSx = 0;}
					if (floor(anim_frame_action) == 2){eatingX = 23;eatingY = 14 + fixY;eatingAngle = 250;eatingSx = 0;}
					if (floor(anim_frame_action) == 3){eatingX = 20;eatingY = 22 + fixY;eatingAngle = 225;eatingSx = 0;}
					if (floor(anim_frame_action) == 4){eatingX = 10;eatingY = 27 + fixY;eatingAngle = 190;eatingSx = 0;}
					if (floor(anim_frame_action) == 5){eatingX = 4;eatingY = 28 + fixY;eatingAngle = 180;eatingSx = 0;}
				break;
				case dirc.right:
					if (anim_frame_action == anim_speed_action){
						var swing = instance_create_layer(x, y + 16, "Instances", obj_melee_swing);
						var sp = anim_speed_action;
						with (swing){
							animation_speed = sp;
						}	
						instance_create_layer(x, y, "Instances", obj_melee_attack);
						with (obj_melee_attack){
							animation_speed = sp;
							face = dirc.down;
						}
					}
					if (floor(anim_frame_action) == 0){eatingX = 8;eatingY = -18 + fixY;eatingAngle = 15;eatingSx = 0;}
					if (floor(anim_frame_action) == 1){eatingX = 12;eatingY = -14 + fixY;eatingAngle = 340;eatingSx = 0;}
					if (floor(anim_frame_action) == 2){eatingX = 24;eatingY = -12 + fixY;eatingAngle = 315;eatingSx = 0;}
				break;
				case dirc.left:
				
				break;
				case dirc.up:
				
				break;
			}
			anim_frame_action_num = 7;
			if ((anim_frame_action) > (anim_frame_action_num)) && (!attackSpeedFix){
				alarm[0] = 10;
				attackSpeedFix = true;
			}
	break;
	default:
		eatingX = 0;
		eatingY = 0;
		eatingAngle = 0;
		eatingSx = 0;
		eatingYscale = 1;
	break;
}
}