
if (!surface_exists(surf)){
	surf = surface_create(room_width, room_height);	
}

surface_set_target(surf);

draw_sprite(spr_jar_small, 0, 0, 0);

surface_reset_target();

draw_surface(surf, xx, yy);

draw_text(obj_amadix.x, obj_amadix.y - 16, string(camera_get_view_x(view_camera[0])));

draw_text(obj_amadix.x, obj_amadix.y, string(camera_get_view_x(view_camera[0]) + obj_display.ideal_width*obj_display.window_size + 16));