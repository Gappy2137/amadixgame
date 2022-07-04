sol = instance_create_layer(bbox_left, bbox_top, "Instances", obj_solid1);
with (sol){
	image_xscale = (bbox_right - bbox_left);
	image_yscale = (bbox_bottom - bbox_top);
}