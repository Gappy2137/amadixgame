
if (instance_exists(obj_amadix)){
	with(obj_amadix){
		audio_listener_position(x, y, 0);
		audio_listener_orientation(0, 0, 0, lengthdir_x(1, dir), lengthdir_y(1, dir), 0);
	}
}