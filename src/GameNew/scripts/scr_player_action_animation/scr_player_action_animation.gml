function scr_player_action_animation(){
var fixY = 0;
var fixAngle = 0;
var alarmcurveAsset = curve_attack_delay;
var alarmcurvePos = anim_speed_action;
var alarmcurveStruct = animcurve_get(alarmcurveAsset);
var alarmcurveChannel = animcurve_get_channel(alarmcurveStruct, "delay");

var alarmcurveVal = animcurve_channel_evaluate(alarmcurveChannel, alarmcurvePos);

var alarmval = clamp(round(alarmcurveVal), 1, 10);

switch (actionstate){
	case player_state_action.eating:
			anim_frame_action_num = 6;
			if (floor(anim_frame_action) == 0){itemUsedX = 2;itemUsedY = -2 + fixY;itemUsedAngle = -15;itemUsedSx = 0;}
			if (floor(anim_frame_action) == 1){itemUsedX = 1.4;itemUsedY = -1.4 + fixY;itemUsedAngle = 0;itemUsedSx = 0;}
			if (floor(anim_frame_action) == 2){itemUsedX = 1.4;itemUsedY = -0.5 + fixY;itemUsedAngle = 0;itemUsedSx = 10;}
			if (floor(anim_frame_action) == 3){itemUsedX = 1.4;itemUsedY = 0.1 + fixY;itemUsedAngle = 0;itemUsedSx = 14;
				var part = instance_create_layer(x + itemUsedX - 2, y + itemUsedY + 13 + fixY, "Instances", obj_food_part);
				with(part){
					sx = (obj_amadix.itemeaten mod obj_inventory.spr_inv_items_columns) * 24;
					sy = (obj_amadix.itemeaten div obj_inventory.spr_inv_items_columns) * 24;
					spd = random_range(0.1, 0.6);
					direction = irandom_range(0, 359);
				}
		
			}
			if (floor(anim_frame_action) == 4){itemUsedX = 1.4;itemUsedY = 0.2 + fixY;itemUsedAngle = 0;itemUsedSx = 20;}
	break;
	case player_state_action.drinking:
			anim_frame_action_num = 10;
			if (floor(anim_frame_action) == 0){itemUsedX = 2;itemUsedY = -2 + fixY;itemUsedAngle = -15;itemUsedSx = 0;}
			if (floor(anim_frame_action) == 1){itemUsedX = 1.4;itemUsedY = -1.4 + fixY;itemUsedAngle = 0;itemUsedSx = 0;}
			
			if (floor(anim_frame_action) == 8){itemUsedX = 1.4;itemUsedY = -1.4 + fixY;itemUsedAngle = 0;itemUsedSx = 0;}
			if (floor(anim_frame_action) == 9){itemUsedX = 2;itemUsedY = -2 + fixY;itemUsedAngle = -15;itemUsedSx = 0;}
			if (floor(anim_frame_action) == 10){itemUsedX = 2;itemUsedY = -2 + fixY;itemUsedAngle = -15;itemUsedSx = 0;}
	break;
	case player_state_action.pickup:
	
		
		
		switch(facing){
			case index_facing.down:
				if (floor(anim_frame_action) == 1){itemUsedX = 0;itemUsedY = 1.5 + fixY;itemUsedAngle = 0;itemUsedSx = 0;}
				if (floor(anim_frame_action) == 2){itemUsedX = 0;itemUsedY = 2 + fixY;itemUsedAngle = 0;itemUsedSx = 0;}
			break;
			case index_facing.left:
				if (floor(anim_frame_action) == 1){itemUsedX = -4;itemUsedY = 1.5 + fixY;itemUsedAngle = 0;itemUsedSx = 0;}
				if (floor(anim_frame_action) == 2){itemUsedX = -4;itemUsedY = 2 + fixY;itemUsedAngle = 0;itemUsedSx = 0;}
			break;
			case index_facing.right:
				if (floor(anim_frame_action) == 1){itemUsedX = 6;itemUsedY = 1.5 + fixY;itemUsedAngle = 0;itemUsedSx = 0;}
				if (floor(anim_frame_action) == 2){itemUsedX = 6.5;itemUsedY = 2 + fixY;itemUsedAngle = 0;itemUsedSx = 0;}
			break;
			case index_facing.up:
				itemUsedX = 1000;itemUsedY = 2 + fixY;itemUsedAngle = 0;itemUsedSx = 0;
			break;
		}
	
		if (!pickupTrigger){
			if (floor(anim_frame_action) == 2){
				if (instance_exists(pickupid)){
					with(pickupid){
						pickedup = true;
					}
				}
			}
		}
	break;
	case player_state_action.attacking_melee:
	
			anim_frame_action_num = 7;
			if ((anim_frame_action) >= (anim_frame_action_num)) && (!attackSpeedFix){
				alarm[0] = alarmval;
				attackSpeedFix = true;
			}
			
				switch(facing){
				case index_facing.down:
				
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
								yorigin = obj_amadix.yorigin + curveYorigin;
								
								if (other.anim_frame_action >= other.anim_frame_action_num){
									if (other.oneStepEvent[1] == true){
										alarm[0] = alarmval;
										other.oneStepEvent[1] = false;
									}
								}
							}
						}

				break;
				case index_facing.right:

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
				case index_facing.left:
				
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
						
						var curveAsset = curve_attack_melee_left;
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
				case index_facing.up:
				
				
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