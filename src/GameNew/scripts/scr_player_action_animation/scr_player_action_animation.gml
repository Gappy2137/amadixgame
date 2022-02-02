function scr_player_action_animation(){
var fixY = 0;
var fixAngle = 0;
if (state == player_state.wading) || (state == player_state.wading_idle) {
    fixY = 4;
}
else if (state == player_state.swimming) || (state == player_state.swimming_idle) {
    fixY = 16;
}
else {
    fixY = 0;
}

var alarmcurveAsset = curve_attack_delay;
var alarmcurvePos = anim_speed_action;
var alarmcurveStruct = animcurve_get(alarmcurveAsset);
var alarmcurveChannel = animcurve_get_channel(alarmcurveStruct, "delay");

var alarmcurveVal = animcurve_channel_evaluate(alarmcurveChannel, alarmcurvePos);

var alarmval = clamp(alarmcurveVal, 1, 10);

switch (actionstate){
	case player_state_action.eating:
			anim_frame_action_num = 8;
			if (floor(anim_frame_action) == 0){itemUsedX = 1;itemUsedY = -1 + fixY;itemUsedAngle = -15;itemUsedSx = 0;}
			if (floor(anim_frame_action) == 1){itemUsedX = 1;itemUsedY = -1.2 + fixY;itemUsedAngle = -10;itemUsedSx = 0;}
			if (floor(anim_frame_action) == 2){itemUsedX = 0.75;itemUsedY = -3 + fixY;itemUsedAngle = -5;itemUsedSx = 0;}
			if (floor(anim_frame_action) == 3){itemUsedX = 0.5;itemUsedY = -0.5 + fixY;itemUsedAngle = 0;itemUsedSx = 10;
				var part = instance_create_layer(x + itemUsedX - 2, y + itemUsedY + 13 + fixY, "Instances", obj_food_part);
				with(part){
					sx = (obj_amadix.itemeaten mod obj_inventory.spr_inv_items_columns) * 24;
					sy = (obj_amadix.itemeaten div obj_inventory.spr_inv_items_columns) * 24;
					spd = random_range(0.1, 0.6);
					direction = irandom_range(0, 359);
				}
		
			}
			if (floor(anim_frame_action) == 4){itemUsedX = 0.5;itemUsedY = -0.5 + fixY;itemUsedAngle = 0;itemUsedSx = 10;}
			if (floor(anim_frame_action) == 5){itemUsedX = 0.75;itemUsedY = 0 + fixY;itemUsedAngle = -5;itemUsedSx = 14;}
			if (floor(anim_frame_action) == 6){itemUsedX = 1;itemUsedY = 0 + fixY;itemUsedAngle = -10;itemUsedSx = 20;}
	break;
	case player_state_action.drinking:
			anim_frame_action_num = 11;
			if (floor(anim_frame_action) == 0){itemUsedX = 0;itemUsedY = -1 + fixY;itemUsedAngle = -15;itemUsedYscale = 1;}
			if (floor(anim_frame_action) == 1){itemUsedX = -0.25;itemUsedY = -1.25 + fixY;itemUsedAngle = -10;itemUsedYscale = 1;}
			if (floor(anim_frame_action) == 2){itemUsedX = 0;itemUsedY = -1.5 + fixY;itemUsedAngle = -5;itemUsedYscale = 1;}
			if (floor(anim_frame_action) == 3){itemUsedX = 0.5;itemUsedY = -0.25 + fixY;itemUsedAngle = 15;itemUsedYscale = -1;}
			if (floor(anim_frame_action) == 4){itemUsedX = 1;itemUsedY = 0 + fixY;itemUsedAngle = 15;itemUsedYscale = -1;}
			if (floor(anim_frame_action) == 5){itemUsedX = 1;itemUsedY = 0 + fixY;itemUsedAngle = 15;itemUsedYscale = -1;}
			if (floor(anim_frame_action) == 6){itemUsedX = 1;itemUsedY = 0 + fixY;itemUsedAngle = 15;itemUsedYscale = -1;}
			if (floor(anim_frame_action) == 7){itemUsedX = 0.5;itemUsedY = -0.25 + fixY;itemUsedAngle = 15;itemUsedYscale = -1;}
			if (floor(anim_frame_action) == 8){itemUsedX = 0;itemUsedY = -1.5 + fixY;itemUsedAngle = -5;itemUsedYscale = 1;}
			if (floor(anim_frame_action) == 9){itemUsedYscale = 0;}
	break;
	case player_state_action.attacking_melee:
	
			anim_frame_action_num = 7;
			if ((anim_frame_action) >= (anim_frame_action_num)) && (!attackSpeedFix){
				alarm[0] = alarmval;
				attackSpeedFix = true;
			}
			
				switch(facing){
				case dirc.down:
				
						if (oneStepEvent[0] == true){
							instance_create_layer(x, y, "Instances", obj_seq_item);
							var swing = instance_create_layer(x, y + 16, "Instances", obj_melee_swing);
							with (swing){
								animation_speed = other.anim_speed_action;
							}
							oneStepEvent[0] = false;
						}
						
						var curveAsset = curve_attack_melee_down;
						var curvePos = anim_frame_action/anim_frame_action_num;

						curvePos = anim_frame_action/anim_frame_action_num;

						var curveStruct = animcurve_get(curveAsset);
						var curveXChannel = animcurve_get_channel(curveStruct, "x");
						var curveYChannel = animcurve_get_channel(curveStruct, "y");
						var curveRotChannel = animcurve_get_channel(curveStruct, "rot");

						var curveX = animcurve_channel_evaluate(curveXChannel, curvePos);
						var curveY = animcurve_channel_evaluate(curveYChannel, curvePos);
						var curveRot = animcurve_channel_evaluate(curveRotChannel, curvePos);
						
						
						if (instance_exists(obj_seq_item)){
							with (obj_seq_item){
								item_id = other.itemeaten;
								x = obj_amadix.x + curveX;
								y = obj_amadix.y + curveY;
								rot = curveRot;
								
								
								if (other.anim_frame_action >= other.anim_frame_action_num){
									if (other.oneStepEvent[1] == true){
										alarm[0] = alarmval;
										other.oneStepEvent[1] = false;
									}
								}
							}
						}

				break;
				case dirc.right:

						if (oneStepEvent[0] == true){
							instance_create_layer(x, y, "Instances", obj_seq_item);
							/*
							var swing = instance_create_layer(x, y + 16, "Instances", obj_melee_swing);
							with (swing){
								animation_speed = other.anim_speed_action;
							}
							*/
							oneStepEvent[0] = false;
						}
						
						var curveAsset = curve_attack_melee_right;
						var curvePos = anim_frame_action/anim_frame_action_num;

						curvePos = anim_frame_action/anim_frame_action_num;

						var curveStruct = animcurve_get(curveAsset);
						var curveXChannel = animcurve_get_channel(curveStruct, "x");
						var curveYChannel = animcurve_get_channel(curveStruct, "y");
						var curveRotChannel = animcurve_get_channel(curveStruct, "rot");

						var curveX = animcurve_channel_evaluate(curveXChannel, curvePos);
						var curveY = animcurve_channel_evaluate(curveYChannel, curvePos);
						var curveRot = animcurve_channel_evaluate(curveRotChannel, curvePos);
						
						
						if (instance_exists(obj_seq_item)){
							with (obj_seq_item){
								item_id = other.itemeaten;
								x = obj_amadix.x + curveX;
								y = obj_amadix.y + curveY;
								rot = curveRot;
								
								
								if (other.anim_frame_action >= other.anim_frame_action_num){
									if (other.oneStepEvent[1] == true){
										alarm[0] = alarmval;
										other.oneStepEvent[1] = false;
									}
								}
							}
						}


				break;
				case dirc.left:
				
				break;
				case dirc.up:
				
				
						if (oneStepEvent[0] == true){
							instance_create_layer(x, y, "Instances", obj_seq_item);
							/*
							var swing = instance_create_layer(x, y + 16, "Instances", obj_melee_swing);
							with (swing){
								animation_speed = other.anim_speed_action;
							}
							*/
							oneStepEvent[0] = false;
						}
						
						var curveAsset = curve_attack_melee_up;
						var curvePos = anim_frame_action/anim_frame_action_num;

						curvePos = anim_frame_action/anim_frame_action_num;

						var curveStruct = animcurve_get(curveAsset);
						var curveXChannel = animcurve_get_channel(curveStruct, "x");
						var curveYChannel = animcurve_get_channel(curveStruct, "y");
						var curveRotChannel = animcurve_get_channel(curveStruct, "rot");
						var curveYoriginChannel = animcurve_get_channel(curveStruct, "yor");

						var curveX = animcurve_channel_evaluate(curveXChannel, curvePos);
						var curveY = animcurve_channel_evaluate(curveYChannel, curvePos);
						var curveRot = animcurve_channel_evaluate(curveRotChannel, curvePos);
						var curveYorigin = animcurve_channel_evaluate(curveYoriginChannel, curvePos);
						
						
						if (instance_exists(obj_seq_item)){
							with (obj_seq_item){
								item_id = other.itemeaten;
								x = obj_amadix.x + curveX;
								y = obj_amadix.y + curveY;
								rot = curveRot;
								yorigin = other.yorigin + curveYorigin;
								
								if (other.anim_frame_action >= other.anim_frame_action_num){
									if (other.oneStepEvent[1] == true){
										alarm[0] = alarmval;
										other.oneStepEvent[1] = false;
									}
								}
							}
						}
				
				break;
			}
	break;
	default:
		itemUsedX = 0;
		itemUsedY = 0;
		itemUsedAngle = 0;
		itemUsedSx = 0;
		itemUsedYscale = 1;
	break;
}
}