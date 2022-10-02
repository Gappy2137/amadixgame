if (global.inCutscene){
	

	if (stop){
		if (!layer_sequence_is_paused(currentSequenceElementID)){
			layer_sequence_pause(currentSequenceElementID);	
		}
		
		if (!instance_exists(obj_chatterbox)){
			stop = false;
		}
	}else{
		if (!layer_sequence_is_finished(currentSequenceElementID)){
			layer_sequence_play(currentSequenceElementID);	
		}
	}
	
	var _length = array_length(_invisArray);
	
	if (_length > 0){
		var _i = 0;
		repeat(_length){
			_invisArray[_i].visible = false;
			_i++;
		}
	}
	
	if (layer_sequence_is_finished(currentSequenceElementID)){
		
		if (!_amadixStayInPlace){
			if ((instance_exists(obj_amadix_cutscene)) && (instance_exists(obj_amadix))){
				obj_amadix.x = obj_amadix_cutscene.x;
				obj_amadix.y = obj_amadix_cutscene.y;
				obj_amadix.facing = obj_amadix_cutscene.facing;
			}
		}
		layer_sequence_destroy(currentSequenceElementID);
		global.inCutscene = false;
	}
}else{
	var _length = array_length(_invisArray)
	
	if (_length > 0){
		var _i = 0;
		repeat(_length){
			_invisArray[_i].visible = true;
			_i++;
		}
	}
}