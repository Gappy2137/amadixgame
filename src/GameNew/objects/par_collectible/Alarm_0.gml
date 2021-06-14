var sol = instance_create_layer(bbox_left, bbox_top, "Instances", obj_solid1);
if (cancollide){
	var btop = sprite_get_bbox_top(sprite_index);
	var bleft = sprite_get_bbox_left(sprite_index);
	var bright = sprite_get_bbox_right(sprite_index);
	var bbottom = sprite_get_bbox_bottom(sprite_index);
	with (sol){
		var wi = (bright - bleft);
		var he = (bbottom - btop);
		image_xscale = wi;
		image_yscale = he;
	}
}else{
	if instance_exists(sol){
		instance_destroy(sol);	
	}
}