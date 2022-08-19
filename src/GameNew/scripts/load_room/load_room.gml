function load_room(){

	var struct = 0;
	
	switch(room){
		case rm_devroom_3: struct = global.roomData.devroom_3 		break;
		case rm_devroom_b: struct = global.roomData.devroom_b		break;
	}

	if (!is_struct(struct)){exit;}
	
	var i = 0;
	
	repeat(struct.colNum){
		
		var _inst = struct.colData[i].ID;
		var _timer = struct.colData[i].timer;
		var _amount = struct.colData[i].amount;
		var _pickedup = struct.colData[i].pickedup;
		var _flag = struct.colData[i].flag;
		
		with(_inst){
			timer = _timer;
			amount = _amount;
			pickedup = _pickedup;
			flag = _flag;
		}
		i++;
	}
	
	i = 0;
}