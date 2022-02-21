function scr_player_movement_slope() {


#region Rampy nachylone do podloza maks 1 piksel w gore
	//Podchodzenie od prawej
	if ((instance_place(x + 1, y, par_collision)) && (!instance_place(x + 1, y - 1, par_collision))){
			if !((key_right) && (key_down)){
					if (key_right){
					
						//Naprawa animacji gracza
						hsp = .1;
						vsp = -.1;
					
						y -= 1;
					
						slopefix = true;
					
							if (!instance_place(x + 1, y, par_collision))
								x += 1;
					}
					if (key_down){
						//Naprawa wchodzenia w sciane
						if !((instance_place(x, y + 1, par_collision)) && (instance_place(x - 1, y + 1, par_collision)) && (instance_place(x - 2, y + 1, par_collision)) && (instance_place(x - 3, y + 1, par_collision)) && (instance_place(x - 4, y + 1, par_collision))){
											
								//Naprawa animacji gracza
								hsp = -.1;
								vsp = .1;
					
								y += 1;
							
								slopefix = true;
									if (!instance_place(x + 1, y, par_collision))
										x -= 1;
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
					
								y += 1;
							
								slopefix = true;
									if (!instance_place(x + 1, y, par_collision))
										x -= 1; 	
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
					
						y -= 1;
					
						slopefix = true;
					
							if (!instance_place(x - 1, y, par_collision))
								x -= 1;
					}
					if (key_down){
						//Naprawa wchodzenia w sciane
						if !((instance_place(x, y + 1, par_collision)) && (instance_place(x + 1, y + 1, par_collision)) && (instance_place(x + 2, y + 1, par_collision)) && (instance_place(x + 3, y + 1, par_collision)) && (instance_place(x + 4, y + 1, par_collision))){
											
								//Naprawa animacji gracza
								hsp = .1;
								vsp = .1;
					
								y += 1;
							
								slopefix = true;
							
									if (!instance_place(x - 1, y, par_collision))
										x += 1;
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
					
								y += 1;
							
								slopefix = true;
							
									if (!instance_place(x - 1, y, par_collision))
										x += 1;
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
					
						y += 1;
					
						slopefix = true;
					
							if (!instance_place(x + 1, y, par_collision))
								x += 1;
					}
					if (key_up){
						//Naprawa wchodzenia w sciane
						if !((instance_place(x, y - 1, par_collision)) && (instance_place(x - 1, y - 1, par_collision)) && (instance_place(x - 2, y - 1, par_collision)) && (instance_place(x - 3, y - 1, par_collision)) && (instance_place(x - 4, y - 1, par_collision))){
											
								//Naprawa animacji gracza
								hsp = -.1;
								vsp = -.1;
					
								y -= 1;
							
								slopefix = true;
									if (!instance_place(x - 1, y, par_collision))
										x -= 1;
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
					
								y -= 1;
							
								slopefix = true;
									if (!instance_place(x - 1, y, par_collision))
										x -= 1;
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
					
						y += 1;
					
						slopefix = true;
					
							if (!instance_place(x - 1, y, par_collision))
								x -= 1;
					}
					if (key_up){
						//Naprawa wchodzenia w sciane
						if !((instance_place(x, y - 1, par_collision)) && (instance_place(x + 1, y - 1, par_collision)) && (instance_place(x + 2, y - 1, par_collision)) && (instance_place(x + 3, y - 1, par_collision)) && (instance_place(x + 4, y - 1, par_collision))){
											
								//Naprawa animacji gracza
								hsp = .1;
								vsp = -.1;
					
								y -= 1;
							
								slopefix = true;
									if (!instance_place(x + 1, y, par_collision))
										x += 1;
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
					
								y -= 1;
							
								slopefix = true;
									if (!instance_place(x + 1, y, par_collision))
										x += 1;
				}
		}
	}
#endregion

#region Rampy nachylone do podloza maks 2 piksele w gore
	/*
	//Podchodzenie od prawej
	if ((instance_place(x, y + 1, par_collision)) && (instance_place(x, y + 2, par_collision)) && (instance_place(x + 1, y, par_collision)) && (instance_place(x + 1, y - 1, par_collision)) && (!instance_place(x + 1, y - 2, par_collision))){
			if !((key_right) && (key_down)){
					if (key_down){
						y += vsp;
						hsp -= floor(spd);
					}
			}
	}

	//Podchodzenie od lewej
	if ((instance_place(x, y + 1, par_collision)) && (instance_place(x, y + 2, par_collision)) && (instance_place(x - 1, y, par_collision)) && (instance_place(x - 1, y - 1, par_collision)) && (!instance_place(x - 1, y - 2, par_collision))){
			if !((key_left) && (key_down)){
					if (key_down){
						y += vsp;
						hsp += floor(spd);
					}
			}
	}
	*/
#endregion




#region Rampy nachylone do podloza maks 1 piksel w gore test
	//Podchodzenie od prawej
	/*
	if ((instance_place_slope(x + 1, y)) && (!instance_place_slope(x + 1, y - 1))){
			if !((key_right) && (key_down)){
					if (key_right){
					
						//Naprawa animacji gracza
						hsp = .1;
						vsp = -.1;
					
						y -= floor(spd);
					
						slopefix = true;
					
							if (!instance_place_slope(x + 1, y))
								x += floor(spd);
					}
					if (key_down){
						//Naprawa wchodzenia w sciane
						if !((instance_place_slope(x, y + 1)) && (instance_place_slope(x - 1, y + 1)) && (instance_place_slope(x - 2, y + 1)) && (instance_place_slope(x - 3, y + 1)) && (instance_place_slope(x - 4, y + 1))){
											
								//Naprawa animacji gracza
								hsp = -.1;
								vsp = .1;
					
								y += floor(spd);
							
								slopefix = true;
									if (!instance_place_slope(x + 1, y))
										x -= floor(spd);
						}
					}
			}
	}

	if !((key_right) && (key_down)){
		if 	(key_down){
				if ((instance_place_slope(x, y + 1) && (instance_place_slope(x - 1, y + 2) && (instance_place_slope(x + 1, y) && (instance_place_slope(x + 2, y) && (instance_place_slope(x + 1, y - 1) && (instance_place_slope(x + 2, y - 2)))))))){
								//Naprawa animacji gracza
								hsp = -.1;
								vsp = .1;
					
								y += floor(spd);
							
								slopefix = true;
									if (!instance_place_slope(x + 1, y))
										x -= floor(spd); 	
				}
		}
	}

	//Podchodzenie od lewej
	if ((instance_place_slope(x - 1, y)) && (!instance_place_slope(x - 1, y - 1))){
			if !((key_left) && (key_down)){
					if (key_left){
					
						//Naprawa animacji gracza
						hsp = -0.001;
						vsp = -0.001;
					
						y -= floor(spd);
					
						slopefix = true;
					
							if (!instance_place_slope(x - 1, y))
								x -= floor(spd);
					}
					if (key_down){
						//Naprawa wchodzenia w sciane
						if !((instance_place_slope(x, y + 1)) && (instance_place_slope(x + 1, y + 1)) && (instance_place_slope(x + 2, y + 1)) && (instance_place_slope(x + 3, y + 1)) && (instance_place_slope(x + 4, y + 1))){
											
								//Naprawa animacji gracza
								hsp = .1;
								vsp = .1;
					
								y += floor(spd);
							
								slopefix = true;
							
									if (!instance_place_slope(x - 1, y))
										x += floor(spd);
						}
					}
			}

	}

	if !((key_left) && (key_down)){
		if 	(key_down){
				if ((instance_place_slope(x, y + 1) && (instance_place_slope(x + 1, y + 2) && (instance_place_slope(x - 1, y) && (instance_place_slope(x - 2, y) && (instance_place_slope(x - 1, y - 1) && (instance_place_slope(x - 2, y - 2)))))))){
								//Naprawa animacji gracza
								hsp = .1;
								vsp = .1;
					
								y += floor(spd);
							
								slopefix = true;
							
									if (!instance_place_slope(x - 1, y))
										x += floor(spd);
				}
		}
	}*/
#endregion

#region Rampy nachylone do "sufitu" maks 1 piksel w gore
	//Podchodzenie od prawej
	/*
	if ((instance_place(x + 1, y, par_collision)) && (!instance_place(x + 1, y + 1, par_collision))){
			if !((key_right) && (key_up)){
					if (key_right){
					
						//Naprawa animacji gracza
						hsp = .1;
						vsp = .1;
					
						y += floor(spd);
					
						slopefix = true;
					
							if (!instance_place(x + 1, y, par_collision))
								x += floor(spd);
					}
					if (key_up){
						//Naprawa wchodzenia w sciane
						if !((instance_place(x, y - 1, par_collision)) && (instance_place(x - 1, y - 1, par_collision)) && (instance_place(x - 2, y - 1, par_collision)) && (instance_place(x - 3, y - 1, par_collision)) && (instance_place(x - 4, y - 1, par_collision))){
											
								//Naprawa animacji gracza
								hsp = -.1;
								vsp = -.1;
					
								y -= floor(spd);
							
								slopefix = true;
									if (!instance_place(x - 1, y, par_collision))
										x -= floor(spd);
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
					
								y -= floor(spd);
							
								slopefix = true;
									if (!instance_place(x - 1, y, par_collision))
										x -= floor(spd);
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
					
						y += floor(spd);
					
						slopefix = true;
					
							if (!instance_place(x - 1, y, par_collision))
								x -= floor(spd);
					}
					if (key_up){
						//Naprawa wchodzenia w sciane
						if !((instance_place(x, y - 1, par_collision)) && (instance_place(x + 1, y - 1, par_collision)) && (instance_place(x + 2, y - 1, par_collision)) && (instance_place(x + 3, y - 1, par_collision)) && (instance_place(x + 4, y - 1, par_collision))){
											
								//Naprawa animacji gracza
								hsp = .1;
								vsp = -.1;
					
								y -= floor(spd);
							
								slopefix = true;
									if (!instance_place(x + 1, y, par_collision))
										x += floor(spd);
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
					
								y -= floor(spd);
							
								slopefix = true;
									if (!instance_place(x + 1, y, par_collision))
										x += floor(spd);
				}
		}
	}*/
#endregion


}
