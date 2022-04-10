
x = obj_amadix.x;
y = obj_amadix.y;

if (reloading){
	canShoot = false;	
}
if (shooting){
	canReload = false;	
}
if (obj_amadix.actionstate != player_state_action.handgun){
	canShoot = false;
	canReload = false;
	shooting = false;
	reloading = false;
}else if (!reloading) && (ammoLoaded != 0) & (!shooting){
	canShoot = true;	
}
if (!reloading) && (!shooting) && (ammoLoaded < ammoCap) && (ammoExtra != 0){
	canReload = true;
}


if (type == 0){
	if (mouse_check_button_pressed(mb_left)){
		if ((ammoLoaded != 0) && (canShoot)){
			
			//Shoot
			var xx = obj_amadix.x + lengthdir_x(16, obj_amadix.shootdir);
			var yy = obj_amadix.y + 16 + lengthdir_y(16, obj_amadix.shootdir);
			var bullet = instance_create_layer(xx, yy, "Instances", obj_bullet_shot);
			with (bullet){
				spd = 1;
				angle = obj_amadix.shootdir;
			}
			
			shooting = true;
			canShoot = false;
			alarm[0] = 10;
			ammoLoaded--;
		}
	}
}
if (canReload){
	if (keyboard_check_pressed(ord("R"))){
		canShoot = false;
		canReload = false;
		reloading = true;
		shooting = false;
		
		
		
		alarm[1] = reloadTime;
	}
}
