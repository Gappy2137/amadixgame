function scr_tiles_depth(_layer, _grid_width, _grid_height, _depth_offset, _layer_height) {

	var lay_id = layer_get_id(_layer);
	var map_id = layer_tilemap_get_id(lay_id);
	var tile_id = tilemap_get_tileset(map_id);

	var grid_x = _grid_width;
	var grid_y = _grid_height;
	var depth_offset = _depth_offset;
	var i = 0;
	var dpth = 0;
	repeat(depth_offset/grid_y){
		dpth = -(i * grid_y + (16 * _layer_height));
		tiledepth_layer[i] = layer_create(dpth);
		tiledepth_tilemap[i] = layer_tilemap_create(tiledepth_layer[i], 0, 0, tile_id, room_width/grid_x, room_height/grid_y);
		i++;
	}

	if layer_tilemap_exists(lay_id,map_id){
		cy = 0;
		repeat(room_height/grid_y){
			cx = 0;
			repeat(room_width/grid_x){
				ix = tilemap_get_cell_x_at_pixel(map_id, cx, cy);
				iy = tilemap_get_cell_y_at_pixel(map_id, cx, cy);
				tile_id = tilemap_get(map_id, ix, iy);

				if layer_tilemap_exists(tiledepth_layer[cy/grid_x],tiledepth_tilemap[cy/grid_x]){
					tilemap_set_at_pixel(tiledepth_tilemap[cy/grid_x], tile_id, cx, cy);
				}
				cx += grid_x;
			}
			cy += grid_y;
		}
	}
}
