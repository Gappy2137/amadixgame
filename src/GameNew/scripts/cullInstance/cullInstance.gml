function cullInstance(_id){
	
	if (_id == obj_amadix) exit;

	with (_id){
	
		var pad = 4;
	
		var _left = x - sprite_xoffset - pad;
		var _top = y - sprite_yoffset - pad;
		var _right = _left + sprite_width + (pad * 2);
		var _bottom = _top + sprite_height + (pad * 2);
		
		var _camLeft = obj_camera.camLeft;
		var _camTop = obj_camera.camTop;
		var _camRight = obj_camera.camRight;
		var _camBottom = obj_camera.camBottom;
		
		var _cull =   !((_left < _camRight)
					 && (_top < _camBottom)
					 && (_right > _camLeft)
					 && (_bottom > _camTop));
	
		if (_cull){
			
			var _cullArray = global.culledInstances;
			var _partCullArray = global.partiallyCulledInstances;
			
			if (cull == 1){
				
				var i = 0, _contains_id = false;
				
				repeat(array_length(_partCullArray)) {if (_partCullArray[@ i][@ 0] == _id) _contains_id = true; i++;}
			
				active = false;
				
				if (!_contains_id)
					array_push(_partCullArray, [_id, _left, _top, _right, _bottom]);
			
			}else if (cull == 2){
			
				var i = 0, _contains_id = false;
				
				repeat(array_length(_cullArray)) {if (_cullArray[@ i][@ 0] == _id) _contains_id = true; i++;}
			
				active = false;
				instance_deactivate_object(_id);
			
				if (!_contains_id)
					array_push(_cullArray, [_id, _left, _top, _right, _bottom]);
			
			}
		
		}
	
	}

}