///@description scr_setPlayerFacingAnim(facing)
function scr_setPlayerFacingAnim(facing){
	

#region Glowa
	if (skid){
		head_index = spr_amadix_head_skid;	
	}else{
		if (running != 2){
			switch(actionstate){
					case player_state_action.eating:
						head_index = spr_amadix_head_eating;
					break;
					case player_state_action.drinking:
						head_index = spr_amadix_head_drinking;
					break;
					case player_state_action.attacking_melee:
						switch(facing){
							case index_facing.right:
								head_index = spr_amadix_head_attack_r;
							break;
							case index_facing.up:
								head_index = spr_amadix_head_attack_u;
							break;
							case index_facing.left:
								head_index = spr_amadix_head_attack_l;
							break;
							case index_facing.down:
								head_index = spr_amadix_head_attack_d;
							break;
						}
					break;
					case player_state_action.handgun:
						switch(facing){
							case index_facing.right:
								head_index = spr_amadix_head_r;
							break;
							case index_facing.up:
								head_index = spr_amadix_head_u;
							break;
							case index_facing.left:
								head_index = spr_amadix_head_l;
							break;
							case index_facing.down:
								head_index = spr_amadix_head_d;
							break;
						}
					break;
					case player_state_action.pickup:
						switch(facing){
							case index_facing.right:
								head_index = spr_amadix_head_pick_r;
							break;
							case index_facing.up:
								head_index = spr_amadix_head_pick_u;
							break;
							case index_facing.left:
								head_index = spr_amadix_head_pick_l;
							break;
							case index_facing.down:
								head_index = spr_amadix_head_pick_d;
							break;
						}
					break;
					case player_state_action.none:
						switch(facing){
							case index_facing.right:
								head_index = spr_amadix_head_r;
							break;
							case index_facing.up:
								head_index = spr_amadix_head_u;
							break;
							case index_facing.left:
								head_index = spr_amadix_head_l;
							break;
							case index_facing.down:
								head_index = spr_amadix_head_d;
							break;
						}
					break;
				}
			}else{
				switch(facing){
					case index_facing.right:
						head_index = spr_amadix_head_run_r;
					break;
					case index_facing.up:
						head_index = spr_amadix_head_run_u;
					break;
					case index_facing.left:
						head_index = spr_amadix_head_run_l;
					break;
					case index_facing.down:
						head_index = spr_amadix_head_run_d;
					break;
				}
			}
}
#endregion

#region Dlonie
	if (global.playerHands == "short"){
		if (skid){
			hands_index = spr_amadix_hands_skid;	
		}else{
			if (running != 2){
				switch(actionstate){
					case player_state_action.eating:
						hands_index = spr_amadix_hands_eating;
						hands2_index = spr_none;
					break;
					case player_state_action.drinking:
						hands_index = spr_amadix_hands_drinking;
						hands2_index = spr_none;
					break;
					case player_state_action.attacking_melee:
						switch(facing){
							case index_facing.right:
								hands_index = spr_amadix_hands_attack_r;
								hands2_index = spr_none;
							break;
							case index_facing.up:
								hands_index = spr_amadix_hands_attack_u;
								hands2_index = spr_none;
							break;
							case index_facing.left:
								hands_index = spr_amadix_hands_attack_l;
								hands2_index = spr_none;
							break;
							case index_facing.down:
								hands_index = spr_amadix_hands_attack_d;
								hands2_index = spr_none;
							break;
						}
					break;
					case player_state_action.handgun:
				
						switch(itemeaten){
							case item.m1911:
								if (isLooking(index_facing.up)){
										hand_rot = point_direction(x, y + hand_yoffset, mouse_x, mouse_y) - 90;
										hand_xoffset = 0;
										hand_yoffset = 18;
									
										switch(obj_gun_logic.state){
											case gunState.standby:
												hands_index = spr_amadix_hands_gun_u;
												hands2_index = spr_none;
											break;
											case gunState.shooting:
												hands_index = spr_amadix_hands_gun_u_shoot;
												hands2_index = spr_none;
											break;
											case gunState.reloading:
												hands_index = spr_amadix_hands_gun_u_reload;
												hands2_index = spr_none;
											case gunState.reloading_empty:
												hands_index = spr_amadix_hands_gun_u_reload;
												hands2_index = spr_none;
											break;
											case gunState.empty:
												hands_index = spr_amadix_hands_gun_u;
												hands2_index = spr_none;
											break;
										}
								}else
								if (isLooking(index_facing.left)){
										hand_rot = point_direction(x, y + hand_yoffset, mouse_x, mouse_y) - 180;
										hand_xoffset = 3;
										hand_yoffset = 17;
									
										switch(obj_gun_logic.state){
											case gunState.standby:
												hands_index = spr_amadix_hands_gun_l;
												hands2_index = spr_none;
											break;
											case gunState.shooting:
												hands_index = spr_amadix_hands_gun_l_shoot;
												hands2_index = spr_none;
											break;
											case gunState.reloading:
												hands_index = spr_amadix_hands_gun_l_reload;
												hands2_index = spr_none;
											case gunState.reloading_empty:
												hands_index = spr_amadix_hands_gun_l_reload;
												hands2_index = spr_none;
											break;
											case gunState.empty:
												hands_index = spr_amadix_hands_gun_l;
												hands2_index = spr_none;
											break;
										}
								}else
								if (isLooking(index_facing.down)){
										hand_rot = point_direction(x, y + hand_yoffset, mouse_x, mouse_y) + 90;
										hand_xoffset = -3;
										hand_yoffset = 14;
										hand_xoffset2 = 3;
										hand_yoffset2 = 14;
									
										switch(obj_gun_logic.state){
											case gunState.standby:
												hands_index = spr_amadix_hands_gun_d;
												hands2_index = spr_amadix_hands_gun_d2;
											break;
											case gunState.shooting:
												hands_index = spr_amadix_hands_gun_d_shoot;
												hands2_index = spr_amadix_hands_gun_d2_shoot;
											break;
											case gunState.reloading:
												hands_index = spr_amadix_hands_gun_d_reload;
												hands2_index = spr_none;
											case gunState.reloading_empty:
												hands_index = spr_amadix_hands_gun_d_reload;
												hands2_index = spr_none;
											break;
											case gunState.empty:
												hands_index = spr_amadix_hands_gun_d;
												hands2_index = spr_amadix_hands_gun_d2;
											break;
										}
								}else{
										hand_rot = point_direction(x, y + hand_yoffset, mouse_x, mouse_y);
										hand_xoffset = -3;
										hand_yoffset = 17;
									
										switch(obj_gun_logic.state){
											case gunState.standby:
												hands_index = spr_amadix_hands_gun_r;
												hands2_index = spr_none;
											break;
											case gunState.shooting:
												hands_index = spr_amadix_hands_gun_r_shoot;
												hands2_index = spr_none;
											break;
											case gunState.reloading:
												hands_index = spr_amadix_hands_gun_r_reload;
												hands2_index = spr_none;
											case gunState.reloading_empty:
												hands_index = spr_amadix_hands_gun_r_reload;
												hands2_index = spr_none;
											break;
											case gunState.empty:
												hands_index = spr_amadix_hands_gun_r;
												hands2_index = spr_none;
											break;
										}
								}
							break;
							case item.sawedoff:
								if (isLooking(index_facing.up)){
										hand_rot = point_direction(x, y + hand_yoffset, mouse_x, mouse_y) - 90;
										hand_xoffset = 0;
										hand_yoffset = 18;
									
										switch(obj_gun_logic.state){
											case gunState.standby:
												hands_index = spr_amadix_hands_sawedoff_u;
												hands2_index = spr_none;
											break;
											case gunState.shooting:
												hands_index = spr_amadix_hands_sawedoff_u_shoot;
												hands2_index = spr_none;
											break;
											case gunState.reloading:
												hands_index = spr_amadix_hands_sawedoff_u_reload;
												hands2_index = spr_none;
											case gunState.reloading_empty:
												hands_index = spr_amadix_hands_sawedoff_u_reload;
												hands2_index = spr_none;
											break;
											case gunState.empty:
												hands_index = spr_amadix_hands_sawedoff_u;
												hands2_index = spr_none;
											break;
										}
								}else
								if (isLooking(index_facing.left)){
										hand_rot = point_direction(x, y + hand_yoffset, mouse_x, mouse_y) - 180;
										hand_xoffset = 3;
										hand_yoffset = 16;
									
										switch(obj_gun_logic.state){
											case gunState.standby:
												hands_index = spr_amadix_hands_sawedoff_l;
												hands2_index = spr_none;
											break;
											case gunState.shooting:
												hands_index = spr_amadix_hands_sawedoff_l_shoot;
												hands2_index = spr_none;
											break;
											case gunState.reloading:
												hands_index = spr_amadix_hands_sawedoff_l_reload;
												hands2_index = spr_none;
											case gunState.reloading_empty:
												hands_index = spr_amadix_hands_sawedoff_l_reload;
												hands2_index = spr_none;
											break;
											case gunState.empty:
												hands_index = spr_amadix_hands_sawedoff_l;
												hands2_index = spr_none;
											break;
										}
								}else
								if (isLooking(index_facing.down)){
										hand_rot = point_direction(x, y + hand_yoffset, mouse_x, mouse_y) + 90;
										hand_xoffset = -3;
										hand_yoffset = 14;
										hand_xoffset2 = 3;
										hand_yoffset2 = 14;
									
										switch(obj_gun_logic.state){
											case gunState.standby:
												hands_index = spr_amadix_hands_sawedoff_d;
												hands2_index = spr_amadix_hands_sawedoff_d2;
											break;
											case gunState.shooting:
												hands_index = spr_amadix_hands_sawedoff_d_shoot;
												hands2_index = spr_amadix_hands_sawedoff_d2_shoot;
											break;
											case gunState.reloading:
												hands_index = spr_amadix_hands_sawedoff_d_reload;
												hands2_index = spr_none;
											case gunState.reloading_empty:
												hands_index = spr_amadix_hands_sawedoff_d_reload;
												hands2_index = spr_none;
											break;
											case gunState.empty:
												hands_index = spr_amadix_hands_sawedoff_d;
												hands2_index = spr_amadix_hands_sawedoff_d2;
											break;
										}
								}else{
										hand_rot = point_direction(x, y + hand_yoffset, mouse_x, mouse_y);
										hand_xoffset = -5;
										hand_yoffset = 19;
									
										switch(obj_gun_logic.state){
											case gunState.standby:
												hands_index = spr_amadix_hands_sawedoff_r;
												hands2_index = spr_none;
											break;
											case gunState.shooting:
												hands_index = spr_amadix_hands_sawedoff_r_shoot;
												hands2_index = spr_none;
											break;
											case gunState.reloading:
												hands_index = spr_amadix_hands_sawedoff_r_reload;
												hands2_index = spr_none;
											case gunState.reloading_empty:
												hands_index = spr_amadix_hands_sawedoff_r_reload;
												hands2_index = spr_none;
											break;
											case gunState.empty:
												hands_index = spr_amadix_hands_sawedoff_r;
												hands2_index = spr_none;
											break;
										}
								}
							break;
						}
					break;
					case player_state_action.pickup:
						switch(facing){
							case index_facing.right:
								hands_index = spr_amadix_hands_pick_r;
								hands2_index = spr_none;
							break;
							case index_facing.up:
								hands_index = spr_none;
								hands2_index = spr_none;
							break;
							case index_facing.left:
								hands_index = spr_amadix_hands_pick_l;
								hands2_index = spr_none;
							break;
							case index_facing.down:
								hands_index = spr_amadix_hands_pick_d;
								hands2_index = spr_none;
							break;
						}
					break;
					case player_state_action.none:
						switch(facing){
							case index_facing.down:
								hands_index = spr_amadix_hands_d;
								hands2_index = spr_none;
							break;
							case index_facing.left:
								hands_index = spr_amadix_hands_l;
								hands2_index = spr_none;
							break;
							case index_facing.right:
								hands_index = spr_amadix_hands_r;
								hands2_index = spr_none;
							break;
							case index_facing.up:
								hands_index = spr_amadix_hands_u;
								hands2_index = spr_none;
							break;
						}
					break;
				}
			}else{
				switch(facing){
					case index_facing.down:
						hands_index = spr_amadix_hands_run_d;
					break;
					case index_facing.left:
						hands_index = spr_amadix_hands_run_l;
					break;
					case index_facing.right:
						hands_index = spr_amadix_hands_run_r;
					break;
					case index_facing.up:
						hands_index = spr_amadix_hands_run_u;
						
				}
			}
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
		case item.cat_ears:
			hat_index = spr_catears_hat;
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

#region Bron

switch(itemeaten){
	case item.none:
		gun_index = spr_item_none;
	break;
	#region 1911
	case item.m1911:
		switch(obj_gun_logic.state){
			case gunState.standby:
					if isLooking(index_facing.up){
						gun_index = spr_amadix_m1911_u;
					}else if isLooking(index_facing.down){
						gun_index = spr_amadix_m1911_d;
					}else if isLooking(index_facing.left){
						gun_index = spr_amadix_m1911_l;
					}else{
						gun_index = spr_amadix_m1911_r;
					}
			break;
			case gunState.shooting:
					if isLooking(index_facing.up){
						gun_index = spr_amadix_m1911_u_shoot;
					}else if isLooking(index_facing.down){
						gun_index = spr_amadix_m1911_d_shoot;
					}else if isLooking(index_facing.left){
						gun_index = spr_amadix_m1911_l_shoot;
					}else{
						gun_index = spr_amadix_m1911_r_shoot;
					}
			break;
			case gunState.reloading:
					if isLooking(index_facing.up){
						gun_index = spr_amadix_m1911_u_reload;
					}else if isLooking(index_facing.down){
						gun_index = spr_amadix_m1911_d_reload;
					}else if isLooking(index_facing.left){
						gun_index = spr_amadix_m1911_l_reload;
					}else{
						gun_index = spr_amadix_m1911_r_reload;
					}
			break;
			case gunState.reloading_empty:
					if isLooking(index_facing.up){
						gun_index = spr_amadix_m1911_u_reload_empty;
					}else if isLooking(index_facing.down){
						gun_index = spr_amadix_m1911_d_reload_empty;
					}else if isLooking(index_facing.left){
						gun_index = spr_amadix_m1911_l_reload_empty;
					}else{
						gun_index = spr_amadix_m1911_r_reload_empty;
					}
			break;
			case gunState.empty:
					if isLooking(index_facing.up){
						gun_index = spr_amadix_m1911_u_empty;
					}else if isLooking(index_facing.down){
						gun_index = spr_amadix_m1911_d_empty;
					}else if isLooking(index_facing.left){
						gun_index = spr_amadix_m1911_l_empty;
					}else{
						gun_index = spr_amadix_m1911_r_empty;
					}
			break;
		}

	break;
	#endregion
	
	#region sawed off
	case item.sawedoff:
		switch(obj_gun_logic.state){
			case gunState.standby:
					if isLooking(index_facing.up){
						gun_index = spr_amadix_sawedoff_u;
					}else if isLooking(index_facing.down){
						gun_index = spr_amadix_sawedoff_d;
					}else if isLooking(index_facing.left){
						gun_index = spr_amadix_sawedoff_l;
					}else{
						gun_index = spr_amadix_sawedoff_r;
					}
			break;
			case gunState.shooting:
					if isLooking(index_facing.up){
						gun_index = spr_amadix_sawedoff_u_shoot;
					}else if isLooking(index_facing.down){
						gun_index = spr_amadix_sawedoff_d_shoot;
					}else if isLooking(index_facing.left){
						gun_index = spr_amadix_sawedoff_l_shoot;
					}else{
						gun_index = spr_amadix_sawedoff_r_shoot;
					}
			break;
			case gunState.reloading:
					if isLooking(index_facing.up){
						gun_index = spr_amadix_sawedoff_u_reload;
					}else if isLooking(index_facing.down){
						gun_index = spr_amadix_sawedoff_d_reload;
					}else if isLooking(index_facing.left){
						gun_index = spr_amadix_sawedoff_l_reload;
					}else{
						gun_index = spr_amadix_sawedoff_r_reload;
					}
			break;
			case gunState.reloading_empty:
					if isLooking(index_facing.up){
						gun_index = spr_amadix_sawedoff_u_reload;
					}else if isLooking(index_facing.down){
						gun_index = spr_amadix_sawedoff_d_reload;
					}else if isLooking(index_facing.left){
						gun_index = spr_amadix_sawedoff_l_reload;
					}else{
						gun_index = spr_amadix_sawedoff_r_reload;
					}
			break;
			case gunState.empty:
					if isLooking(index_facing.up){
						gun_index = spr_amadix_sawedoff_u;
					}else if isLooking(index_facing.down){
						gun_index = spr_amadix_sawedoff_d;
					}else if isLooking(index_facing.left){
						gun_index = spr_amadix_sawedoff_l;
					}else{
						gun_index = spr_amadix_sawedoff_r;
					}
			break;
		}
	#endregion
	
	
	break;
	
}

#endregion

#region Rece

switch(itemeaten){
	case item.m1911:
		if (isLooking(index_facing.up)){				
				switch(obj_gun_logic.state){
					case gunState.standby:
						arms_index = spr_amadix_newA_gun_u;
						arms2_index = spr_none;
					break;
					case gunState.shooting:
						arms_index = spr_amadix_newA_gun_u_shoot;
						arms2_index = spr_none;
					break;
					case gunState.reloading:
						arms_index = spr_amadix_newA_gun_u_reload;
						arms2_index = spr_none;
					case gunState.reloading_empty:
						arms_index = spr_amadix_newA_gun_u_reload;
						arms2_index = spr_none;
					break;
					case gunState.empty:
						arms_index = spr_amadix_newA_gun_u;
						arms2_index = spr_none;
					break;
				}
		}else
		if (isLooking(index_facing.left)){		
				switch(obj_gun_logic.state){
					case gunState.standby:
						arms_index = spr_amadix_newA_gun_l;
						arms2_index = spr_none;
					break;
					case gunState.shooting:
						arms_index = spr_amadix_newA_gun_l_shoot;
						arms2_index = spr_none;
					break;
					case gunState.reloading:
						arms_index = spr_amadix_newA_gun_l_reload;
						arms2_index = spr_none;
					case gunState.reloading_empty:
						arms_index = spr_amadix_newA_gun_l_reload;
						arms2_index = spr_none;
					break;
					case gunState.empty:
						arms_index = spr_amadix_newA_gun_l;
						arms2_index = spr_none;
					break;
				}
		}else
		if (isLooking(index_facing.down)){
				switch(obj_gun_logic.state){
					case gunState.standby:
						arms_index = spr_amadix_newA_gun_d;
						arms2_index = spr_amadix_newA_gun_d2;
					break;
					case gunState.shooting:
						arms_index = spr_amadix_newA_gun_d_shoot;
						arms2_index = spr_amadix_newA_gun_d2_shoot;
					break;
					case gunState.reloading:
						arms_index = spr_amadix_newA_gun_d_reload;
						arms2_index = spr_none;
					case gunState.reloading_empty:
						arms_index = spr_amadix_newA_gun_d_reload;
						arms2_index = spr_none;
					break;
					case gunState.empty:
						arms_index = spr_amadix_newA_gun_d;
						arms2_index = spr_amadix_newA_gun_d2;
					break;
				}
		}else{				
				switch(obj_gun_logic.state){
					case gunState.standby:
						arms_index = spr_amadix_newA_gun_r;
						arms2_index = spr_none;
					break;
					case gunState.shooting:
						arms_index = spr_amadix_newA_gun_r_shoot;
						arms2_index = spr_none;
					break;
					case gunState.reloading:
						arms_index = spr_amadix_newA_gun_r_reload;
						arms2_index = spr_none;
					case gunState.reloading_empty:
						arms_index = spr_amadix_newA_gun_r_reload;
						arms2_index = spr_none;
					break;
					case gunState.empty:
						arms_index = spr_amadix_newA_gun_r;
						arms2_index = spr_none;
					break;
				}
		}
	break;
	case item.sawedoff:
		if (isLooking(index_facing.up)){				
				switch(obj_gun_logic.state){
					case gunState.standby:
						arms_index = spr_amadix_newA_sawedoff_u;
						arms2_index = spr_none;
					break;
					case gunState.shooting:
						arms_index = spr_amadix_newA_sawedoff_u_shoot;
						arms2_index = spr_none;
					break;
					case gunState.reloading:
						arms_index = spr_amadix_newA_sawedoff_u_reload;
						arms2_index = spr_none;
					case gunState.reloading_empty:
						arms_index = spr_amadix_newA_sawedoff_u_reload;
						arms2_index = spr_none;
					break;
					case gunState.empty:
						arms_index = spr_amadix_newA_sawedoff_u;
						arms2_index = spr_none;
					break;
				}
		}else
		if (isLooking(index_facing.left)){		
				switch(obj_gun_logic.state){
					case gunState.standby:
						arms_index = spr_amadix_newA_sawedoff_l;
						arms2_index = spr_none;
					break;
					case gunState.shooting:
						arms_index = spr_amadix_newA_sawedoff_l_shoot;
						arms2_index = spr_none;
					break;
					case gunState.reloading:
						arms_index = spr_amadix_newA_sawedoff_l_reload;
						arms2_index = spr_none;
					case gunState.reloading_empty:
						arms_index = spr_amadix_newA_sawedoff_l_reload;
						arms2_index = spr_none;
					break;
					case gunState.empty:
						arms_index = spr_amadix_newA_sawedoff_l;
						arms2_index = spr_none;
					break;
				}
		}else
		if (isLooking(index_facing.down)){
				switch(obj_gun_logic.state){
					case gunState.standby:
						arms_index = spr_amadix_newA_sawedoff_d;
						arms2_index = spr_amadix_newA_sawedoff_d2;
					break;
					case gunState.shooting:
						arms_index = spr_amadix_newA_sawedoff_d_shoot;
						arms2_index = spr_amadix_newA_sawedoff_d2_shoot;
					break;
					case gunState.reloading:
						arms_index = spr_amadix_newA_sawedoff_d_reload;
						arms2_index = spr_none;
					case gunState.reloading_empty:
						arms_index = spr_amadix_newA_sawedoff_d_reload;
						arms2_index = spr_none;
					break;
					case gunState.empty:
						arms_index = spr_amadix_newA_sawedoff_d;
						arms2_index = spr_amadix_newA_sawedoff_d2;
					break;
				}
		}else{				
				switch(obj_gun_logic.state){
					case gunState.standby:
						arms_index = spr_amadix_newA_sawedoff_r;
						arms2_index = spr_none;
					break;
					case gunState.shooting:
						arms_index = spr_amadix_newA_sawedoff_r_shoot;
						arms2_index = spr_none;
					break;
					case gunState.reloading:
						arms_index = spr_amadix_newA_sawedoff_r_reload;
						arms2_index = spr_none;
					case gunState.reloading_empty:
						arms_index = spr_amadix_newA_sawedoff_r_reload;
						arms2_index = spr_none;
					break;
					case gunState.empty:
						arms_index = spr_amadix_newA_sawedoff_r;
						arms2_index = spr_none;
					break;
				}
		}
	break;
	default:
		arms_index = spr_none;
		arms2_index = spr_none;
	break;
}
#endregion

#region Torso
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
										if (running != 2){
											torso_index = spr_amadix_bareTC_d;
										}else{
											torso_index = spr_amadix_bareTC_run_d;
										}
									break;
									case index_facing.left:
										if (running != 2){
											torso_index = spr_amadix_bareTC_l;
										}else{
											torso_index = spr_amadix_bareTC_run_l;
										}
									break;
									case index_facing.right:
										if (running != 2){
											torso_index = spr_amadix_bareTC_r;
										}else{
											torso_index = spr_amadix_bareTC_run_r;
										}
									break;
									case index_facing.up:
										if (running != 2){
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
	
		if (skid){
			torso_index = spr_amadix_newTC_skid;	
		}else{
			if (running != 2){
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
				
					//handgun-----------------------------------------------------
					case player_state_action.handgun:
						switch(facing){
							case index_facing.down:
								torso_index = spr_amadix_newTC_gun_d;
							break;
							case index_facing.left:
								torso_index = spr_amadix_newTC_gun_l;
							break;
							case index_facing.right:
								torso_index = spr_amadix_newTC_gun_r;
							break;
							case index_facing.up:
								torso_index = spr_amadix_newTC_gun_u;
							break;
						}
					
					break;
					//--------------------------------------------------------------
				
					//pickup-----------------------------------------------------
					case player_state_action.pickup:
						switch(facing){
							case index_facing.down:
								torso_index = spr_amadix_newTC_pick_d;
							break;
							case index_facing.left:
								torso_index = spr_amadix_newTC_pick_l;
							break;
							case index_facing.right:
								torso_index = spr_amadix_newTC_pick_r;
							break;
							case index_facing.up:
								torso_index = spr_amadix_newTC_pick_u;
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
											if (running != 2){
												torso_index = spr_amadix_newTC_d;
											}else{
												torso_index = spr_amadix_newTC_run_d;
											}
										break;
										case index_facing.left:
											if (running != 2){
												torso_index = spr_amadix_newTC_l;
											}else{
												torso_index = spr_amadix_newTC_run_l;
											}
										break;
										case index_facing.right:
											if (running != 2){
												torso_index = spr_amadix_newTC_r;
											}else{
												torso_index = spr_amadix_newTC_run_r;
											}
										break;
										case index_facing.up:
											if (running != 2){
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
			}else{
				switch(facing){
					case index_facing.down:
						torso_index = spr_amadix_newTC_run_d;
					break;
					case index_facing.left:
						torso_index = spr_amadix_newTC_run_l;
					break;
					case index_facing.right:
						torso_index = spr_amadix_newTC_run_r;
					break;
					case index_facing.up:
						torso_index = spr_amadix_newTC_run_u;
					break;
				}
			}
		}
	

			

	
	break;
}
#endregion

#region Nogi
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
										if (running != 2){
											legs_index = spr_amadix_pantsL_d;
										}else{
											legs_index = spr_amadix_pantsL_run_d;
										}
									break;
									case index_facing.left:
										if (running != 2){
											legs_index = spr_amadix_pantsL_l;
										}else{
											legs_index = spr_amadix_pantsL_run_l;
										}
									break;
									case index_facing.right:
										if (running != 2){
											legs_index = spr_amadix_pantsL_r;
										}else{
											legs_index = spr_amadix_pantsL_run_r;
										}
									break;
									case index_facing.up:
										if (running != 2){
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
		if (skid){
			legs_index = spr_amadix_jeansL_skid;	
		}else{
			if (running != 2){
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
				
					//handgun-----------------------------------------------------
					case player_state_action.handgun:
						switch(facing){
							case index_facing.down:
								legs_index = spr_amadix_jeansL_gun_d;
							break;
							case index_facing.left:
								legs_index = spr_amadix_jeansL_gun_l;
							break;
							case index_facing.right:
								legs_index = spr_amadix_jeansL_gun_r;
							break;
							case index_facing.up:
								legs_index = spr_amadix_jeansL_gun_u;
							break;
						}
					break;
					//--------------------------------------------------------------
				
					//pickup-----------------------------------------------------
					case player_state_action.pickup:
						switch(facing){
							case index_facing.down:
								legs_index = spr_amadix_jeansL_pick_d;
							break;
							case index_facing.left:
								legs_index = spr_amadix_jeansL_pick_l;
							break;
							case index_facing.right:
								legs_index = spr_amadix_jeansL_pick_r;
							break;
							case index_facing.up:
								legs_index = spr_amadix_jeansL_pick_u;
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
											if (running != 2){
												legs_index = spr_amadix_jeansL_d;
											}else{
												legs_index = spr_amadix_jeansL_run_d;
											}
										break;
										case index_facing.left:
											if (running != 2){
												legs_index = spr_amadix_jeansL_l;
											}else{
												legs_index = spr_amadix_jeansL_run_l;
											}
										break;
										case index_facing.right:
											if (running != 2){
												legs_index = spr_amadix_jeansL_r;
											}else{
												legs_index = spr_amadix_jeansL_run_r;
											}
										break;
										case index_facing.up:
											if (running != 2){
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
			}else{
				switch(facing){
					case index_facing.down:
						legs_index = spr_amadix_jeansL_run_d;
					break;
					case index_facing.left:
						legs_index = spr_amadix_jeansL_run_l;
					break;
					case index_facing.right:
						legs_index = spr_amadix_jeansL_run_r;
					break;
					case index_facing.up:
						legs_index = spr_amadix_jeansL_run_u;
					break;
				}
			}
		}
			
	break;
}
#endregion

#region Buty
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
										if (running != 2){
											boots_index = spr_amadix_feetB_d;
										}else{
											boots_index = spr_amadix_feetB_run_d;
										}
									break;
									case index_facing.left:
										if (running != 2){
											boots_index = spr_amadix_feetB_l;
										}else{
											boots_index = spr_amadix_feetB_run_l;
										}
									break;
									case index_facing.right:
										if (running != 2){
											boots_index = spr_amadix_feetB_r;
										}else{
											boots_index = spr_amadix_feetB_run_r;
										}
									break;
									case index_facing.up:
										if (running != 2){
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

			
		if (skid){
			boots_index = spr_amadix_newB_skid;	
		}else{
			if (running != 2){
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
				
					//gun-----------------------------------------------------
					case player_state_action.handgun:
						switch(facing){
							case index_facing.down:
								boots_index = spr_amadix_newB_gun_d;
							break;
							case index_facing.left:
								boots_index = spr_amadix_newB_gun_l;
							break;
							case index_facing.right:
								boots_index = spr_amadix_newB_gun_r;
							break;
							case index_facing.up:
								boots_index = spr_amadix_newB_gun_u;
							break;
						}
					break;
					//--------------------------------------------------------------
				
					//pickup-----------------------------------------------------
					case player_state_action.pickup:
						switch(facing){
							case index_facing.down:
								boots_index = spr_amadix_newB_pick_d;
							break;
							case index_facing.left:
								boots_index = spr_amadix_newB_pick_l;
							break;
							case index_facing.right:
								boots_index = spr_amadix_newB_pick_r;
							break;
							case index_facing.up:
								boots_index = spr_amadix_newB_pick_u;
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
											if (running != 2){
												boots_index = spr_amadix_newB_d;
											}else{
												boots_index = spr_amadix_newB_run_d;
											}
										break;
										case index_facing.left:
											if (running != 2){
												boots_index = spr_amadix_newB_l;
											}else{
												boots_index = spr_amadix_newB_run_l;
											}
										break;
										case index_facing.right:
											if (running != 2){
												boots_index = spr_amadix_newB_r;
											}else{
												boots_index = spr_amadix_newB_run_r;
											}
										break;
										case index_facing.up:
											if (running != 2){
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
			}else{
				switch(facing){
					case index_facing.down:
						boots_index = spr_amadix_newB_run_d;
					break;
					case index_facing.left:
						boots_index = spr_amadix_newB_run_l;
					break;
					case index_facing.right:
						boots_index = spr_amadix_newB_run_r;
					break;
					case index_facing.up:
						boots_index = spr_amadix_newB_run_u;
					break;
				}
			}
		}
			
	break;
}
#endregion


}
