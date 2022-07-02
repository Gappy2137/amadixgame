if (obj_display.zoomtrigger){exit;}

var width = GAMEWIDTH * obj_display.window_size * xscale;
var height = GAMEHEIGHT * obj_display.window_size * yscale;

var scaled_x = (((GAMEWIDTH * xscale) - GAMEWIDTH) / 1.75);
var scaled_y = (((GAMEHEIGHT * yscale) - GAMEHEIGHT) / 1.75);

var cam_x = camera_get_view_x(view_camera[0]);
var cam_y = camera_get_view_y(view_camera[0]);

if !surface_exists(surf){
	surf = surface_create(width, height);
}


surface_set_target(surf);

//gpu_set_fog(1, 1, 1, 1);

shader_set(shader_blur);
	
var uniform_texture_size = shader_get_uniform(shader_blur, "texture_size");

shader_set_uniform_f(uniform_texture_size, width, height);

var uniform_window_size = shader_get_uniform(shader_blur, "window_size");

shader_set_uniform_f(uniform_window_size, obj_display.window_size, obj_display.window_size);



draw_surface_ext(application_surface, xx, yy, 1, 1, 0, c_white, 1);

//draw_surface_ext(obj_daycycle.application_surface, xx, yy, 1, 1, 0, c_white, 1);

//draw_surface_ext(application_surface, xx, yy, 1, 1, 0, c_white, 1);


shader_reset();

//gpu_set_fog(0, 0, 0, 0);

surface_reset_target();

if (global.alcoholPoisoning >= 5){
	

	
	draw_surface_ext(surf, cam_x - scaled_x + 3, cam_y - scaled_y, xscale/obj_display.window_size, yscale/obj_display.window_size, 0, c_white, alpha);
	
	
}
