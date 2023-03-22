var scale = scr_camera_get_scale();
var vx = camera_get_view_x(view_camera[0]);
var vy = camera_get_view_y(view_camera[0]);

if (!surface_exists(srf_lights)) {
	srf_lights = surface_create(GAMEWIDTH, GAMEHEIGHT);
	tex_lights = surface_get_texture(srf_lights);
}

if (!surface_exists(srf_cover)) {
	srf_cover = surface_create(GAMEWIDTH, GAMEHEIGHT);
	tex_cover = surface_get_texture(srf_cover);
}

if (!surface_exists(maskSurf)){

	maskSurf = surface_create(GAMEWIDTH * scale, GAMEHEIGHT * scale);

}

if (!surface_exists(finalSurf)){

	finalSurf = surface_create(GAMEWIDTH * scale, GAMEHEIGHT * scale);

}

surface_set_target(maskSurf);

draw_clear_alpha(c_black, 0);

with (par_objectdepth){

	if (sprite_index != -1)
	&& (variable_instance_exists(id, "lightCover")){

		if (id.lightCover){
			
			draw_sprite_ext(sprite_index, anim_frame, (x - vx) * scale, (y - vy - 2) * scale, (image_xscale - 0.1) * scale, (image_yscale - 0.1) * scale, finalangle, finalblend, finalalpha);
	
			gpu_set_colorwriteenable(1, 1, 1, 0);
	
			draw_rectangle_color(0, 0, GAMEWIDTH * scale, GAMEHEIGHT * scale, c_black, c_black, c_black, c_black, false);
	
			gpu_set_colorwriteenable(1, 1, 1, 1);
			
		}
	}
}

surface_reset_target();



surface_set_target(finalSurf);

draw_clear_alpha(c_black, 0);

shader_set(shader_blur);

var uniform_texture_size = shader_get_uniform(shader_blur, "texture_size");

shader_set_uniform_f(uniform_texture_size, GAMEWIDTH * scale, GAMEHEIGHT * scale);

var uniform_window_size = shader_get_uniform(shader_blur, "window_size");

shader_set_uniform_f(uniform_window_size, scale, scale);

draw_surface_ext(maskSurf, 0, 0, 1, 1, 0, c_white, 1);

shader_reset();

surface_reset_target();


var surf = finalSurf;



surface_set_target(srf_lights);
	draw_clear(c_black);
	gpu_set_blendmode(bm_add);
	gpu_set_tex_filter(true); // optional
	
	// draw light sprites
	var lights_strength = 0.5;
	with(par_light)
		draw_sprite_ext(sprite_index, image_index, x - vx, y - vy, image_xscale, image_yscale, image_angle, image_blend, alpha * lights_strength);
	gpu_set_blendmode_ext(bm_zero,bm_inv_src_alpha);
	with(par_lightcover)
		draw_sprite_ext(sprite_index, image_index, x - vx, y - vy, image_xscale, image_yscale, image_angle, image_blend, 1);

	with (par_light){
	
		var myX = x - sprite_get_width(sprite_index)/2;
		var myY = y;
	
		var col_list = ds_list_create();
		var col_num = collision_rectangle_list(bbox_left, bbox_top, bbox_right, bbox_bottom, par_objectdepth, false, true, col_list, false);
	
		if (col_num != noone){
			var __i = 0;
			repeat(col_num){
				if (variable_instance_exists(col_list[| __i], "visible")){
					if (col_list[| __i].visible == true){
						if (col_list[| __i].y > myY){
						
							// stworz maske
					
							draw_surface_part_ext(surf, 
							(myX - vx) * scale, 
							(myY - vy) * scale,
							(sprite_get_width(sprite_index) * image_xscale) * scale,
							((sprite_get_height(sprite_index) * image_yscale) - (bbox_top - myY)) * scale,
							myX - vx, 
							myY - vy,
							1 / scale,
							1 / scale,
							c_white, col_list[| __i].finalalpha);
						
						}
					}
				}
				__i++;
			}
			ds_list_destroy(col_list);
		}
	
	}
	
	gpu_set_blendmode(bm_add);
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







/*
//draw_text(96, 96, lrp);
draw_text(96, 96 + 16, global.weather);
draw_text(96, 96 + 32, obj_weather.weatherchange);
draw_text(96, 96 + 48, con_sat_brt_mix[2]);
draw_text(96, 96 + 64, ds_daycycle_info[global.weather][key_next][5]);
*/

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