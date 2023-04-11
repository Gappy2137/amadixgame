function cullLogic(){

	if (global.pause){exit;}
	if (global.savingRoom){exit;}
	
	var _camLeft = obj_camera.camLeft;
	var _camTop = obj_camera.camTop;
	var _camRight = obj_camera.camRight;
	var _camBottom = obj_camera.camBottom;
	
	var i = 0;
	
	repeat(array_length(global.culledInstances)){
		
		var _pos = global.culledInstances[@ i];
		
		var _cull =   !((_pos[1] < _camRight)
					 && (_pos[2] < _camBottom)
					 && (_pos[3] > _camLeft)
					 && (_pos[4] > _camTop));
					 
		if (!_cull){
			
			instance_activate_object(_pos[0]);
			_pos[0].active = true;
			array_delete(global.culledInstances, i--, 1);
			
		}
		
		i++;
		
	}
	
	i = 0;

	repeat(array_length(global.partiallyCulledInstances)){
		
		var _pos = global.partiallyCulledInstances[@ i];
		
		var _cull =   !((_pos[1] < _camRight)
					 && (_pos[2] < _camBottom)
					 && (_pos[3] > _camLeft)
					 && (_pos[4] > _camTop));
					 
		if (!_cull){
			
			instance_activate_object(_pos[0]);
			_pos[0].active = true;
			array_delete(global.partiallyCulledInstances, i--, 1);
			
		}
		
		i++;
		
	}
}