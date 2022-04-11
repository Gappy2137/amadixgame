
x = obj_amadix.x;
y = obj_amadix.y;

if (state == gunState.reloading){
	canShoot = false;	
}

if (state == gunState.shooting){
	canReload = false;	
}

if (obj_amadix.actionstate != player_state_action.handgun){
	canShoot = false;
	canReload = false;
}else if (state != gunState.reloading) && (ammoLoaded != 0) & (state != gunState.shooting){
	canShoot = true;
}

if (state != gunState.reloading) && (state != gunState.shooting) && 
	(ammoLoaded < ammoCap) && (ammoExtra != 0){
	canReload = true;
}

//Czy komora jest pusta
if (ammoLoaded == 0) && (state != gunState.shooting) && (state != gunState.reloading){
	state = gunState.empty;
}

//Czy jest w stanie gotowosci do strzalu
if (state != gunState.reloading) && (state != gunState.shooting) && (state != gunState.empty){
	state = gunState.standby;
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
			
			state = gunState.shooting;
			canShoot = false;
			alarm[0] = shootingTime;
			ammoLoaded--;
		}
	}
}
if (canReload){
	if (keyboard_check_pressed(ord("R"))){
		
		canShoot = false;
		canReload = false;
		state = gunState.reloading;

		alarm[1] = reloadTime;
	}
}
