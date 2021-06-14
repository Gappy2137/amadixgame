// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_draw_gui_box_stretch(sprite, _x1, _y1, _x2, _y2){
	var size = sprite_get_width(sprite)/3;
	var w = _x2 - _x1;
	var h = _y2 - _y1;
	
	//Wypelnienie
	draw_sprite_part_ext(sprite, 0, size, size, 1, 1, _x1 + size, _y1 + size, w-(size*2), h-(size*2), c_white, 1);
	
	//Katy
	
	//Lewy gorny
	draw_sprite_part(sprite, 0, 0, 0, size, size, _x1, _y1);
	//Prawy gorny
	draw_sprite_part(sprite, 0, size*2, 0, size, size, _x1+w-size, _y1);
	//Lewy dolny
	draw_sprite_part(sprite, 0, 0, size*2, size, size, _x1, _y1+h-size);
	//Prawy dolny
	draw_sprite_part(sprite, 0, size*2, size*2, size, size, _x1+w-size, _y1+h-size);
	
	//Krawedzie
	

		//Lewa krawedz
		draw_sprite_part_ext(sprite, 0, 0, size, size, 1, _x1, _y1+size, 1, h-(size*2), c_white, 1);
		//Prawa krawedz
		draw_sprite_part_ext(sprite, 0, size*2, size, size, 1, _x1+w-size, _y1+size, 1, h-(size*2), c_white, 1);
	
	

		//Gorna krawedz
		draw_sprite_part_ext(sprite, 0, size, 0, 1, size, _x1+size, _y1, w-(size*2), 1, c_white, 1);
		//Dolna krawedz
		draw_sprite_part_ext(sprite, 0, size, size*2, 1, size, _x1+size, _y1+h-size, w-(size*2), 1, c_white, 1);
	
	
	
}