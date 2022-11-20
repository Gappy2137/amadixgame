

fx_set_parameter(_fx_tint, "g_VignetteEdges", [edge, edge2]);

if (!ready){exit;}

if (!fade){
	if (!inrange(edge, edgeTo - 0.1, edgeTo + 0.1, true)){
		edge = lerp(edge, edgeTo, 0.05);
	}
}else{
	if inrange(edge, edgeVal - 0.1, edgeVal + 0.1, true){
		layer_clear_fx("FXLAYER_1");
		instance_destroy();	
	}else{
		edge = lerp(edge, edgeVal, 0.05);
	}
}
