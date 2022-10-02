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
	
	repeat(_containerNum){
		
		var j = 0;
		
		var _inst = instance_find(par_container, i);
		
		repeat(_inst.containerSlots) {
			struct.containerData[i] = {
				ID : _inst.id,
				ds_itemid : _inst.ds_container[# INVITEM, j],
				ds_itemamount : _inst.ds_container[# INVAMOUNT, j],
				ds_itemstack : _inst.ds_container[# MAXSTACK, j],
				ds_itemtype : _inst.ds_container[# INVTYPE, j],
				ds_itemhp : _inst.ds_container[# INVHP, j],
				ds_itemstamina : _inst.ds_container[# INVSTAMINA, j],
				ds_itemlevel : _inst.ds_container[# INVLEVEL, j],
				ds_itemdamage : _inst.ds_container[# INVDAMAGE, j],
				ds_itemdefence : _inst.ds_container[# INVDEFENCE, j],
				ds_itemtemp : _inst.ds_container[# INVTEMPERATURE, j],
				ds_itemcap : _inst.ds_container[# INVCAP, j],
				ds_itemmaxcap : _inst.ds_container[# MAXCAP, j],
				ds_itemeffects : _inst.ds_container[# INVEFFECTS, j]
			
			}
			j++;
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