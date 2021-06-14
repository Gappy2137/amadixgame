
if !surface_exists(surf){
	surf = surface_create(room_width, room_height);	
}
if !surface_exists(refsurf){
	refsurf = surface_create(room_width, room_height);	
}


surface_set_target(refsurf);

draw_sprite_tiled(spr_water_overlay, 0, xx, yy);

surface_reset_target();



surface_set_target(surf);

var tiles = layer_tilemap_get_id(layer_get_id("Water"));
draw_tilemap(tiles, 0, 0);

gpu_set_colorwriteenable(1, 1, 1, 0);

draw_surface_ext(refsurf, 0, 0, 1, 1, 0, c_white, 0.25);

gpu_set_colorwriteenable(1, 1, 1, 1);

surface_reset_target();

draw_surface_ext(surf, 0, 0, 1, 1, 0, c_white, 1);



/*
if !surface_exists(surf){
	surf = surface_create(obj_display.ideal_width/4, obj_display.ideal_height/4);	
}
if !surface_exists(refsurf){
	refsurf = surface_create(obj_display.ideal_width/4, obj_display.ideal_height/4);	
}

var vx = obj_camera.x;
var vy = obj_camera.y;
var scale = scr_camera_get_scale();

surface_set_target(refsurf);

draw_sprite_tiled(spr_water_overlay, 0, xx, yy);

surface_reset_target();



surface_set_target(surf);

var tiles = layer_tilemap_get_id(layer_get_id("Water"));
draw_tilemap(tiles, vx, vy);

gpu_set_colorwriteenable(1, 1, 1, 0);

draw_surface_ext(refsurf, vx, vy, 1, 1, 0, c_white, 1);

gpu_set_colorwriteenable(1, 1, 1, 1);

surface_reset_target();

/*
if surface_exists(application_surface){
	draw_surface_ext(application_surface, vx, vy, 1/scale, 1/scale, 0, c_white, 1);
}

surface_resize(surf, obj_display.ideal_width, obj_display.ideal_height);

draw_surface_ext(surf, vx, vy, 1, 1, 0, c_white, 1);

*/