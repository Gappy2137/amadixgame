

if (_frame_spd != 0){
	_frame += _frame_spd;
	if (_frame > sprite_get_number(_spr)){
		_frame = 0;
	}
}else{
	_frame = 0;	
}

switch(anim_state){
	case enemy_anim.still:
		_spr = spr_enemy_stand;
		_frame = 0;
		_frame_spd = 0;
	break;
	case enemy_anim.stand_anim:
		_spr = spr_enemy_stand;
		_frame_spd = 0.08;
	break;
	case enemy_anim.hurt_1:
		_spr = spr_enemy_hurt;
		_frame = 0;
		_frame_spd = 0;
	break;
	case enemy_anim.hurt_2:
		_spr = spr_enemy_hurt;
		_frame = 1;
		_frame_spd = 0;
	break;
	case enemy_anim.hurt_3:
		_spr = spr_enemy_hurt;
		_frame = 2;
		_frame_spd = 0;
	break;
	case enemy_anim.attack_all:
		_spr = spr_enemy_attack_all;
		_frame = 0;
		_frame_spd = 0;
	break;
	case enemy_anim.attack_right:
		_spr = spr_enemy_attack_right;
		_frame = 0;
		_frame_spd = 0;
	break;
	case enemy_anim.death:
		_spr = spr_enemy_hurt;
		_frame = 0;
		_frame_spd = 0;
	break;
}