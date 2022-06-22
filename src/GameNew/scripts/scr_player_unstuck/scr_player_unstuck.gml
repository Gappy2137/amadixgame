function scr_player_unstuck() {
	
	var maincollision = instance_place(x, y, par_collision);
	
	if (maincollision){
		if ((maincollision != noone) && (maincollision.cancollide)){
			for(var i = 0; i < 10; ++i;){
				
					if (!instance_place(x + i, y, par_collision)){
							x += i;
							break;
					}
					if (!instance_place(x - i, y, par_collision)){
							x -= i;
							break;
					}
					if (!instance_place(x, y - i, par_collision)){
							x -= i;
							break;
					}
					if (!instance_place(x, y + i, par_collision)){
							x += i;
							break;
					}
					if (!instance_place(x + i, y + i, par_collision)){
							x += i;
							y += i;
							break;
					}
					if (!instance_place(x - i, y + i, par_collision)){
							x -= i;
							y += i;
							break;
					}
					if (!instance_place(x + i, y - i, par_collision)){
							x += i;
							y -= i;
							break;
					}
					if (!instance_place(x - i, y - i, par_collision)){
							x -= i;
							y -= i;
							break;
					}

			}
		}
	}


}
