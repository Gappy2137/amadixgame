// Depth sorting
if ((!is_array(depthSortedTiles)) || (array_length(depthSortedTiles) < 1)){}else{
	var i = 0;
	repeat(array_length(depthSortedTiles)){
		if (depthSortedTiles[i] == -1){
			exit;
		}
		if (depthSortedTilesHeight[i] == -1)
			depthSortedTilesHeight[i] = 1;
		scr_tiles_depth(depthSortedTiles[i], 16, 16, room_height, depthSortedTilesHeight[i]);

		layer_destroy(layer_get_id(depthSortedTiles[i]));
		i++;
	}
}

cx = 0;
cy = 0;
ix = 0;
iy = 0;

// Decals
/*
var i = 0;
repeat(array_length(decalOverlayTiles)){
	var j = layer_get_id(decalOverlayTiles[i]);	
	//layer_script_begin(j, layer_blend_add);
	//layer_script_end(j, layer_blend_normal);
	i++;
}
*/


/*
if ((!is_array(decalOverlayTiles)) || (array_length(decalOverlayTiles) < 1)){}else{
	
	var i = 0;
	var xx = room_width/16;
	var yy = room_height/16;
	
	repeat(array_length(decalOverlayTiles)){
		var ovLayer_id = layer_get_id(decalOverlayTiles[i]);
		var ovMap_id = layer_tilemap_get_id(ovLayer_id);
		var ovTile_id = tilemap_get_tileset(ovMap_id);

		var tiledepth_layer = layer_create(layer_get_depth(ovLayer_id));
		var tiledepth_tilemap = layer_tilemap_create(tiledepth_layer, 0, 0, ovTile_id, xx, yy);
			
		
		if (layer_tilemap_exists(ovLayer_id, ovMap_id)){
			cy = 0;
			repeat(yy){
				cx = 0;
				repeat(xx){
					gpu_set_blendmode(bm_add);
					ix = tilemap_get_cell_x_at_pixel(ovMap_id, cx, cy);
					iy = tilemap_get_cell_y_at_pixel(ovMap_id, cx, cy);
					ovTile_id = tilemap_get(ovMap_id, ix, iy);
					draw_tilemap(tiledepth_tilemap, cx, cy);
					//tilemap_set_at_pixel(tiledepth_tilemap, ovTile_id, cx, cy);
					gpu_set_blendmode(bm_normal);
					
					cx += 16;
				}
				cy += 16;
			}
		}
		layer_destroy(layer_get_id(decalOverlayTiles[i]));
		i++;
		
	}
	
	
	
}