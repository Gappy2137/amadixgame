// Auto-generated stubs for each available event.

function sequence_camera_stop(){
	with (obj_camera){
		stop = true;	
	}
}

function sequence_camera_resume(){
	with (obj_camera){
		stop = false;	
	}
}

function sequence_camera_toplayer(){
	with (obj_camera){
		if (instance_exists(obj_amadix)){
			stop = false;
			following = obj_amadix;
		}
	}
}

