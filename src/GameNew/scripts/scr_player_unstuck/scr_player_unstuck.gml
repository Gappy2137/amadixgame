function scr_player_unstuck() {
	
	var _list = ds_list_create();
	var _num = instance_place_list(x, y, par_collision, _list, false);
	
	if (_num != noone){
		var __i = 0;
		repeat(_num){
			if (variable_instance_exists(_list[| __i], "cancollide")){
				if (_list[| __i].cancollide == true){
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
			__i++;
		}
		ds_list_destroy(_list);
	}
	



}
