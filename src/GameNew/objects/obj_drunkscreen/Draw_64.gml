

if !surface_exists(surf){
	surf = surface_create(room_width, room_height);	
}


surface_set_target(surf);

//shader_set(shader_blur);

draw_surface_ext(application_surface, xx, yy, xscale, yscale, angle, c_white, alpha);

//shader_reset();

surface_reset_target();

if (global.alcoholPoisoning >= 10){
	draw_surface_ext(surf, 0, 0, 1/obj_display.window_size, 1/obj_display.window_size, 0, c_white, 1);
}
