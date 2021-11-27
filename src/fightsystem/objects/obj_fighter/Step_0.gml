
key_right = keyboard_check(ord("D"));
key_left = keyboard_check(ord("A"));
key_up = keyboard_check(ord("W"));
key_down = keyboard_check(ord("S"));
key_jump = keyboard_check_pressed(vk_space);

if ((key_right) || (key_left) || (key_up) || (key_down)){
	ispressingkeys = true;
}else{
	ispressingkeys = false;
}

if (canmove){
	
	hor_keyPress = key_right - key_left;
	
	if !((key_right) || (key_left)){
		x = lerp(x, main_x, deccel);
		grid_pos = 1;
	}
	if ((key_right) || (key_left)){
		x = lerp(x, main_x + (hor_keyPress*grid_offset), accel);
		grid_pos = hor_keyPress + 1;
	}
	if (key_down){
		y = lerp(y, main_y + grid_offset, accel);
		if !((key_right) || (key_left)){grid_pos = 4;}else{grid_pos = hor_keyPress + 4;}
	}else if (!key_down){
		y = lerp(y, main_y, deccel);
	}
}


if (canjump){
	if (key_jump){
		grounded = false;
		jumping = true;
		canjump = false;
	}
}

if (z >= jumpval - 1){
	jumping = false;
	falling = true;
	canjump = false;
}
if (jumping){
	z = lerp(z, jumpval, grav_accel + 0.06);	
}else{
	z = lerp(z, 0, grav_accel);
}
if (z < 8){
	z = 0;
	falling = false;
}
if (z == 0){
	if (!key_jump){
		canjump = true;	
	}
	grounded = true;
}else{
	grounded = false;
}