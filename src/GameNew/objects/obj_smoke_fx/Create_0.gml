event_inherited();

_sprite = -1;
_anim = 0;
xscale = 1;
yscale = 1;
rot = 0;
col = c_white;
alpha = 1;

type = 0;

curve_alpha = curve_smoke_fx_alpha_fade;
curve_alpha_pos = 0;

////////////////////
//type
//0 - znikanie w miejscu
//1 - 360 stopni
//2 - podloze

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