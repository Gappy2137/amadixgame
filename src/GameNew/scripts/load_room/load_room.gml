function load_room(){

	var struct = 0;
	
	switch(room){
		case rm_devroom_3: struct = global.roomData.devroom_3 		break;
		case rm_devroom_b: struct = global.roomData.devroom_b		break;
		case rm_devroom_c: struct = global.roomData.devroom_c		break;
	}

	if (!is_struct(struct)){exit;}
	
	
	// collectible data
	
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
	
	
	
	// trees data
	
	i = 0;

	repeat(struct.treesNum){
		
		var _inst = struct.treesData[i].ID;
		var _timer = struct.treesData[i].timer;
		var _itemNum = struct.treesData[i].itemNum;
		var _windangle = struct.treesData[i].windangle;
		var _flag = struct.treesData[i].flag;
		var _windtimer = struct.treesData[i].windtimer;
		
		with(_inst){
			timer = _timer;
			itemNum = _itemNum;
			windangle = _windangle;
			flag = _flag;
			windtimer = _windtimer;
		}
		i++;
	}
	
	// grass data
	
	i = 0;

	repeat(struct.grassNum){
		
		var _inst = struct.grassData[i].ID;
		var _timer = struct.grassData[i].timer;
		var _finalangle = struct.grassData[i].finalangle;
		
		with(_inst){
			timer = _timer;
			finalangle = _finalangle;
		}
		i++;
	}
	
	// container data
	
	var _filename = ("\savedata\\" + room_get_name(room) + "_roomData.sav");
	if (!file_exists(_filename)) exit;
	
	var _buffer = buffer_load(_filename);
	var _json = buffer_read(_buffer, buffer_string);
	buffer_delete(_buffer);
	
	var _loadArray = json_parse(_json);
	
	
	i = 0;

	repeat(struct.containerNum){
		
		var _inst = array_get(_loadArray, i * 2);
		var _container = array_get(_loadArray, (i * 2) + 1);
		
		var j = 0;

		with(_inst){
			repeat(_inst.containerSlots){
				ds_container[# INVITEM, j] = _container[@ (j * 4)];
				ds_container[# INVAMOUNT, j] = _container[@ ((j * 4) + 1)];
				ds_container[# INVLEVEL, j] = _container[@ ((j * 4) + 2)];
				ds_container[# INVCAP, j] = _container[@ ((j * 4) + 3)];
				
				ds_container[# INVTYPE, j] = obj_inventory.ds_item_info[# INVTYPE, ds_container[# INVITEM, j]];
				ds_container[# MAXSTACK, j] = obj_inventory.ds_item_info[# INVTYPE, ds_container[# INVITEM, j]];
				ds_container[# INVHP, j] = obj_inventory.ds_item_info[# INVTYPE, ds_container[# INVITEM, j]];
				ds_container[# INVSTAMINA, j] = obj_inventory.ds_item_info[# INVTYPE, ds_container[# INVITEM, j]];
				ds_container[# INVDAMAGE, j] = obj_inventory.ds_item_info[# INVTYPE, ds_container[# INVITEM, j]];
				ds_container[# INVDEFENCE, j] = obj_inventory.ds_item_info[# INVTYPE, ds_container[# INVITEM, j]];
				ds_container[# INVEFFECTS, j] = obj_inventory.ds_item_info[# INVTYPE, ds_container[# INVITEM, j]];
				ds_container[# INVTEMPERATURE, j] = obj_inventory.ds_item_info[# INVTYPE, ds_container[# INVITEM, j]];
				ds_container[# MAXCAP, j] = obj_inventory.ds_item_info[# INVTYPE, ds_container[# INVITEM, j]];
				
				j++;
			}
		}
		
		i++;
	}
	
}