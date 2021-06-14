function scr_set_alpha(){
	shader_set(shader_alpha);
	with (obj_daycycle) {shader_set_uniform_f(u_alpha, alpha);}
}