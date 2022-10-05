function load_room(){

	var struct = 0;
	
	switch(room){
		case rm_devroom_3: struct = global.roomData.devroom_3 		break;
		case rm_devroom_b: struct = global.roomData.devroom_b		break;
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
	
	i = 0;

	repeat(struct.containerNum){
		

		
		var _inst = struct.containerData[i].ID;
		var _container = struct.containerData[i]._ds_container;
		
		with(_inst){

				
				ds_container = _container;
				
				/*
				ds_container[# INVITEM , j] = struct.containerData[i].ds_itemid;
				ds_container[# INVAMOUNT , j] = struct.containerData[i].ds_itemamount;
				ds_container[# MAXSTACK , j] = struct.containerData[i].ds_itemstack;
				ds_container[# INVTYPE , j] = struct.containerData[i].ds_itemtype;
				ds_container[# INVHP , j] = struct.containerData[i].ds_itemhp;
				ds_container[# INVSTAMINA , j] = struct.containerData[i].ds_itemstamina;
				ds_container[# INVLEVEL , j] = struct.containerData[i].ds_itemlevel;
				ds_container[# INVDAMAGE , j] = struct.containerData[i].ds_itemdamage;
				ds_container[# INVDEFENCE , j] = struct.containerData[i].ds_itemdefence;
				ds_container[# INVTEMPERATURE , j] = struct.containerData[i].ds_itemtemp;
				ds_container[# INVCAP , j] = struct.containerData[i].ds_itemcap;
				ds_container[# MAXCAP , j] = struct.containerData[i].ds_itemmaxcap;
				ds_container[# INVEFFECTS , j] = struct.containerData[i].ds_itemeffects;
				*/
				
		
			
		}
		i++;
	}
	
}