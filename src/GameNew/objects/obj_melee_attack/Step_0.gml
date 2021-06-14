animation_frame += animation_speed;

if animation_frame > 7.9{
	animation_frame = 0;
	animation_speed = 0;
}

if instance_exists(obj_amadix){
	if (obj_amadix.actionstate != player_state_action.attacking_melee){
		instance_destroy();	
	}
}
