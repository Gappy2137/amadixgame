function load_room(){

	var struct = 0;
	
	switch(room){
		case rm_devroom_3: struct = global.roomData.devroom_3 		break;
		case rm_devroom_b: struct = global.roomData.devroom_b		break;
	}

	if (!is_struct(struct)){exit;}
	
	var i = 0;
	
	repeat(struct.colNum){
		
		var _inst = instance_find(par_collectible, i);
		
		struct.colData[i] = {
			
			timer : _inst.timer,
			amount : _inst.amount,
			
		}
		
		_inst.timer = struct.timer[i];
		_inst.amount = struct.amount[i];
		
		i++;
	}
	
	i = 0;
}