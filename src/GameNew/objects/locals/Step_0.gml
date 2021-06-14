if (keyboard_check_pressed(ord("L"))){
	langvar++;
	if (langvar > 2){langvar = 0;}
	switch(langvar){
		case 0:
			global.language = lang.english;
			langfix = true;
			alarm[0] = 1;
			with (obj_inventory){
				alarm[0] = 1;
			}
		break;
		case 1:
			global.language = lang.polish;
			langfix = true;
			alarm[0] = 1;
			with (obj_inventory){
				alarm[0] = 1;
			}
		break;
		case 2:
			global.language = lang.custom;
			langfix = true;
			alarm[0] = 1;
			with (obj_inventory){
				alarm[0] = 1;
			}
		break;
	}
}