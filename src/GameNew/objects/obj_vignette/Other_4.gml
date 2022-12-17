if (global.weather != weather.drizzle)
&& (global.weather != weather.rain)
&& (global.weather != weather.heavy_rain)
&& (global.weather != weather.storm)
&& (global.weather != weather.storm_incoming)
&& (global.weather != weather.heavy_storm){
	edge = 1.6;
	edgeTo = 1.6;
}else{
	edge = edgeTo;	
	
	alarm[0] = 1;
}



/*
ready = false;
edge = edgeTo;
_fx_tint = fx_create("_filter_vignette");
fx_set_parameter(_fx_tint, "g_VignetteEdges", [edgeTo, edge2]);
fx_set_parameter(_fx_tint, "g_VignetteSharpness", 1);
fx_set_parameter(_fx_tint, "g_VignetteTexture", vSprite);
layer_set_fx("FXLAYER_1", _fx_tint);