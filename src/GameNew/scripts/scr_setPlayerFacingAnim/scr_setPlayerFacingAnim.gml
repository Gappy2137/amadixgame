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

#region Classic Clothing Set

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

#endregion

#region Gray Tshirt

	if (global.playerTorso == "gray_tshirt"){
		switch(actionstate){
			case player_state_action.eating:
				torso_index = spr_amadix_shirtTC_eating;
			break;
			case player_state_action.drinking:
				torso_index = spr_amadix_shirtTC_eating;
			break;
			case player_state_action.attacking_melee:

			break;
			case player_state_action.none:

			break;
		}
	}

#endregion


}
