
if (doTransition){
	if (room != newRoom){
		alpha += 0.08;
		if (alpha >= 1){room_goto(newRoom);}
	} else {
		alpha -= 0.08;
		if (alpha <= 0){doTransition = false;}
	}
	
	draw_set_alpha(alpha);
	draw_rectangle_color(0, 0, guiWidth, guiHeight, c_black, c_black, c_black, c_black, false);
	draw_set_alpha(1);
}
//draw_text(64, 96, hours + ":" + minutes);

//draw_text(64, 96, global.alcoholPoisoning);

var in = instance_count;

draw_text(48, 48, in);