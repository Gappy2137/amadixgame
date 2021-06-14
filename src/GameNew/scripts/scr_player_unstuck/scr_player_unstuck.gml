function scr_player_unstuck() {
	if instance_place(x, y, par_collision){
			for(var i = 0; i < 1000; ++i;){
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
