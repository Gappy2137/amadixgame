/*
if !surface_exists(surf){
	surf = surface_create(obj_display.ideal_width*obj_display.window_size, obj_display.ideal_height*obj_display.window_size);	
}
if !surface_exists(refsurf){
	refsurf = surface_create(obj_display.ideal_width, obj_display.ideal_height);	
}

var tiles = layer_tilemap_get_id(layer_get_id("Water"));

surface_set_target(refsurf);

draw_sprite_tiled(spr_water_overlay, 0, 0, 0);

surface_reset_target();



surface_set_target(surf);

draw_tilemap(tiles, 0, 0);

gpu_set_colorwriteenable(1, 1, 1, 0);

draw_surface_ext(refsurf, 0, 0, 1, 1, 0, c_white, 0.3);

gpu_set_colorwriteenable(1, 1, 1, 1);

surface_reset_target();

var cx = camera_get_view_x(view_camera[0]);
var cy = camera_get_view_y(view_camera[0]);

draw_surface_ext(refsurf, cx + xx, cy + yy, 1, 1, 0, c_white, 0.8);
draw_surface_ext(surf, 0, 0, 1, 1, 0, c_white, 0.8);

*/


if !surface_exists(surf){
	surf = surface_create(room_width, room_height);	
}
if !surface_exists(refsurf){
	refsurf = surface_create(room_width, room_height);	
}
if !surface_exists(tilesurf){
	tilesurf = surface_create(room_width, room_height);	
}
if !surface_exists(surf_reflection){
	surf_reflection = surface_create(room_width, room_height);	
}
var tiles = layer_tilemap_get_id(layer_get_id("Water"));


surface_set_target(refsurf);

draw_sprite_tiled(spr_water_overlay, 0, xx, yy);

surface_reset_target();


surface_set_target(surf);

draw_tilemap(tiles, 0, 0);

surface_reset_target();



surface_set_target(surf);

gpu_set_colorwriteenable(1, 1, 1, 0);

draw_surface_ext(refsurf, 0, 0, 1, 1, 0, c_white, 0.2);

gpu_set_colorwriteenable(1, 1, 1, 1);

surface_reset_target();




surface_set_target(surf_reflection);

draw_tilemap(tiles, 0, 0);

var inst = obj_amadix;

var yBuffer = (inst.sprite_height - inst.sprite_yoffset)*2;

gpu_set_blendmode_ext(bm_dest_alpha, bm_inv_src_alpha);

draw_sprite_ext(inst.sprite_index, inst.image_index, inst.x, (inst.y + yBuffer), inst.image_xscale, -inst.image_yscale, 0, c_white, 1);

gpu_set_blendmode(bm_normal);

surface_reset_target();



draw_surface_ext(surf_reflection, 0, 0, 1, 1, 0, c_white, 1);

draw_surface_ext(surf, 0, 0, 1, 1, 0, c_white, 0.8);
