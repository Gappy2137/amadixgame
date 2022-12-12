var camw = camera_get_view_width(view_camera[0]);
var camh = camera_get_view_height(view_camera[0]);
var portw = view_get_wport(0);
var porth = view_get_hport(0);
var wratio = portw/camw;
var hratio = porth/camh;

if !surface_exists(waterSurface){
	waterSurface = surface_create(room_width * wratio, room_height * hratio);	
}

if !surface_exists(tilesurf){
	tilesurf = surface_create(room_width * wratio, room_height * hratio);	
}




var tiles = layer_tilemap_get_id(layer_get_id("Water"));

surface_set_target(tilesurf);

draw_tilemap(tiles, 0, 0);

surface_reset_target();



surface_set_target(waterSurface);

draw_surface_ext(tilesurf, 0, 0, 1 / wratio, 1 / hratio, 0, c_white, 1);

gpu_set_colorwriteenable(1, 1, 1, 0);

draw_sprite_tiled_ext(spr_water_overlay, 0, xx * wratio, yy * hratio, wratio, hratio, c_white, 0.2);




gpu_set_colorwriteenable(1, 1, 1, 1);

surface_reset_target();


draw_surface_ext(waterSurface, 0, 0, 1 / wratio, 1 / hratio, 0, c_white, 0.85);

/*

var width = GAMEWIDTH * obj_display.window_size;
var height = GAMEHEIGHT * obj_display.window_size;

var cam_x = camera_get_view_x(view_camera[0]);
var cam_y = camera_get_view_y(view_camera[0]);
var cam_scale = obj_display.window_size;

var xy = -16;

if !surface_exists(waterSurface){
	waterSurface = surface_create(room_width, room_height);	
}
if !surface_exists(overlaySurface){
	overlaySurface = surface_create((width + 16), (height + 16));	
}

var tiles = layer_tilemap_get_id(layer_get_id("Water"));


surface_set_target(overlaySurface);

draw_sprite_tiled(spr_water_overlay, 0, 0, 0);

surface_reset_target();




surface_set_target(waterSurface);

draw_tilemap(tiles, 0, 0);

var inst = obj_amadix;

var yBuffer = (inst.sprite_height - inst.sprite_yoffset)*2;

gpu_set_blendmode_ext(bm_dest_alpha, bm_inv_src_alpha);

shader_set(sh);

shader_set_uniform_f(time, current_time);
var tex = sprite_get_texture(inst.sprite_index, inst.image_index);

shader_set_uniform_f(texel, texture_get_texel_width(tex), texture_get_texel_height(tex));

draw_sprite_ext(inst.sprite_index, inst.image_index, inst.x, (inst.y + yBuffer), inst.image_xscale, -inst.image_yscale, 0, c_white, 1);

shader_reset();

gpu_set_blendmode(bm_normal);

gpu_set_colorwriteenable(1, 1, 1, 0);

draw_surface_ext(overlaySurface, xx + xy, yy + xy, 1, 1, 0, c_white, 0.2);

gpu_set_colorwriteenable(1, 1, 1, 1);

surface_reset_target();


//draw_surface_ext(overlaySurface, cam_x + xx, cam_y + yy, 1, 1, 0, c_white, 0.8);

draw_surface_ext(waterSurface, 0, 0, 1, 1, 0, c_white, 0.8);



/*
if !surface_exists(surf){
	surf = surface_create(GAMEWIDTH*obj_display.window_size, GAMEHEIGHT*obj_display.window_size);	
}
if !surface_exists(refsurf){
	refsurf = surface_create(GAMEWIDTH, GAMEHEIGHT);	
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

/*
var width = GAMEWIDTH * obj_display.window_size;
var height = GAMEHEIGHT * obj_display.window_size;

var cam_x = camera_get_view_x(view_camera[0]);
var cam_y = camera_get_view_y(view_camera[0]);
var cam_scale = obj_display.window_size;

var xy = -16;

if !surface_exists(waterSurface){
	waterSurface = surface_create(width, height);	
}
if !surface_exists(overlaySurface){
	overlaySurface = surface_create((width + 16), (height + 16));	
}

var tiles = layer_tilemap_get_id(layer_get_id("Water"));
var watertileset = tileset_main_1;


surface_set_target(overlaySurface);

draw_sprite_tiled_ext(spr_water_overlay, 0, 0, 0, 1, 1, c_white, 1);

surface_reset_target();
*/

/*

surface_set_target(waterSurface);

draw_tilemap(tiles, 0, 0);

gpu_set_colorwriteenable(1, 1, 1, 0);

draw_surface_ext(overlaySurface, xx + xy, yy + xy, 1, 1, 0, c_white, 0.2);

gpu_set_colorwriteenable(1, 1, 1, 1);

surface_reset_target();
*/
/*
shader_set(shader_ov);
	
var u_Overlay = shader_get_sampler_index(shader_ov, "u_Overlay");
var u_OverlayUV = shader_get_uniform(shader_ov, "u_OverlayUV");
var u_TilemapUV = shader_get_uniform(shader_ov, "u_SpriteUV");

var waterTex = surface_get_texture(overlaySurface);
var waterUV = texture_get_uvs(waterTex);

texture_set_stage(u_Overlay, waterTex);

shader_set_uniform_f(u_OverlayUV, waterUV[0], waterUV[1], waterUV[2], waterUV[3]);

var tilemapUV = tileset_get_uvs(watertileset);
shader_set_uniform_f(u_TilemapUV, tilemapUV[0], tilemapUV[1], tilemapUV[2], tilemapUV[3]);

draw_tilemap(tiles, 0, 0);

shader_reset();
*/




/*
if !surface_exists(refSurf){
	refSurf = surface_create(width, height);	
}

surface_set_target(refSurf);

draw_tilemap(tiles, 0, 0);

var inst = obj_amadix;

var yBuffer = (inst.sprite_height - inst.sprite_yoffset)*2;

gpu_set_blendmode_ext(bm_dest_alpha, bm_inv_src_alpha);

draw_sprite_ext(inst.sprite_index, inst.image_index, inst.x, (inst.y + yBuffer), inst.image_xscale, -inst.image_yscale, 0, c_white, 1);

gpu_set_blendmode(bm_normal);

surface_reset_target();



draw_surface_ext(refSurf, cam_x, cam_y, cam_scale, cam_scale, 0, c_white, 1);

//draw_surface_ext(waterSurface, 0, 0, 1, 1, 0, c_white, 1);
