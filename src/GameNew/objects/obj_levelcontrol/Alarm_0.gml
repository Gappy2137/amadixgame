if ((!is_array(depthSortedTiles)) || (array_length(depthSortedTiles) < 1)){exit;}
var i = 0;
repeat(array_length(depthSortedTiles)){
	scr_tiles_depth(depthSortedTiles[i], 16, 16, room_height);

	layer_destroy(layer_get_id(depthSortedTiles[i]));
	i++;
}
