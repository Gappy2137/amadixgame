


switch(type){
	case 0:
	
	break;
	case 1:
	
	break;
	case 2:
		curve_alpha_pos += 0.1;
		x += (player_sign * spd);
		accel += 0.1;
		y -= spd * accel;
	break;
}

var _curve_alpha = animcurve_get(curve_alpha);
var _channel = animcurve_get_channel(_curve_alpha, "alp");

var _alpha = animcurve_channel_evaluate(_channel, curve_alpha_pos);

alpha = _alpha;

if (alpha == 0){
	instance_destroy();	
}