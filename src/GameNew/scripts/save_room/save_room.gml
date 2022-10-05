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
		
		var _inst = instance_find(par_container, i);
		var _ds = _inst.ds_container;
		
		//var _tempContainer = -1;
		
		//_tempContainer = ds_grid_create(ds_grid_width(_ds) , ds_grid_height(_ds));
		//ds_grid_set_grid_region(_tempContainer, _ds,
		//	0,
		//	0,
		//	ds_grid_width(_ds),
		//	ds_grid_height(_ds),
		//	0,
		//	0
		//);
	
		struct.containerData[i] = {
			ID : _inst.id,
			_ds_container : _ds
		}
		
		//ds_grid_destroy(_tempContainer);
		//_tempContainer = -1;
		
		i++;
	}
	
	
	
	i = 0;
	
	switch(room){
		case rm_devroom_3: global.roomData.devroom_3 = struct		break;
		case rm_devroom_b: global.roomData.devroom_b = struct		break;
	}
	
	
	
	global.savingRoom = false;
}