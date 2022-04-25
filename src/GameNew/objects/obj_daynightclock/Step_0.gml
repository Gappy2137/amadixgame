rot += 0.004;

if keyboard_check(vk_left){
	rot -= 1;	
	global.daycycletime -= .001;	
}
if keyboard_check(vk_right){
	rot += 1;
	global.daycycletime += .001;	
}


if rot < 0{rot = 360;}
if rot > 360{rot = 0;}

global.daycycletime = abs(rot)/360;