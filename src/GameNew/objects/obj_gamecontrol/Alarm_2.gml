


if (instance_exists(obj_fog_fx)){
	obj_fog_fx.depth = DEPTH_FOG;	
}

if (layer_exists(layer_get_id("FXLAYER_1"))){
	layer_depth(layer_get_id("FXLAYER_1"), DEPTH_LAYERFX_1);
}
if (layer_exists(layer_get_id("FXLAYER_2"))){
	layer_depth(layer_get_id("FXLAYER_2"), DEPTH_LAYERFX_2);
}
if (layer_exists(layer_get_id("FXLAYER_3"))){
	layer_depth(layer_get_id("FXLAYER_3"), DEPTH_LAYERFX_3);
}


if (layer_exists(layer_get_id("FGLAYER_1"))){
	layer_depth(layer_get_id("FGLAYER_1"), DEPTH_FOREGROUND_1);
}
if (layer_exists(layer_get_id("FGLAYER_2"))){
	layer_depth(layer_get_id("FGLAYER_2"), DEPTH_FOREGROUND_2);
}
if (layer_exists(layer_get_id("FGLAYER_3"))){
	layer_depth(layer_get_id("FGLAYER_3"), DEPTH_FOREGROUND_3);
}