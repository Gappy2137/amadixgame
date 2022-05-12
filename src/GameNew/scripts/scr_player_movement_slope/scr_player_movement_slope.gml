function scr_player_movement_slope() {

var _spd = .5;

#region Rampy nachylone do podloza maks 1 piksel w gore TEST
	//Podchodzenie od prawej 
	if ((instance_place(x + 1, y, par_collision)) && (!instance_place(x + 1, y - 1, par_collision))){
			if !((key_right) && (key_down)){
					if (key_right){
					
						//Naprawa animacji gracza
						hsp = .1;
						vsp = -.1;
					
						y -= _spd;
					
						slopefix = true;
					
							if (!instance_place(x + 1, y, par_collision))
								x += _spd;
					}
					if (key_down){
						//Naprawa wchodzenia w sciane
						if !((instance_place(x, y + 1, par_collision)) && (instance_place(x - 1, y + 1, par_collision)) && (instance_place(x - 2, y + 1, par_collision)) && (instance_place(x - 3, y + 1, par_collision)) && (instance_place(x - 4, y + 1, par_collision))){
											
								//Naprawa animacji gracza
								hsp = -.1;
								vsp = .1;
					
								y += _spd;
							
								slopefix = true;
									if (!instance_place(x + 1, y, par_collision))
										x -= _spd;
						}
					}
			}
	}

	if !((key_right) && (key_down)){
		if 	(key_down){
				if ((instance_place(x, y + 1, par_collision) && (instance_place(x - 1, y + 2, par_collision) && (instance_place(x + 1, y, par_collision) && (instance_place(x + 2, y, par_collision) && (instance_place(x + 1, y - 1, par_collision) && (instance_place(x + 2, y - 2, par_collision)))))))){
								//Naprawa animacji gracza
								hsp = -.1;
								vsp = .1;
					
								y += _spd;
							
								slopefix = true;
									if (!instance_place(x + 1, y, par_collision))
										x -= _spd; 	
				}
		}
	}

	//Podchodzenie od lewej
	if ((instance_place(x - 1, y, par_collision)) && (!instance_place(x - 1, y - 1, par_collision))){
			if !((key_left) && (key_down)){
					if (key_left){
					
						//Naprawa animacji gracza
						hsp = -.1;
						vsp = -.1;
					
						y -= _spd;
					
						slopefix = true;
					
							if (!instance_place(x - 1, y, par_collision))
								x -= _spd;
					}
					if (key_down){
						//Naprawa wchodzenia w sciane
						if !((instance_place(x, y + 1, par_collision)) && (instance_place(x + 1, y + 1, par_collision)) && (instance_place(x + 2, y + 1, par_collision)) && (instance_place(x + 3, y + 1, par_collision)) && (instance_place(x + 4, y + 1, par_collision))){
											
								//Naprawa animacji gracza
								hsp = .1;
								vsp = .1;
					
								y += _spd;
							
								slopefix = true;
							
									if (!instance_place(x - 1, y, par_collision))
										x += _spd;
						}
					}
			}

	}

	if !((key_left) && (key_down)){
		if 	(key_down){
				if ((instance_place(x, y + 1, par_collision) && (instance_place(x + 1, y + 2, par_collision) && (instance_place(x - 1, y, par_collision) && (instance_place(x - 2, y, par_collision) && (instance_place(x - 1, y - 1, par_collision) && (instance_place(x - 2, y - 2, par_collision)))))))){
								//Naprawa animacji gracza
								hsp = .1;
								vsp = .1;
					
								y += _spd;
							
								slopefix = true;
							
									if (!instance_place(x - 1, y, par_collision))
										x += _spd;
				}
		}
	}
#endregion



#region Rampy nachylone do "sufitu" maks 1 piksel w gore
	//Podchodzenie od prawej

	if ((instance_place(x + 1, y, par_collision)) && (!instance_place(x + 1, y + 1, par_collision))){
			if !((key_right) && (key_up)){
					if (key_right){
					
						//Naprawa animacji gracza
						hsp = .1;
						vsp = .1;
					
						y += _spd;
					
						slopefix = true;
					
							if (!instance_place(x + 1, y, par_collision))
								x += _spd;
					}
					if (key_up){
						//Naprawa wchodzenia w sciane
						if !((instance_place(x, y - 1, par_collision)) && (instance_place(x - 1, y - 1, par_collision)) && (instance_place(x - 2, y - 1, par_collision)) && (instance_place(x - 3, y - 1, par_collision)) && (instance_place(x - 4, y - 1, par_collision))){
											
								//Naprawa animacji gracza
								hsp = -.1;
								vsp = -.1;
					
								y -= _spd;
							
								slopefix = true;
									if (!instance_place(x - 1, y, par_collision))
										x -= _spd;
						}
					}
			}
	}

	if !((key_right) && (key_up)){
		if 	(key_up){
				if ((instance_place(x, y - 1, par_collision) && (instance_place(x - 1, y - 2, par_collision) && (instance_place(x + 1, y, par_collision) && (instance_place(x + 2, y, par_collision) && (instance_place(x + 1, y + 1, par_collision) && (instance_place(x + 2, y + 2, par_collision)))))))){
								//Naprawa animacji gracza
								hsp = -.1;
								vsp = -.1;
					
								y -= _spd;
							
								slopefix = true;
									if (!instance_place(x - 1, y, par_collision))
										x -= _spd;
				}
		}
	}


	//Podchodzenie od lewej
	if ((instance_place(x - 1, y, par_collision)) && (!instance_place(x - 1, y + 1, par_collision))){
			if !((key_left) && (key_up)){
					if (key_left){
					
						//Naprawa animacji gracza
						hsp = -.1;
						vsp = .1;
					
						y += _spd;
					
						slopefix = true;
					
							if (!instance_place(x - 1, y, par_collision))
								x -= _spd;
					}
					if (key_up){
						//Naprawa wchodzenia w sciane
						if !((instance_place(x, y - 1, par_collision)) && (instance_place(x + 1, y - 1, par_collision)) && (instance_place(x + 2, y - 1, par_collision)) && (instance_place(x + 3, y - 1, par_collision)) && (instance_place(x + 4, y - 1, par_collision))){
											
								//Naprawa animacji gracza
								hsp = .1;
								vsp = -.1;
					
								y -= _spd;
							
								slopefix = true;
									if (!instance_place(x + 1, y, par_collision))
										x += _spd;
						}
					}
			}
	}


	if !((key_left) && (key_up)){
		if 	(key_up){
				if ((instance_place(x, y - 1, par_collision) && (instance_place(x + 1, y - 2, par_collision) && (instance_place(x - 1, y, par_collision) && (instance_place(x - 2, y, par_collision) && (instance_place(x - 1, y + 1, par_collision) && (instance_place(x - 2, y + 2, par_collision)))))))){
								//Naprawa animacji gracza
								hsp = .1;
								vsp = -.1;
					
								y -= _spd;
							
								slopefix = true;
									if (!instance_place(x + 1, y, par_collision))
										x += _spd;
				}
		}
	}
#endregion

}
