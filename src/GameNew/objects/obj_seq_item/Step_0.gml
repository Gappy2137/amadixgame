event_inherited();
if (item_id == -1){exit;}
x_frame = item_id mod (spr_width/cell_size);

y_frame = item_id div (spr_width/cell_size);


/*
if (instance_exists(obj_amadix)){
	if (obj_amadix.actionstate != player_state_action.attacking_melee){
		instance_destroy();
	}
}