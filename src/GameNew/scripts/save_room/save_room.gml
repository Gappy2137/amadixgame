function save_room(){
	
	global.savingRoom = true;
	
	instance_activate_all();
	
	// collectibles
	var _collectiblesNum = instance_number(par_collectible);
	// trees
	var _treesNum = instance_number(par_tree);
	// grass
	var _grassNum = instance_number(par_grass);
	// containers
	var _containerNum = instance_number(par_container);
	
	// main struct
	var struct = {
		colNum : _collectiblesNum,
		colData : array_create(_collectiblesNum),
		treesNum : _treesNum,
		treesData: array_create(_treesNum),
		grassNum : _grassNum,
		grassData: array_create(_grassNum),
		containerNum : _containerNum,
		containerData: array_create(_containerNum),
	}
	
	
	// collectible data
	
	var i = 0;
	
	repeat(_collectiblesNum){
		
		var _inst = instance_find(par_collectible, i);
		
		struct.colData[i] = {
			
			ID : _inst.id,
			timer : _inst.timer,
			amount : _inst.amount,
			pickedup : _inst.pickedup,
			flag : _inst.flag
			
		}
		
		i++;
	}
	
	// trees data
	
	i = 0;
	
	repeat(_treesNum){
		
		var _inst = instance_find(par_tree, i);
		
		struct.treesData[i] = {
			
			ID : _inst.id,
			timer : _inst.timer,
			itemNum : _inst.itemNum,
			windangle : _inst.windangle,
			flag : _inst.flag,
			windtimer : _inst.windtimer
			
		}
		
		i++;
	}
	
	// grass data
	
	i = 0;
	
	repeat(_grassNum){
		
		var _inst = instance_find(par_grass, i);
		
		struct.grassData[i] = {
			
			ID : _inst.id,
			finalangle : _inst.finalangle,
			timer : _inst.timer
			
		}
		
		i++;
	}
	
	// containers data
	
	i = 0;
	
	var _saveArray = array_create(0);
	
	
	
	repeat(_containerNum){
		
		var _inst = instance_find(par_container, i);
		var _ds = _inst.ds_container;
		var _gridArray = array_create(0);
		
		var j = 0;
		
		array_push(_saveArray, _inst);
		
		repeat(_inst.containerSlots){
			array_push(_gridArray, _ds[# INVITEM, j]);
			array_push(_gridArray, _ds[# INVAMOUNT, j]);
			array_push(_gridArray, _ds[# INVLEVEL, j]);
			array_push(_gridArray, _ds[# INVCAP, j]);
			j++;
		}
		
		array_push(_saveArray, _gridArray);
		
		_gridArray = [];
		j = 0;
		i++;
	}
	
	
	var _filename = ("\savedata\\" + room_get_name(room) + "_roomData.sav");
	var _json = json_stringify(_saveArray);
	var _buffer = buffer_create(string_byte_length(_json) + 1, buffer_fixed, 1);
	buffer_write(_buffer, buffer_string, _json);
	
	buffer_save(_buffer, _filename);
	
	buffer_delete(_buffer);
	
	
	i = 0;
	
	switch(room){
		case rm_devroom_3: global.roomData.devroom_3 = struct		break;
		case rm_devroom_b: global.roomData.devroom_b = struct		break;
		case rm_devroom_c: global.roomData.devroom_c = struct		break;
		case rm_devroom_cave: global.roomData.devroom_cave = struct		break;
	}
	
	
	
	global.savingRoom = false;
}