switch(grid_pos){
	case 0:
		_spr = spr_player_left;
		_frame = 0;
	break;
	case 1:
		_spr = spr_player_main;
		_frame = 0;
	break;
	case 2:
		_spr = spr_player_right;
		_frame = 0;
	break;
	case 3:
		_spr = spr_player_downleft;
		_frame = 0;
	break;
	case 4:
		_spr = spr_player_down;
		_frame = 0;
	break;
	case 5:
		_spr = spr_player_downright;
		_frame = 0;
	break;
}
if ((jumping) || (falling)){
	_spr = spr_player_jump;	
	if (z > jumpval - 6){
		_frame = 1;
		frame_jump_flag = true;
		shadowSize = lerp(shadowSize, 0.6, 0.5);
	}
	if (!frame_jump_flag){
		_frame = 0;
		shadowSize = lerp(shadowSize, 0.3, 0.5);
	}else{
		if (z < jumpval - 16){
			_frame = 2;
			shadowSize = lerp(shadowSize, 0.9, 0.5);
		}
	}
}else{
	shadowSize = lerp(shadowSize, 1, 0.5);
}

draw_sprite_ext(spr_player_shadow, 0, x, y + 32, shadowSize, shadowSize, 0, c_white, shadowAlpha);
draw_sprite_ext(_spr, _frame, x, y - z, 1, 1, 0, c_white, 1);

draw_text(16, 16, grid_pos);
draw_text(16, 32, z);