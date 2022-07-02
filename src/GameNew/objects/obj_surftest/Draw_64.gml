if (!surface_exists(surf)){
	surf = surface_create(GAMEWIDTH, GAMEHEIGHT);	
}

surface_set_target(surf);

var lay_id = layer_get_id("Water");
var map_id = layer_tilemap_get_id(lay_id);
var mask = tilemap_get_mask(map_id);

draw_tilemap(mask, 0, 0);

surface_reset_target();

draw_surface(surf, mouse_x, mouse_y);