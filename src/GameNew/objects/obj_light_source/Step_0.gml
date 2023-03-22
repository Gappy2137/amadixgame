var new_scale	= lerp(scale_change_start, scale_change_target, scale_change_timer/scale_change_speed);
image_xscale	= new_scale;
image_yscale	= new_scale;
scale_change_timer++;


if (caveLight){
	var curveAsset = curve_lights_out;
	var curvePos = global.daycycletime;

	curvePos = global.daycycletime;

	var curveStruct = animcurve_get(curveAsset);
	var curveChannel = animcurve_get_channel(curveStruct, "alphaval");

	alpha = animcurve_channel_evaluate(curveChannel, curvePos);
}


