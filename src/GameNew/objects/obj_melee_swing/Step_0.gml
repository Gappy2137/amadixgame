
if animation_frame > 7.9{
	animation_frame = 0;
	animation_speed = 0;
	instance_destroy();
}else{
	animation_frame += animation_speed;
}

alpha -= 0.025;

