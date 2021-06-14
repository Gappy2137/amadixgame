// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_draw_gui_box(sprite, _x1, _y1, _x2, _y2){
	var size = sprite_get_width(sprite)/3;
	var w = _x2 - _x1;
	var h = _y2 - _y1;
	var columns = w div size;
	var rows = h div size;
	
	//Katy
	
	//Lewy gorny
	draw_sprite_part(sprite, 0, 0, 0, size, size, _x1, _y1);
	//Prawy gorny
	draw_sprite_part(sprite, 0, size*2, 0, size, size, _x1+(columns * size), _y1);
	//Lewy dolny
	draw_sprite_part(sprite, 0, 0, size*2, size, size, _x1, _y1+(rows * size));
	//Prawy dolny
	draw_sprite_part(sprite, 0, size*2, size*2, size, size, _x1+(columns * size), _y1+(rows * size));
	
	//Krawedzie
	
	for (var i = 1; i < (rows); i++){
		//Lewa krawedz
		draw_sprite_part(sprite, 0, 0, size, size, size, _x1, _y1+(i * size));
		//Prawa krawedz
		draw_sprite_part(sprite, 0, size*2, size, size, size, _x1+(columns * size), _y1+(i * size));
	}
	
	for (var i = 1; i < (columns); i++){
		//Gorna krawedz
		draw_sprite_part(sprite, 0, size, 0, size, size, _x1+(i * size), _y1);
		//Dolna krawedz
		draw_sprite_part(sprite, 0, size, size*2, size, size, _x1+(i * size), _y1+(rows * size));
	}
	
	//Wypelnienie
	for (var i = 1; i < (columns); i++){
		for (var j = 1; j < (rows); j++){
			draw_sprite_part(sprite, 0, size, size, size, size, _x1+(i * size), _y1+(j * size));
		}
	}
}