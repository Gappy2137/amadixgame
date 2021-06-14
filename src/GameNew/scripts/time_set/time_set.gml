function time_set(hour, minute){
	if (instance_exists(obj_daynightclock)){
		obj_daynightclock.rot = ((hour/24)*360)+((minute/60)*15);
	}
}