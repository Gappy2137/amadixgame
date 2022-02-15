///@description scr_setPlayerFacingAnim(facing)
function scr_setPlayerFacingAnim(facing){

#region Glowa
	if (!running){
		switch(actionstate){
				case player_state_action.eating:
					head_index = spr_amadix_head_eating;
				break;
				case player_state_action.drinking:
					head_index = spr_amadix_head_drinking;
				break;
				case player_state_action.attacking_melee:
					if facing == index_facing.right
						head_index = spr_amadix_head_attack_r;
					if facing == index_facing.up
						head_index = spr_amadix_head_attack_u;
					if facing == index_facing.left
						head_index = spr_amadix_head_attack_l;
					if facing == index_facing.down
						head_index = spr_amadix_head_attack_d;
				break;
				case player_state_action.none:
					if facing == index_facing.right
						head_index = spr_amadix_head_r;
					if facing == index_facing.up
						head_index = spr_amadix_head_u;
					if facing == index_facing.left
						head_index = spr_amadix_head_l;
					if facing == index_facing.down
						head_index = spr_amadix_head_d;
				break;
			}
		}else{
				if facing == index_facing.right
					head_index = spr_amadix_head_run_r;
				if facing == index_facing.up
					head_index = spr_amadix_head_run_u;
				if facing == index_facing.left
					head_index = spr_amadix_head_run_l;
				if facing == index_facing.down
					head_index = spr_amadix_head_run_d;
	}
#endregion

#region Dlonie
	if (global.playerHands = "short"){
		if (!running){
			switch(actionstate){
				case player_state_action.eating:
					hands_index = spr_amadix_hands_eating;
				break;
				case player_state_action.drinking:
					hands_index = spr_amadix_hands_drinking;
				break;
				case player_state_action.attacking_melee:
					if facing == index_facing.right
						hands_index = spr_amadix_hands_attack_r;
					if facing == index_facing.up
						hands_index = spr_amadix_hands_attack_u;
					if facing == index_facing.left
						hands_index = spr_amadix_hands_attack_l;
					if facing == index_facing.down
						hands_index = spr_amadix_hands_attack_d;
				break;
				case player_state_action.none:
					if facing == index_facing.right
						hands_index = spr_amadix_hands_r;
					if facing == index_facing.up
						hands_index = spr_amadix_hands_u;
					if facing == index_facing.left
						hands_index = spr_amadix_hands_l;
					if facing == index_facing.down
						hands_index = spr_amadix_hands_d;
				break;
			}
		}else{
				if facing == index_facing.right
					hands_index = spr_amadix_hands_run_r;
				if facing == index_facing.up
					hands_index = spr_amadix_hands_run_u;
				if facing == index_facing.left
					hands_index = spr_amadix_hands_run_l;
				if facing == index_facing.down
					hands_index = spr_amadix_hands_run_d;
		}
	}
	if (global.playerHands = "long"){
		if (actionstate == player_state_action.eating){
			hands_index = spr_amadix_longhands_eating;
		}else if (actionstate == player_state_action.drinking){
			hands_index = spr_amadix_longhands_eating;
		}else{
			if facing == index_facing.right
				hands_index = spr_amadix_longhands_r;
			if facing == index_facing.up
				hands_index = spr_amadix_longhands_u;
			if facing == index_facing.left
				hands_index = spr_amadix_longhands_l;
			if facing == index_facing.down
				hands_index = spr_amadix_longhands_d;
		}
	}
#endregion

#region Czapka
	switch(global.playerHat){
		case item.none:
			hat_index = spr_item_none;
		break;
		case item.panama_hat:
			hat_index = spr_panama_hat;
			switch(facing){
				case index_facing.down:
					hat_frame = 0;
				break;
				case index_facing.left:
					hat_frame = 1;
				break;
				case index_facing.right:
					hat_frame = 2;
				break;
				case index_facing.up:
					hat_frame = 3;
				break;
			}
		break;
	}
#endregion


switch(global.playerTorso){
	case item.none:
			switch(actionstate){
				//eating--------------------------------------------------------
				case player_state_action.eating:
					torso_index = spr_amadix_bareTC_eating;
				break;
				//--------------------------------------------------------------
				
				//drinking------------------------------------------------------
				case player_state_action.drinking:
					torso_index = spr_amadix_bareTC_drinking;
				break;
				//--------------------------------------------------------------
				
				//attacking-----------------------------------------------------
				case player_state_action.attacking_melee:
					switch(facing){
						case index_facing.down:
							torso_index = spr_amadix_bareTC_attack_d;
						break;
						case index_facing.left:
							torso_index = spr_amadix_bareTC_attack_l;
						break;
						case index_facing.right:
							torso_index = spr_amadix_bareTC_attack_r;
						break;
						case index_facing.up:
							torso_index = spr_amadix_bareTC_attack_u;
						break;
					}
				break;
				//--------------------------------------------------------------
				
				//none----------------------------------------------------------
				case player_state_action.none:
					switch(state){
						//idle-----------------------------------------------------------
						case player_state.idle:
								switch(facing){
									case index_facing.down:
										torso_index = spr_amadix_bareTC_d;
									break;
									case index_facing.left:
										torso_index = spr_amadix_bareTC_l;
									break;
									case index_facing.right:
										torso_index = spr_amadix_bareTC_r;
									break;
									case index_facing.up:
										torso_index = spr_amadix_bareTC_u;
									break;
								}
						break;
						//--------------------------------------------------------------
						//moving--------------------------------------------------------
						case player_state.moving:
								switch(facing){
									case index_facing.down:
										if (!running){
											torso_index = spr_amadix_bareTC_d;
										}else{
											torso_index = spr_amadix_bareTC_run_d;
										}
									break;
									case index_facing.left:
										if (!running){
											torso_index = spr_amadix_bareTC_l;
										}else{
											torso_index = spr_amadix_bareTC_run_l;
										}
									break;
									case index_facing.right:
										if (!running){
											torso_index = spr_amadix_bareTC_r;
										}else{
											torso_index = spr_amadix_bareTC_run_r;
										}
									break;
									case index_facing.up:
										if (!running){
											torso_index = spr_amadix_bareTC_u;
										}else{
											torso_index = spr_amadix_bareTC_run_u;
										}
									break;
								}
						break;
						//--------------------------------------------------------------
						//wading--------------------------------------------------------
						case player_state.wading:
								switch(facing){
									case index_facing.down:
										torso_index = spr_amadix_bareTC_d;
									break;
									case index_facing.left:
										torso_index = spr_amadix_bareTC_l;
									break;
									case index_facing.right:
										torso_index = spr_amadix_bareTC_r;
									break;
									case index_facing.up:
										torso_index = spr_amadix_bareTC_u;
									break;
								}
						break;
						//--------------------------------------------------------------
						//wading.idle---------------------------------------------------
						case player_state.wading_idle:
								switch(facing){
									case index_facing.down:
										torso_index = spr_amadix_bareTC_d;
									break;
									case index_facing.left:
										torso_index = spr_amadix_bareTC_l;
									break;
									case index_facing.right:
										torso_index = spr_amadix_bareTC_r;
									break;
									case index_facing.up:
										torso_index = spr_amadix_bareTC_u;
									break;
								}
						break;
						//--------------------------------------------------------------
						//swimming------------------------------------------------------
						case player_state.swimming:
								switch(facing){
									case index_facing.down:
										torso_index = spr_amadix_bareTC_d;
									break;
									case index_facing.left:
										torso_index = spr_amadix_bareTC_l;
									break;
									case index_facing.right:
										torso_index = spr_amadix_bareTC_r;
									break;
									case index_facing.up:
										torso_index = spr_amadix_bareTC_u;
									break;
								}
						break;
						//--------------------------------------------------------------
						//swimming.idle-------------------------------------------------
						case player_state.swimming_idle:
								switch(facing){
									case index_facing.down:
										torso_index = spr_amadix_bareTC_d;
									break;
									case index_facing.left:
										torso_index = spr_amadix_bareTC_l;
									break;
									case index_facing.right:
										torso_index = spr_amadix_bareTC_r;
									break;
									case index_facing.up:
										torso_index = spr_amadix_bareTC_u;
									break;
								}
						break;
						//--------------------------------------------------------------
					}
				break;
				//--------------------------------------------------------------
				
			}

	break;
	
	case item.classic_jacket:
	
			switch(actionstate){
				//eating--------------------------------------------------------
				case player_state_action.eating:
					torso_index = spr_amadix_newTC_eating;
				break;
				//--------------------------------------------------------------
				
				//drinking------------------------------------------------------
				case player_state_action.drinking:
					torso_index = spr_amadix_newTC_drinking;
				break;
				//--------------------------------------------------------------
				
				//attacking-----------------------------------------------------
				case player_state_action.attacking_melee:
					switch(facing){
						case index_facing.down:
							torso_index = spr_amadix_newTC_attack_d;
						break;
						case index_facing.left:
							torso_index = spr_amadix_newTC_attack_l;
						break;
						case index_facing.right:
							torso_index = spr_amadix_newTC_attack_r;
						break;
						case index_facing.up:
							torso_index = spr_amadix_newTC_attack_u;
						break;
					}
				break;
				//--------------------------------------------------------------
				
				//none----------------------------------------------------------
				case player_state_action.none:
					switch(state){
						//idle-----------------------------------------------------------
						case player_state.idle:
								switch(facing){
									case index_facing.down:
										torso_index = spr_amadix_newTC_d;
									break;
									case index_facing.left:
										torso_index = spr_amadix_newTC_l;
									break;
									case index_facing.right:
										torso_index = spr_amadix_newTC_r;
									break;
									case index_facing.up:
										torso_index = spr_amadix_newTC_u;
									break;
								}
						break;
						//--------------------------------------------------------------
						//moving--------------------------------------------------------
						case player_state.moving:
								switch(facing){
									case index_facing.down:
										if (!running){
											torso_index = spr_amadix_newTC_d;
										}else{
											torso_index = spr_amadix_newTC_run_d;
										}
									break;
									case index_facing.left:
										if (!running){
											torso_index = spr_amadix_newTC_l;
										}else{
											torso_index = spr_amadix_newTC_run_l;
										}
									break;
									case index_facing.right:
										if (!running){
											torso_index = spr_amadix_newTC_r;
										}else{
											torso_index = spr_amadix_newTC_run_r;
										}
									break;
									case index_facing.up:
										if (!running){
											torso_index = spr_amadix_newTC_u;
										}else{
											torso_index = spr_amadix_newTC_run_u;
										}
									break;
								}
						break;
						//--------------------------------------------------------------
						//wading--------------------------------------------------------
						case player_state.wading:
								switch(facing){
									case index_facing.down:
										torso_index = spr_amadix_newTC_d;
									break;
									case index_facing.left:
										torso_index = spr_amadix_newTC_l;
									break;
									case index_facing.right:
										torso_index = spr_amadix_newTC_r;
									break;
									case index_facing.up:
										torso_index = spr_amadix_newTC_u;
									break;
								}
						break;
						//--------------------------------------------------------------
						//wading.idle---------------------------------------------------
						case player_state.wading_idle:
								switch(facing){
									case index_facing.down:
										torso_index = spr_amadix_newTC_d;
									break;
									case index_facing.left:
										torso_index = spr_amadix_newTC_l;
									break;
									case index_facing.right:
										torso_index = spr_amadix_newTC_r;
									break;
									case index_facing.up:
										torso_index = spr_amadix_newTC_u;
									break;
								}
						break;
						//--------------------------------------------------------------
						//swimming------------------------------------------------------
						case player_state.swimming:
								switch(facing){
									case index_facing.down:
										torso_index = spr_amadix_newTC_d;
									break;
									case index_facing.left:
										torso_index = spr_amadix_newTC_l;
									break;
									case index_facing.right:
										torso_index = spr_amadix_newTC_r;
									break;
									case index_facing.up:
										torso_index = spr_amadix_newTC_u;
									break;
								}
						break;
						//--------------------------------------------------------------
						//swimming.idle-------------------------------------------------
						case player_state.swimming_idle:
								switch(facing){
									case index_facing.down:
										torso_index = spr_amadix_newTC_d;
									break;
									case index_facing.left:
										torso_index = spr_amadix_newTC_l;
									break;
									case index_facing.right:
										torso_index = spr_amadix_newTC_r;
									break;
									case index_facing.up:
										torso_index = spr_amadix_newTC_u;
									break;
								}
						break;
						//--------------------------------------------------------------
					}
				break;
				//--------------------------------------------------------------
				
			}
	
	break;
}
switch(global.playerLegs){
	case item.none:
			switch(actionstate){
				//eating--------------------------------------------------------
				case player_state_action.eating:
					legs_index = spr_amadix_pantsL_d;
				break;
				//--------------------------------------------------------------
				
				//drinking------------------------------------------------------
				case player_state_action.drinking:
					legs_index = spr_amadix_pantsL_d;
				break;
				//--------------------------------------------------------------
				
				//attacking-----------------------------------------------------
				case player_state_action.attacking_melee:
					switch(facing){
						case index_facing.down:
							legs_index = spr_amadix_pantsL_attack_d;
						break;
						case index_facing.left:
							legs_index = spr_amadix_pantsL_attack_l;
						break;
						case index_facing.right:
							legs_index = spr_amadix_pantsL_attack_r;
						break;
						case index_facing.up:
							legs_index = spr_amadix_pantsL_attack_u;
						break;
					}
				break;
				//--------------------------------------------------------------
				
				//none----------------------------------------------------------
				case player_state_action.none:
					switch(state){
						//idle-----------------------------------------------------------
						case player_state.idle:
								switch(facing){
									case index_facing.down:
										legs_index = spr_amadix_pantsL_d;
									break;
									case index_facing.left:
										legs_index = spr_amadix_pantsL_l;
									break;
									case index_facing.right:
										legs_index = spr_amadix_pantsL_r;
									break;
									case index_facing.up:
										legs_index = spr_amadix_pantsL_u;
									break;
								}
						break;
						//--------------------------------------------------------------
						//moving--------------------------------------------------------
						case player_state.moving:
								switch(facing){
									case index_facing.down:
										if (!running){
											legs_index = spr_amadix_pantsL_d;
										}else{
											legs_index = spr_amadix_pantsL_run_d;
										}
									break;
									case index_facing.left:
										if (!running){
											legs_index = spr_amadix_pantsL_l;
										}else{
											legs_index = spr_amadix_pantsL_run_l;
										}
									break;
									case index_facing.right:
										if (!running){
											legs_index = spr_amadix_pantsL_r;
										}else{
											legs_index = spr_amadix_pantsL_run_r;
										}
									break;
									case index_facing.up:
										if (!running){
											legs_index = spr_amadix_pantsL_u;
										}else{
											legs_index = spr_amadix_pantsL_run_u;
										}
									break;
								}
						break;
						//--------------------------------------------------------------
						//wading--------------------------------------------------------
						case player_state.wading:
								switch(facing){
									case index_facing.down:
										legs_index = spr_amadix_pantsL_d;
									break;
									case index_facing.left:
										legs_index = spr_amadix_pantsL_l;
									break;
									case index_facing.right:
										legs_index = spr_amadix_pantsL_r;
									break;
									case index_facing.up:
										legs_index = spr_amadix_pantsL_u;
									break;
								}
						break;
						//--------------------------------------------------------------
						//wading.idle---------------------------------------------------
						case player_state.wading_idle:
								switch(facing){
									case index_facing.down:
										legs_index = spr_amadix_pantsL_d;
									break;
									case index_facing.left:
										legs_index = spr_amadix_pantsL_l;
									break;
									case index_facing.right:
										legs_index = spr_amadix_pantsL_r;
									break;
									case index_facing.up:
										legs_index = spr_amadix_pantsL_u;
									break;
								}
						break;
						//--------------------------------------------------------------
						//swimming------------------------------------------------------
						case player_state.swimming:
								switch(facing){
									case index_facing.down:
										legs_index = spr_amadix_pantsL_d;
									break;
									case index_facing.left:
										legs_index = spr_amadix_pantsL_l;
									break;
									case index_facing.right:
										legs_index = spr_amadix_pantsL_r;
									break;
									case index_facing.up:
										legs_index = spr_amadix_pantsL_u;
									break;
								}
						break;
						//--------------------------------------------------------------
						//swimming.idle-------------------------------------------------
						case player_state.swimming_idle:
								switch(facing){
									case index_facing.down:
										legs_index = spr_amadix_pantsL_d;
									break;
									case index_facing.left:
										legs_index = spr_amadix_pantsL_l;
									break;
									case index_facing.right:
										legs_index = spr_amadix_pantsL_r;
									break;
									case index_facing.up:
										legs_index = spr_amadix_pantsL_u;
									break;
								}
						break;
						//--------------------------------------------------------------
					}
				break;
				//--------------------------------------------------------------
				
			}
	break;
	case item.jeans:
			switch(actionstate){
				//eating--------------------------------------------------------
				case player_state_action.eating:
					legs_index = spr_amadix_jeansL_d;
				break;
				//--------------------------------------------------------------
				
				//drinking------------------------------------------------------
				case player_state_action.drinking:
					legs_index = spr_amadix_jeansL_d;
				break;
				//--------------------------------------------------------------
				
				//attacking-----------------------------------------------------
				case player_state_action.attacking_melee:
					switch(facing){
						case index_facing.down:
							legs_index = spr_amadix_jeansL_attack_d;
						break;
						case index_facing.left:
							legs_index = spr_amadix_jeansL_attack_l;
						break;
						case index_facing.right:
							legs_index = spr_amadix_jeansL_attack_r;
						break;
						case index_facing.up:
							legs_index = spr_amadix_jeansL_attack_u;
						break;
					}
				break;
				//--------------------------------------------------------------
				
				//none----------------------------------------------------------
				case player_state_action.none:
					switch(state){
						//idle-----------------------------------------------------------
						case player_state.idle:
								switch(facing){
									case index_facing.down:
										legs_index = spr_amadix_jeansL_d;
									break;
									case index_facing.left:
										legs_index = spr_amadix_jeansL_l;
									break;
									case index_facing.right:
										legs_index = spr_amadix_jeansL_r;
									break;
									case index_facing.up:
										legs_index = spr_amadix_jeansL_u;
									break;
								}
						break;
						//--------------------------------------------------------------
						//moving--------------------------------------------------------
						case player_state.moving:
								switch(facing){
									case index_facing.down:
										if (!running){
											legs_index = spr_amadix_jeansL_d;
										}else{
											legs_index = spr_amadix_jeansL_run_d;
										}
									break;
									case index_facing.left:
										if (!running){
											legs_index = spr_amadix_jeansL_l;
										}else{
											legs_index = spr_amadix_jeansL_run_l;
										}
									break;
									case index_facing.right:
										if (!running){
											legs_index = spr_amadix_jeansL_r;
										}else{
											legs_index = spr_amadix_jeansL_run_r;
										}
									break;
									case index_facing.up:
										if (!running){
											legs_index = spr_amadix_jeansL_u;
										}else{
											legs_index = spr_amadix_jeansL_run_u;
										}
									break;
								}
						break;
						//--------------------------------------------------------------
						//wading--------------------------------------------------------
						case player_state.wading:
								switch(facing){
									case index_facing.down:
										legs_index = spr_amadix_jeansL_d;
									break;
									case index_facing.left:
										legs_index = spr_amadix_jeansL_l;
									break;
									case index_facing.right:
										legs_index = spr_amadix_jeansL_r;
									break;
									case index_facing.up:
										legs_index = spr_amadix_jeansL_u;
									break;
								}
						break;
						//--------------------------------------------------------------
						//wading.idle---------------------------------------------------
						case player_state.wading_idle:
								switch(facing){
									case index_facing.down:
										legs_index = spr_amadix_jeansL_d;
									break;
									case index_facing.left:
										legs_index = spr_amadix_jeansL_l;
									break;
									case index_facing.right:
										legs_index = spr_amadix_jeansL_r;
									break;
									case index_facing.up:
										legs_index = spr_amadix_jeansL_u;
									break;
								}
						break;
						//--------------------------------------------------------------
						//swimming------------------------------------------------------
						case player_state.swimming:
								switch(facing){
									case index_facing.down:
										legs_index = spr_amadix_jeansL_d;
									break;
									case index_facing.left:
										legs_index = spr_amadix_jeansL_l;
									break;
									case index_facing.right:
										legs_index = spr_amadix_jeansL_r;
									break;
									case index_facing.up:
										legs_index = spr_amadix_jeansL_u;
									break;
								}
						break;
						//--------------------------------------------------------------
						//swimming.idle-------------------------------------------------
						case player_state.swimming_idle:
								switch(facing){
									case index_facing.down:
										legs_index = spr_amadix_jeansL_d;
									break;
									case index_facing.left:
										legs_index = spr_amadix_jeansL_l;
									break;
									case index_facing.right:
										legs_index = spr_amadix_jeansL_r;
									break;
									case index_facing.up:
										legs_index = spr_amadix_jeansL_u;
									break;
								}
						break;
						//--------------------------------------------------------------
					}
				break;
				//--------------------------------------------------------------
				
			}
	break;
}
switch(global.playerBoots){
	case item.none:
			switch(actionstate){
				//eating--------------------------------------------------------
				case player_state_action.eating:
					boots_index = spr_amadix_feetB_d;
				break;
				//--------------------------------------------------------------
				
				//drinking------------------------------------------------------
				case player_state_action.drinking:
					boots_index = spr_amadix_feetB_d;
				break;
				//--------------------------------------------------------------
				
				//attacking-----------------------------------------------------
				case player_state_action.attacking_melee:
					switch(facing){
						case index_facing.down:
							boots_index = spr_amadix_feetB_attack_d;
						break;
						case index_facing.left:
							boots_index = spr_amadix_feetB_attack_l;
						break;
						case index_facing.right:
							boots_index = spr_amadix_feetB_attack_r;
						break;
						case index_facing.up:
							boots_index = spr_amadix_feetB_attack_u;
						break;
					}
				break;
				//--------------------------------------------------------------
				
				//none----------------------------------------------------------
				case player_state_action.none:
					switch(state){
						//idle-----------------------------------------------------------
						case player_state.idle:
								switch(facing){
									case index_facing.down:
										boots_index = spr_amadix_feetB_d;
									break;
									case index_facing.left:
										boots_index = spr_amadix_feetB_l;
									break;
									case index_facing.right:
										boots_index = spr_amadix_feetB_r;
									break;
									case index_facing.up:
										boots_index = spr_amadix_feetB_u;
									break;
								}
						break;
						//--------------------------------------------------------------
						//moving--------------------------------------------------------
						case player_state.moving:
								switch(facing){
									case index_facing.down:
										if (!running){
											boots_index = spr_amadix_feetB_d;
										}else{
											boots_index = spr_amadix_feetB_run_d;
										}
									break;
									case index_facing.left:
										if (!running){
											boots_index = spr_amadix_feetB_l;
										}else{
											boots_index = spr_amadix_feetB_run_l;
										}
									break;
									case index_facing.right:
										if (!running){
											boots_index = spr_amadix_feetB_r;
										}else{
											boots_index = spr_amadix_feetB_run_r;
										}
									break;
									case index_facing.up:
										if (!running){
											boots_index = spr_amadix_feetB_u;
										}else{
											boots_index = spr_amadix_feetB_run_u;
										}
									break;
								}
						break;
						//--------------------------------------------------------------
						//wading--------------------------------------------------------
						case player_state.wading:
								switch(facing){
									case index_facing.down:
										boots_index = spr_amadix_feetB_d;
									break;
									case index_facing.left:
										boots_index = spr_amadix_feetB_l;
									break;
									case index_facing.right:
										boots_index = spr_amadix_feetB_r;
									break;
									case index_facing.up:
										boots_index = spr_amadix_feetB_u;
									break;
								}
						break;
						//--------------------------------------------------------------
						//wading.idle---------------------------------------------------
						case player_state.wading_idle:
								switch(facing){
									case index_facing.down:
										boots_index = spr_amadix_feetB_d;
									break;
									case index_facing.left:
										boots_index = spr_amadix_feetB_l;
									break;
									case index_facing.right:
										boots_index = spr_amadix_feetB_r;
									break;
									case index_facing.up:
										boots_index = spr_amadix_feetB_u;
									break;
								}
						break;
						//--------------------------------------------------------------
						//swimming------------------------------------------------------
						case player_state.swimming:
								switch(facing){
									case index_facing.down:
										boots_index = spr_amadix_feetB_d;
									break;
									case index_facing.left:
										boots_index = spr_amadix_feetB_l;
									break;
									case index_facing.right:
										boots_index = spr_amadix_feetB_r;
									break;
									case index_facing.up:
										boots_index = spr_amadix_feetB_u;
									break;
								}
						break;
						//--------------------------------------------------------------
						//swimming.idle-------------------------------------------------
						case player_state.swimming_idle:
								switch(facing){
									case index_facing.down:
										boots_index = spr_amadix_feetB_d;
									break;
									case index_facing.left:
										boots_index = spr_amadix_feetB_l;
									break;
									case index_facing.right:
										boots_index = spr_amadix_feetB_r;
									break;
									case index_facing.up:
										boots_index = spr_amadix_feetB_u;
									break;
								}
						break;
						//--------------------------------------------------------------
					}
				break;
				//--------------------------------------------------------------
				
			}
	break;
	case item.sneakers:
			switch(actionstate){
				//eating--------------------------------------------------------
				case player_state_action.eating:
					boots_index = spr_amadix_newB_d;
				break;
				//--------------------------------------------------------------
				
				//drinking------------------------------------------------------
				case player_state_action.drinking:
					boots_index = spr_amadix_newB_d;
				break;
				//--------------------------------------------------------------
				
				//attacking-----------------------------------------------------
				case player_state_action.attacking_melee:
					switch(facing){
						case index_facing.down:
							boots_index = spr_amadix_newB_attack_d;
						break;
						case index_facing.left:
							boots_index = spr_amadix_newB_attack_l;
						break;
						case index_facing.right:
							boots_index = spr_amadix_newB_attack_r;
						break;
						case index_facing.up:
							boots_index = spr_amadix_newB_attack_u;
						break;
					}
				break;
				//--------------------------------------------------------------
				
				//none----------------------------------------------------------
				case player_state_action.none:
					switch(state){
						//idle-----------------------------------------------------------
						case player_state.idle:
								switch(facing){
									case index_facing.down:
										boots_index = spr_amadix_newB_d;
									break;
									case index_facing.left:
										boots_index = spr_amadix_newB_l;
									break;
									case index_facing.right:
										boots_index = spr_amadix_newB_r;
									break;
									case index_facing.up:
										boots_index = spr_amadix_newB_u;
									break;
								}
						break;
						//--------------------------------------------------------------
						//moving--------------------------------------------------------
						case player_state.moving:
								switch(facing){
									case index_facing.down:
										if (!running){
											boots_index = spr_amadix_newB_d;
										}else{
											boots_index = spr_amadix_newB_run_d;
										}
									break;
									case index_facing.left:
										if (!running){
											boots_index = spr_amadix_newB_l;
										}else{
											boots_index = spr_amadix_newB_run_l;
										}
									break;
									case index_facing.right:
										if (!running){
											boots_index = spr_amadix_newB_r;
										}else{
											boots_index = spr_amadix_newB_run_r;
										}
									break;
									case index_facing.up:
										if (!running){
											boots_index = spr_amadix_newB_u;
										}else{
											boots_index = spr_amadix_newB_run_u;
										}
									break;
								}
						break;
						//--------------------------------------------------------------
						//wading--------------------------------------------------------
						case player_state.wading:
								switch(facing){
									case index_facing.down:
										boots_index = spr_amadix_newB_d;
									break;
									case index_facing.left:
										boots_index = spr_amadix_newB_l;
									break;
									case index_facing.right:
										boots_index = spr_amadix_newB_r;
									break;
									case index_facing.up:
										boots_index = spr_amadix_newB_u;
									break;
								}
						break;
						//--------------------------------------------------------------
						//wading.idle---------------------------------------------------
						case player_state.wading_idle:
								switch(facing){
									case index_facing.down:
										boots_index = spr_amadix_newB_d;
									break;
									case index_facing.left:
										boots_index = spr_amadix_newB_l;
									break;
									case index_facing.right:
										boots_index = spr_amadix_newB_r;
									break;
									case index_facing.up:
										boots_index = spr_amadix_newB_u;
									break;
								}
						break;
						//--------------------------------------------------------------
						//swimming------------------------------------------------------
						case player_state.swimming:
								switch(facing){
									case index_facing.down:
										boots_index = spr_amadix_newB_d;
									break;
									case index_facing.left:
										boots_index = spr_amadix_newB_l;
									break;
									case index_facing.right:
										boots_index = spr_amadix_newB_r;
									break;
									case index_facing.up:
										boots_index = spr_amadix_newB_u;
									break;
								}
						break;
						//--------------------------------------------------------------
						//swimming.idle-------------------------------------------------
						case player_state.swimming_idle:
								switch(facing){
									case index_facing.down:
										boots_index = spr_amadix_newB_d;
									break;
									case index_facing.left:
										boots_index = spr_amadix_newB_l;
									break;
									case index_facing.right:
										boots_index = spr_amadix_newB_r;
									break;
									case index_facing.up:
										boots_index = spr_amadix_newB_u;
									break;
								}
						break;
						//--------------------------------------------------------------
					}
				break;
				//--------------------------------------------------------------
				
			}
	break;
}

/*

	if (global.playerBoots == "classic_boots"){
		if (!running){
			switch(actionstate){
				case player_state_action.eating:
					boots_index = spr_amadix_newB_d;
				break;
				case player_state_action.drinking:
					boots_index = spr_amadix_newB_d;
				break;
				case player_state_action.attacking_melee:
					if facing == index_facing.right
						boots_index = spr_amadix_newB_attack_r;
					if facing == index_facing.up
						boots_index = spr_amadix_newB_attack_u;
					if facing == index_facing.left
						boots_index = spr_amadix_newB_attack_l;
					if facing == index_facing.down
						boots_index = spr_amadix_newB_attack_d;
				break;
				case player_state_action.none:
					if facing == index_facing.right
						boots_index = spr_amadix_newB_r;
					if facing == index_facing.up
						boots_index = spr_amadix_newB_u;
					if facing == index_facing.left
						boots_index = spr_amadix_newB_l;
					if facing == index_facing.down
						boots_index = spr_amadix_newB_d;
				break;
			}
		}else{
				if facing == index_facing.right
					boots_index = spr_amadix_newB_run_r;
				if facing == index_facing.up
					boots_index = spr_amadix_newB_run_u;
				if facing == index_facing.left
					boots_index = spr_amadix_newB_run_l;
				if facing == index_facing.down
					boots_index = spr_amadix_newB_run_d;
		}
	}
	if (global.playerLegs == "classic_jeans"){
		if (!running){
			switch(actionstate){
				case player_state_action.eating:
					legs_index = spr_amadix_jeansL_d;
				break;
				case player_state_action.drinking:
					legs_index = spr_amadix_jeansL_d;
				break;
				case player_state_action.attacking_melee:
					if facing == index_facing.right
						legs_index = spr_amadix_jeansL_attack_r;
					if facing == index_facing.up
						legs_index = spr_amadix_jeansL_attack_u;
					if facing == index_facing.left
						legs_index = spr_amadix_jeansL_attack_l;
					if facing == index_facing.down
						legs_index = spr_amadix_jeansL_attack_d;
				break;
				case player_state_action.none:
					if facing == index_facing.right
						legs_index = spr_amadix_jeansL_r;
					if facing == index_facing.up
						legs_index = spr_amadix_jeansL_u;
					if facing == index_facing.left
						legs_index = spr_amadix_jeansL_l;
					if facing == index_facing.down
						legs_index = spr_amadix_jeansL_d;
				break;
			}
		}else{
				if facing == index_facing.right
					legs_index = spr_amadix_jeansL_run_r;
				if facing == index_facing.up
					legs_index = spr_amadix_jeansL_run_u;
				if facing == index_facing.left
					legs_index = spr_amadix_jeansL_run_l;
				if facing == index_facing.down
					legs_index = spr_amadix_jeansL_run_d;
		}
	}
	if (global.playerTorso == "classic_hoodie"){
		if (!running){
			switch(actionstate){
				case player_state_action.eating:
					torso_index = spr_amadix_newTC_eating;
				break;
				case player_state_action.drinking:
					torso_index = spr_amadix_newTC_drinking;
				break;
				case player_state_action.attacking_melee:
					if facing == index_facing.right
						torso_index = spr_amadix_newTC_attack_r;
					if facing == index_facing.up
						torso_index = spr_amadix_newTC_attack_u;
					if facing == index_facing.left
						torso_index = spr_amadix_newTC_attack_l;
					if facing == index_facing.down
						torso_index = spr_amadix_newTC_attack_d;	
				break;
				case player_state_action.none:
					if facing == index_facing.right
						torso_index = spr_amadix_newTC_r;
					if facing == index_facing.up
						torso_index = spr_amadix_newTC_u;
					if facing == index_facing.left
						torso_index = spr_amadix_newTC_l;
					if facing == index_facing.down
						torso_index = spr_amadix_newTC_d;	
				break;
			}
		}else{
				if facing == index_facing.right
					torso_index = spr_amadix_newTC_run_r;
				if facing == index_facing.up
					torso_index = spr_amadix_newTC_run_u;
				if facing == index_facing.left
					torso_index = spr_amadix_newTC_run_l;
				if facing == index_facing.down
					torso_index = spr_amadix_newTC_run_d;	
		}
	}
*/


}
