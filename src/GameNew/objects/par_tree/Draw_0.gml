event_inherited();

finalalpha = alpha;

//draw_sprite_ext(sprite_index, 0, x, y, 1, 1, finalangle, c_white, finalalpha);

if (enableWindDisplacement){
	
	gpu_set_tex_filter_ext(obj_weather.wind_u_distort_tex, true);
	
	shader_set(obj_weather.windShader);

	texture_set_stage(obj_weather.wind_u_distort_tex, obj_weather.windDistort_tex);
	shader_set_uniform_f(obj_weather.wind_u_time, obj_gamecontrol.refTimer);
	shader_set_uniform_f(obj_weather.wind_u_size, 1.0);
	shader_set_uniform_f(obj_weather.wind_u_strength, 0.0);

	draw_sprite_ext(sprite_index, 2, x, y, 1, 1, 0, c_white, 1);
	
	shader_reset();
	
	gpu_set_tex_filter(false);

}

if (itemOverlay != -1){
	draw_sprite_ext(itemOverlay, itemOverlayState, x, y, 1, 1, finalangle, c_white, finalalpha);
}

/*
shadowOriginX = 0;
shadowOriginY = 0;
shadowStyle = spr_shadow_big;
shadowAlpha = 0.6;

shadowEnable = true;