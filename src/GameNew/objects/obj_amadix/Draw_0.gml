if (playerVisible){
	scr_draw_player(x, y, z);
}


//draw_rectangle(bbox_left,bbox_top,bbox_right,bbox_bottom,true);
/*
draw_sprite(head_index, 0, x + 32, y - 32);

draw_sprite(torso_index, 0, x + 32, y - 16);

draw_sprite(hands_index, 0, x + 32, y);

draw_sprite(legs_index, 0, x + 32, y + 16);

draw_sprite(arms_index, 0, x + 32, y + 32);

draw_sprite(arms2_index, 0, x + 32, y + 48);
*/

draw_text(x + 16, y, state);
draw_text(x + 16, y + 8, actionstate);
event_inherited();