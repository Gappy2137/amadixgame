function scr_player_stats(){
	var drain = 0;
	switch (state){
		case player_state.idle:
			drain = 0;
		break;
		case player_state.moving:
			if (running = true){
				drain = .001;	
			}else{
				drain = 0;
			}
		break;
		case player_state.wading:
			if (running = true){
				drain = .0075;	
			}else{
				drain = .005;
			}
		break;
		case player_state.wading_idle:
			drain = 0;
		break;
		case player_state.swimming:
			if (running = true){
				drain = .02;	
			}else{
				drain = .01;
			}
		break;
		case player_state.swimming_idle:
			drain = .005;
		break;
		case player_state.hurt:
			drain = .01;
		break;
		case player_state.ladder:
			drain = .0075;
		break;
	}
	stamina_drain = drain;
}