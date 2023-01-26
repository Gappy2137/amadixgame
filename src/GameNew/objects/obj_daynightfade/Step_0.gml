time = global.daycycletime;
curvePos = time;
curvePosC = time;

var _curve = animcurve_get(curve);
var _channel = animcurve_get_channel(_curve, "time");

var _val = animcurve_channel_evaluate(_channel, curvePos);

if (obj_levelcontrol.cave){
	
	alpha = 0.01;
	
}else{
	
	alpha = _val;
	
}


var _curveC = animcurve_get(curveC);
var _channel_r = animcurve_get_channel(_curveC, "r");
var _channel_g = animcurve_get_channel(_curveC, "g");
var _channel_b = animcurve_get_channel(_curveC, "b");

var _r = animcurve_channel_evaluate(_channel_r, curvePosC);
var _g = animcurve_channel_evaluate(_channel_g, curvePosC);
var _b = animcurve_channel_evaluate(_channel_b, curvePosC);

color = make_color_rgb(_r, _g, _b);