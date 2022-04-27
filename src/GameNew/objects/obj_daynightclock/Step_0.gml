rot += rotval;

if keyboard_check(vk_left){
	rot -= 0.5;	
}
if keyboard_check(vk_right){
	rot += 0.5;
}


if rot < 0{rot = 360;}
if rot > 360{rot = 0;}

global.daycycletime = abs(rot)/360;