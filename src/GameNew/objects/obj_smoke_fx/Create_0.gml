event_inherited();

_sprite = -1;
_anim = false;
xscale = 1;
yscale = 1;
rot = 0;
col = c_white;
alpha = 1;

_anim_frame = 0;
_anim_frames = 0;
_anim_speed = 0.08;

type = 0;

curve_alpha = curve_smoke_fx_alpha_fade;
curve_alpha_pos = 0;

////////////////////
//type
//0 - znikanie w miejscu
//1 - 360 stopni
//2 - podloze
//3 - dir
//4 - bez zanikania

spd = 0;
accel = 0;

player_sign = 0;
if (instance_exists(obj_amadix)){
	if (obj_amadix.hsp != 0){
		player_sign = sign(obj_amadix.hsp);
	}else{
		player_sign = 1;	
	}
	
}