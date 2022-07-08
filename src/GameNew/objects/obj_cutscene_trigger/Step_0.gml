if (_trigNow){
	
	
	
	if instance_exists(obj_amadix){
		
		global.inCutscene = true;
		
		_cutscene = layer_sequence_create("CUTSCENES", cutsceneX, cutsceneY, cutsceneID);
		//layer_sequence_play(_cutscene);
		
	}
	
	_trigNow = false;	
}

if (layer_sequence_is_finished(_cutscene)){
	layer_sequence_destroy(_cutscene);
	global.inCutscene = false;
}