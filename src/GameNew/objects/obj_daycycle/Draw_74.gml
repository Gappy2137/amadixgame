var scale = scr_camera_get_scale();

if (!surface_exists(srf_lights)) {
	srf_lights = surface_create(GAMEWIDTH * scale, GAMEHEIGHT * scale);
	tex_lights = surface_get_texture(srf_lights);
}
surface_set_target(srf_lights);
	draw_clear(c_black);
	gpu_set_blendmode(bm_add);
	gpu_set_tex_filter(true); // optional
	
	// draw light sprites
	var lights_strength = 0.5;
	var vx = camera_get_view_x(view_camera[0]);
	var vy = camera_get_view_y(view_camera[0]);
	with(par_light)
		draw_sprite_ext(sprite_index, image_index, x - vx, y - vy, image_xscale, image_yscale, image_angle, image_blend, image_alpha * lights_strength);
	
	// reset GPU
	gpu_set_tex_filter(false); // optional
	gpu_set_blendmode(bm_normal);
surface_reset_target();

shader_set(shader);
shader_set_uniform_f_array(u_col, color_mix);
shader_set_uniform_f_array(u_con_sat_brt, con_sat_brt_mix);
texture_set_stage(s_lights, tex_lights);


if surface_exists(application_surface){
	draw_surface_ext(application_surface, 0, 0, 1/scale, 1/scale, 0, c_white, 1);
}
shader_reset();


draw_text(96, 96, lrp);
draw_text(96, 96 + 16, global.weather);
draw_text(96, 96 + 32, obj_weather.weatherchange);

draw_text(96, 96 + 48, con_sat_brt_mix[2]);
draw_text(96, 96 + 64, ds_daycycle_info[global.weather][key_next][5]);

//Light curve
//var curveAsset = curve_lights_out;
//var curvePos = global.daycycletime;

//curvePos = global.daycycletime;

//var curveStruct = animcurve_get(curveAsset);
//var curveChannel = animcurve_get_channel(curveStruct, "alphaval");

//var curveValue = animcurve_channel_evaluate(curveChannel, curvePos);

//gpu_set_blendmode(bm_add);
//draw_surface_ext(srf_lights, 0, 0, 1, 1, 0, c_white, 1);
//gpu_set_blendmode(bm_normal);