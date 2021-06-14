function item_drop(iitem, amount, move, xx, yy, zz){
	var inst = instance_create_layer(obj_amadix.x, obj_amadix.y, "Instances", obj_item);
	with (inst){
		item_num = iitem;
		item_num_amount = amount;
		x_frame = item_num mod (spr_width/cell_size);
		y_frame = item_num div (spr_width/cell_size);
		dropMove = move;
		height = zz;
		x = xx;
		y = yy;
	}
}