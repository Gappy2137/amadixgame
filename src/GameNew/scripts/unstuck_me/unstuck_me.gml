function unstuck_me() {
	if instance_place(x, y, par_collision){
			for(var i = 0; i < 10; i+=1;){
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
