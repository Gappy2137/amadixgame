function scr_player_movement() {
	//------------------------------------------------------
	key_right =     keyboard_check(ord("D"));
	key_left =      keyboard_check(ord("A"));
	key_up =        keyboard_check(ord("W"));
	key_down =      keyboard_check(ord("S"));
	key_run =       keyboard_check(vk_shift);
	//------------------------------------------------------


	//Ustawia predkosc

	switch (state) {
		case player_state.moving:
					if (key_run){
						spd = runspeed + speedEffect + speedChange;
						anim_speed = 0.3;
						running = true;
					}else{
						spd = walkspeed + speedEffect + speedChange;
						anim_speed = 0.09;
						running = false;
					}
	
					//Na lodzie
					var ice_collision = collision_rectangle(bbox_left + 4, bbox_bottom, bbox_right - 4, bbox_bottom, obj_ice16, true, true);
					if (ice_collision){
						accel = 0.04;
						deccel = 0.04;
							if (key_run){
								spd = runspeed + speedEffect + speedChange;
								anim_speed = 0.18;
								running = true;
							}else{
								spd = walkspeed + speedEffect + speedChange;
								anim_speed = 0.15;
								running = false;
							}
					}else{
						accel = 0.6;
						deccel = 0.32;
					}
		break;
		case player_state.idle:
					if (key_run){
						spd = runspeed + speedEffect + speedChange;
						anim_speed = 0.16;
						running = true;
					}else{
						spd = walkspeed + speedEffect + speedChange;
						anim_speed = 0.12;
						running = false;
					}
	
					//Na lodzie
					var ice_collision = collision_rectangle(bbox_left + 4, bbox_bottom, bbox_right - 4, bbox_bottom, obj_ice16, true, true);
					if (ice_collision){
						accel = 0.04;
						deccel = 0.04;
							if (key_run){
								spd = runspeed + speedEffect + speedChange;
								anim_speed = 0.18;
								running = true;
							}else{
								spd = walkspeed + speedEffect + speedChange;
								anim_speed = 0.15;
								running = false;
							}
					}else{
						accel = 0.6;
						deccel = 0.32;
					}
		break;
		case player_state.wading_idle:
					if (key_run){
						spd = runspeed + speedEffect + speedChange;
						anim_speed = 0.16;
						running = true;
					}else{
						spd = walkspeed + speedEffect + speedChange;
						anim_speed = 0.12;
						running = false;
					}
		break;
		case player_state.swimming_idle:
					if (key_run){
						spd = runspeed + speedEffect + speedChange;
						anim_speed = 0.16;
						running = true;
					}else{
						spd = walkspeed + speedEffect + speedChange;
						anim_speed = 0.12;
						running = false;
					}
		break;
		case player_state.wading:
					if (key_run){
						spd = runspeed - 0.35 + speedEffect + speedChange;
						anim_speed = 0.1;
						running = true;
					}else{
						spd = walkspeed - 0.3 + speedEffect + speedChange;
						anim_speed = 0.08;
						running = false;
					}
	
					accel = 0.2;
					deccel = 0.6;
		break;
		case player_state.swimming:
					if (key_run){
						spd = runspeed - 0.55 + speedEffect + speedChange;
						anim_speed = 0.08;
						running = true;
					}else{
						spd = walkspeed - 0.5 + speedEffect + speedChange;
						anim_speed = 0.05;
						running = false;
					}
	
					accel = 0.15;
					deccel = 0.2;
		break;
	}



	if (canmove){
		//Dzialanie klawiszy
		hor_keyPress = key_right - key_left;
		ver_keyPress = key_down - key_up;


		//Ustawia plynne zmienne hsp i vsp
		if (scr_playerPressingKeys()){
			hsp = lerp(hsp, spd*hor_keyPress, accel);
			vsp = lerp(vsp, spd*ver_keyPress, accel);
		}else{
			hsp = lerp(hsp, 0, deccel);
			vsp = lerp(vsp, 0, deccel);
		}
	}
	
	if (abs(hsp) < 0.001){
		hsp = 0;	
	}
	if (abs(vsp) < 0.001){
		vsp = 0;	
	}
	
	dir = point_direction(x, y, x + hsp, y + vsp);
	
	//Naprawa poruszania sie po przekatnej
	
	//----kod
	var ice = collision_rectangle(bbox_left + 4, bbox_bottom, bbox_right - 4, bbox_bottom, obj_ice16, true, true);
	var diagonal = hor_keyPress != 0 && ver_keyPress != 0;
	if (diagonal) && (!ice){
		hsp *= 0.8;
		vsp *= 0.8;
		anim_speed *= 0.8;
	}
	
	if (speedEffect > 0){
		anim_speed *= 0.8;	
	}
	
	var plantcol = collision_rectangle(bbox_left + 4, bbox_bottom, bbox_right - 4, bbox_bottom, par_collectible, true, true);
	var plantcol2 = collision_rectangle(bbox_left + 4, bbox_bottom, bbox_right - 4, bbox_bottom, obj_grass_plains, true, true);
	if (plantcol) || (plantcol2){
		speedChange = -0.25;
	}else{
		speedChange = 0;	
	}
	

	//Kolizje
	//-----------------------------------------------------------------------------
	/*
	if (hsp != 0){
		var hor_collision = instance_place(x + hsp, y, par_collision);
		    if ((hor_collision != noone) && (hor_collision.cancollide)){
		        repeat(abs(hsp)){
		            if(!place_meeting(x + sign(hsp), y, par_collision)){x += sign(hsp);}
		            else{ break; }
		        }
		        hsp = 0;
		    }
	}
	if canmove == true{
		x += hsp;
	}

	if (vsp != 0){
		var ver_collision = instance_place(x, y + vsp, par_collision);
		    if ((ver_collision != noone) && (ver_collision.cancollide)){
		        repeat(abs(vsp)){
				
		            if(!place_meeting(x, y + sign(vsp), par_collision)){y += sign(vsp);}
		            else{ break; }
		        }
		        vsp = 0;
		    }
	}
	if canmove == true{
	    y += vsp;
	}
	*/
	//-----------------------------------------------------------------------------

	//Ustawia zmienna "state"
	var shallow_collision = collision_rectangle(bbox_left + 4, bbox_bottom - 1, bbox_right - 4, bbox_bottom, obj_shallowwater16, true, true);
	var deep_collision = collision_rectangle(bbox_left + 4, bbox_bottom - 1, bbox_right - 4, bbox_bottom, obj_water16, true, true);

	if (shallow_collision){
		if (moving){
			state = player_state.wading;
		}else{
			state = player_state.wading_idle;
		}
	
	}else if (deep_collision){
		if (moving){
			state = player_state.swimming;
		}else{
			state = player_state.swimming_idle;
		}
		
	}else{
		if (moving){
			state = player_state.moving;
		}else{
			state = player_state.idle;
		}
	}

	//Kolizje TESTOWE
	//-----------------------------------------------------------------------------


	
	var hor_collision = instance_place(x + hsp, y, par_collision);
	var ver_collision = instance_place(x, y + vsp, par_collision);
	var slope_collision = instance_place(x + hsp, y + vsp, par_slope);
	slopefix = false;


	if ((slope_collision != noone) && (slope_collision.cancollide == true)){
		scr_player_movement_slope(true);
	}

	if (hsp != 0){
		    if ((hor_collision != noone) && (hor_collision.cancollide)){
		        repeat(abs(hsp)){
		            if(!place_meeting(x + sign(hsp), y, par_collision)){x += sign(hsp);}
		            else{ break; }
		        }
		        hsp = 0;
		    }
	}
	if canmove == true{
		x += hsp;
	}
	if (vsp != 0){
		    if ((ver_collision != noone) && (ver_collision.cancollide)){
		        repeat(abs(vsp)){
				
		            if(!place_meeting(x, y + sign(vsp), par_collision)){y += sign(vsp);}
		            else{ break; }
		        }
		        vsp = 0;
		    }
	}
	if canmove == true{
		y += vsp;
	}



/*
	if (hsp != 0){
		var yplus = 0;
		    if ((hor_collision != noone) && (hor_collision.cancollide)){
				while (place_meeting(x + hsp, y - yplus, par_collision) && yplus <= abs(1*hsp)) {yplus += 1;}
				if (place_meeting(x + hsp, y - yplus, par_collision)){
					while !(place_meeting(x + sign(hsp), y, par_collision)){x += sign(hsp)}
					hsp = 0;
				}else{
					y -= yplus;	
				}
		    }
	}
	if canmove == true{
		x += hsp;
	}

	if (vsp != 0){
		var xplus = 0;
		    if ((ver_collision != noone) && (ver_collision.cancollide)){
				while (place_meeting(x - xplus, y + vsp, par_collision) && xplus <= abs(1*vsp)) {xplus += 1;}
				if (place_meeting(x - xplus, y + vsp, par_collision)){
					while !(place_meeting(x, y + sign(vsp), par_collision)){y += sign(vsp)}
					vsp = 0;
				}else{
					x -= xplus;	
				}
		    }
	}
	if canmove == true{
		y += vsp;
	}*/
	
	
	//var move_dist = point_distance(0, 0, hor_keyPress, ver_keyPress);
	//var move_dir = point_direction(0, 0, hor_keyPress, ver_keyPress);
	


	/*if ((hor_collision != noone) && (hor_collision.cancollide)){
		if (place_meeting(x + sign(hsp), y, par_collision) && place_meeting(x + sign(hsp), y - 1, par_collision) && !place_meeting(x + sign(hsp), y - 2, par_collision)){
	        y -= 1;
		}
	    else if (place_meeting(x + sign(hsp), y, par_collision) && !place_meeting(x + sign(hsp), y - 1, par_collision)){
	        --y;
		}
	}
	if ((ver_collision != noone) && (ver_collision.cancollide)){
		if (place_meeting(x + sign(hsp), y, par_collision) && place_meeting(x + sign(hsp), y - 1, par_collision) && !place_meeting(x + sign(hsp), y - 2, par_collision)){
	        y -= 1;
		}
	    else if (place_meeting(x + sign(hsp), y, par_collision) && !place_meeting(x + sign(hsp), y - 1, par_collision)){
	        --y;
		}
	}*/

	scr_player_unstuck();

	//-----------------------------------------------------------------------------


	//Ustawia zmienna moving
	if ((round_ext(hsp, 0.1) != 0) || (round_ext(vsp, 0.1) != 0)){moving = true;}else{moving = false;}

	//Naprawia animacje biegania
	if (running) && (!moving){
		running = false;
	}

	//Animacja gracza
	scr_playerMovingAnim();

	//Blokuje wychodzenie poza pokoj
	if ((x < 0) || (x > room_width)){
		x = xprevious;
	}
	if ((y < -8) || (y > room_height - 24)){
		y = yprevious;
	}

	//Efekty podloza
	scr_groundtype_fx();

}
