function save_room(){
	
	global.savingRoom = true;
	
	instance_activate_all();
	
	var _collectiblesNum = instance_number(par_collectible);
	
	var struct = {
		colNum : _collectiblesNum,
		colData : array_create(_collectiblesNum),
	}
	
	var i = 0;
	
	repeat(_collectiblesNum){
		
		var _inst = instance_find(par_collectible, i);
		
		struct.colData[i] = {
			
			ID : _inst.id,
			timer : _inst.timer,
			amount : _inst.amount,
			pickedup : _inst.pickedup,
			flag : _inst.flag,
			
		}
		
		i++;
	}
	
	i = 0;
	
	switch(room){
		case rm_devroom_3: global.roomData.devroom_3 = struct		break;
		case rm_devroom_b: global.roomData.devroom_b = struct		break;
	}
	
	global.savingRoom = false;
}