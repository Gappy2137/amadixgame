if (_trigNow){
	
	if instance_exists(obj_amadix){
		
		global.inCutscene = true;
		
		
		
		var _cts = cutsceneID;
		var _x = cutsceneX;
		var _y = cutsceneY;
		var _invis = invisArray;
		var stay = amadixStayInPlace;
		
		obj_cutscene_controller._cutsceneID = _cts;
		obj_cutscene_controller._cutsceneX = _x;
		obj_cutscene_controller._cutsceneY = _y;
		obj_cutscene_controller._invisArray = _invis;
		obj_cutscene_controller._amadixStayInPlace = amadixStayInPlace;
		obj_cutscene_controller.alarm[0] = 1;
		
	}
	
	_trigNow = false;	
}

