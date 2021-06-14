if (mode != 1){exit;}

if (!surface_exists(surf)){
	surf = surface_create(obj_display.ideal_width/4, obj_display.ideal_height/4);	
}

var viewX = camera_get_view_x(view_camera[0]);
var viewY = camera_get_view_y(view_camera[0]);

surface_set_target(surf);

draw_clear_alpha(c_black, 0);

draw_set_color(c_red);

draw_rectangle(0, 0, obj_display.ideal_width, obj_display.ideal_height, false);

surface_reset_target();

draw_surface_ext(surf, 0, 0, 4, 4, 0, c_white, 1);