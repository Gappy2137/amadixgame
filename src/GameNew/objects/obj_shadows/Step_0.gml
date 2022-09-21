if (keyboard_check(ord("B"))){
	skewX -= 0.5;	
}
if (keyboard_check(ord("N"))){
	skewX += 0.5;	
}

time = global.daycycletime;
curvePos = time;

var _curve = animcurve_get(curve);
var _channel = animcurve_get_channel(_curve, "time");

var _val = animcurve_channel_evaluate(_channel, curvePos);

skewX = _val;


var _curve2 = animcurve_get(curve2);
var _channel2 = animcurve_get_channel(_curve2, "time");

var _val2 = animcurve_channel_evaluate(_channel2, curvePos);

shadowAlpha = _val2;