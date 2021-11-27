main_x = 192;
main_y = 32;

_spr = spr_enemy_stand;
_frame = 0;
_frame_spd = 0;

enum enemy_anim{
	still			= 0,
	stand_anim		= 1,
	hurt_1			= 2,
	hurt_2			= 3,
	hurt_3			= 4,
	attack_right	= 5,
	attack_all		= 6,
	death			= 7
}

anim_state = enemy_anim.stand_anim;