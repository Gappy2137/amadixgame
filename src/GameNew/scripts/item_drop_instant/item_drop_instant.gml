function item_drop_instant(iitem, amount){
	var inst = instance_create_layer(obj_amadix.x, obj_amadix.y, "Instances", obj_item);
	with (inst){
		item_num = iitem;
		item_num_amount = amount;
		x_frame = item_num mod (spr_width/cell_size);
		y_frame = item_num div (spr_width/cell_size);
		dropMove = false;
		invisframe = true;
		timesinceground = 0;
	}
}