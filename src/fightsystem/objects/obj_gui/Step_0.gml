if instance_exists(obj_fight_control){
	var ct = obj_fight_control;
	if (ct.phase == 1){
		showgui = true;
	}else{
		showgui = false;	
	}
}

if (!animDone){
	alpha += 0.03;
	animY = lerp(animY, 0, .15);
	if (animY <= 1){
		animY = 0;
		alpha = 1;
		canpress = true;
		animDone = true;
	}
}

key_right = keyboard_check_pressed(ord("D"));
key_left = keyboard_check_pressed(ord("A"));
key_up = keyboard_check_pressed(ord("W"));
key_down = keyboard_check_pressed(ord("S"));
key_accept = keyboard_check_pressed(vk_space);


if (choice > 2){
	choice = 0;	
}
if (choice < 0){
	choice = 2;	
}

if (key_right) && (canpress){
	pressed = true;
	choice--;
}
if (key_left) && (canpress){
	pressed = true;
	choice++;
}

if (pressed){
	canpress = false;
	pressTimer--;
	if (pressTimer <= 0){canpress = true; pressed = false; pressTimer = pressTreshold;}
}

if (animDone){
	switch(choice){
		case 0:
			x_m[0] = lerp(x_m[0], x_ch, accel);
			y_m[0] = lerp(y_m[0], y_ch, accel);
			scale[0] = lerp(scale[0], 1, accel);
		
			x_m[1] = lerp(x_m[1], x_ch - 32, accel);
			y_m[1] = lerp(y_m[1], y_ch - 32, accel);
			scale[1] = lerp(scale[1], .75, accel);
		
			x_m[2] = lerp(x_m[2], x_ch + 32, accel);
			y_m[2] = lerp(y_m[2], y_ch - 32, accel);
			scale[2] = lerp(scale[2], .75, accel);
			
			if (key_accept){
				
			}
		break;
		case 1:
			x_m[0] = lerp(x_m[0], x_ch + 32, accel);
			y_m[0] = lerp(y_m[0], y_ch - 32, accel);
			scale[0] = lerp(scale[0], .75, accel);
		
			x_m[1] = lerp(x_m[1], x_ch, accel);
			y_m[1] = lerp(y_m[1], y_ch, accel);
			scale[1] = lerp(scale[1], 1, accel);
		
			x_m[2] = lerp(x_m[2], x_ch - 32, accel);
			y_m[2] = lerp(y_m[2], y_ch - 32, accel);
			scale[2] = lerp(scale[2], .75, accel);
		break;
		case 2:
			x_m[0] = lerp(x_m[0], x_ch - 32, accel);
			y_m[0] = lerp(y_m[0], y_ch - 32, accel);
			scale[0] = lerp(scale[0], .75, accel);
		
			x_m[1] = lerp(x_m[1], x_ch + 32, accel);
			y_m[1] = lerp(y_m[1], y_ch - 32, accel);
			scale[1] = lerp(scale[1], .75, accel);
		
			x_m[2] = lerp(x_m[2], x_ch, accel);
			y_m[2] = lerp(y_m[2], y_ch, accel);
			scale[2] = lerp(scale[2], 1, accel);
		break;
	}
}
