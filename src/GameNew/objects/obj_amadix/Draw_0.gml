if (playerVisible){
	scr_draw_player(x, y, z);
}


//draw_rectangle(bbox_left,bbox_top,bbox_right,bbox_bottom,true);

draw_text(x + 16, y + 16, state);
draw_text(x + 16, y + 24, actionstate);
draw_text(x + 16, y + 32, hands_index);
draw_text(x + 16, y + 40, torso_index);
draw_text(x + 16, y + 48, oneStepEvent[2]);

event_inherited();