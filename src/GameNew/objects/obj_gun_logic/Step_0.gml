if (!instance_exists(obj_amadix)){instance_destroy();}


// Nie mozna strzelac jezeli przeladowujemy albo nie mamy w reku broni
if (state == gunState.reloading)
|| (state == gunState.reloading_empty)
|| (obj_amadix.actionstate != player_state_action.handgun){
	canShoot = false;	
}

// Nie mozna przeladowac jezeli strzelamy albo nie mamy w reku broni
if (state == gunState.shooting)
|| (obj_amadix.actionstate != player_state_action.handgun)
|| (ammoExtra == 0){
	canReload = false;	
}

// Jezeli nie przeladowujemy 
// i w komorze jest naboj
// i nie strzelamy 
// - mozemy strzelac
if (state != gunState.reloading)
&& (state != gunState.reloading_empty)
&& (inChamber == true)
&& (state != gunState.shooting)
&& (obj_amadix.actionstate == player_state_action.handgun){
	canShoot = true;
}

// Jezeli nie przeladowujemy
// i nie strzelamy
// i zaladowana amunicja < maks amunicji w magazynku
// i mamy dodatkowa amunicje
if (state != gunState.reloading)
&& (state != gunState.reloading_empty)
&& (state != gunState.shooting)
&& (ammoLoaded < ammoCap)
&& (ammoExtra != 0)
&& (obj_amadix.actionstate == player_state_action.handgun){
	canReload = true;
}

//Czy komora jest pusta
if (ammoLoaded == 0)
&& (state != gunState.shooting)
&& (state != gunState.reloading)
&& (state != gunState.reloading_empty){
	state = gunState.empty;
	inChamber = false;
}

//Czy jest w stanie gotowosci do strzalu
if (state != gunState.reloading) 
&& (state != gunState.reloading_empty)
&& (state != gunState.shooting)
&& (state != gunState.empty){
	state = gunState.standby;
}

if (type == 0){
	if (mouse_check_button_pressed(mb_left)){
		if ((ammoLoaded != 0) && (canShoot) && (inChamber)){
			
			obj_amadix.anim_frame_action = 0;
			
			#region FX
			
			audio_play_sound(soundSHOOT, 10, false);
			
			//Shoot
			var xx = obj_amadix.x + lengthdir_x(16, obj_amadix.shootdir);
			var yy = obj_amadix.y + 16 + lengthdir_y(16, obj_amadix.shootdir);
			var bullet = instance_create_layer(xx, yy, "Instances", obj_bullet_shot);
			with (bullet){
				_sprite = spr_bullet_shot;
				spd = 20;
				angle = obj_amadix.shootdir + random_range(-6, 6);
			}
			
			var fx_xx = obj_amadix.x + lengthdir_x(12, obj_amadix.shootdir);
			var fx_yy = obj_amadix.y + 12 + lengthdir_y(13, obj_amadix.shootdir);
			var muzzleflash = instance_create_layer(fx_xx, fx_yy, "Instances", obj_smoke_fx);
			with (muzzleflash){
				type = 0;
				_sprite = spr_muzzle_flash;
				rot = obj_amadix.shootdir;
				_anim = true;
				_anim_frames = 1;
				_anim_speed = 0.3;
				if (obj_amadix.facing == index_facing.up){
					depth = obj_amadix.depth + 1;	
				}else{
					depth = obj_amadix.depth - 1;	
				}
			}
			repeat(irandom_range(4,6)){
				var smoke = instance_create_layer(fx_xx, fx_yy, "Instances", obj_smoke_fx);
				with (smoke){
					type = 3;
					_sprite = spr_gun_smoke_spiked;
					rot = obj_amadix.shootdir + random_range(-10, 10);
					_anim = true;
					_anim_frames = 4;
					_anim_speed = random_range(0.2, 0.6);
					spd = random_range(0.8, 3);
					alpha = random_range(0.35, 0.6);
					if (obj_amadix.facing == index_facing.up){
						depth = obj_amadix.depth + 1;	
					}else{
						depth = obj_amadix.depth - 1;	
					}
					
				
				}
			}
		
			
			var shell_xx = obj_amadix.x + lengthdir_x(7, obj_amadix.shootdir);
			var shell_yy = obj_amadix.y + 32 + lengthdir_y(10, obj_amadix.shootdir);
			var shell = instance_create_layer(shell_xx, shell_yy, "Instances", obj_particle);
			with(shell){
				_sprite = spr_gun_shell;
				_anim_frame = choose(0, 1);
				spd = random_range(1, 1.5);
				height = 20;
				direction = irandom_range(45, 135);
				if (obj_amadix.facing == index_facing.up){
					depth = obj_amadix.depth + 1;	
				}else{
					depth = obj_amadix.depth - 1;
				}
			}
		
			#endregion

			state = gunState.shooting;
			canShoot = false;
			alarm[0] = shootingTime;
			ammoLoaded--;
		}
	}
	
	if (!smokeflag){
			var heat_x = obj_amadix.x + lengthdir_x(13, obj_amadix.shootdir);
			var heat_y = obj_amadix.y + 16 + lengthdir_y(16, obj_amadix.shootdir);
			var heatsmoke = instance_create_layer(heat_x, heat_y, "Instances", obj_smoke_fx);
			with (heatsmoke){
				type = 4;
				_sprite = spr_gun_smoke;
				rot = 0;
				_anim = true;
				_anim_frames = 9;
				_anim_speed = 0.2;
				if (obj_amadix.facing == index_facing.up){
					depth = obj_amadix.depth + 1;	
				}else{
					depth = obj_amadix.depth - 1;	
				}
			}
			smokeflag = true;
	}
	
}else if (type == 1){
	if (mouse_check_button_pressed(mb_left)){
		if ((ammoLoaded != 0) && (canShoot) && (inChamber)){
			
			obj_amadix.anim_frame_action = 0;
			
			#region FX
			
			audio_play_sound(soundSHOOT, 10, false);
			
			//Shoot
			
			var xx = obj_amadix.x + lengthdir_x(16, obj_amadix.shootdir);
			var yy = obj_amadix.y + 16 + lengthdir_y(16, obj_amadix.shootdir) + random_range(-1, 3);
			repeat(6){
				var bullet = instance_create_layer(xx, yy, "Instances", obj_bullet_shot);
				with (bullet){
					_sprite = spr_shotgun_shell_shot;
					spd = 20;
					angle = obj_amadix.shootdir + random_range(-20, 20);
				}
			}
			
			var fx_xx = obj_amadix.x + lengthdir_x(16, obj_amadix.shootdir);
			var fx_yy = obj_amadix.y + 12 + lengthdir_y(13, obj_amadix.shootdir);
			var muzzleflash = instance_create_layer(fx_xx, fx_yy, "Instances", obj_smoke_fx);
			with (muzzleflash){
				type = 0;
				_sprite = spr_muzzle_flash;
				rot = obj_amadix.shootdir;
				_anim = true;
				_anim_frames = 1;
				_anim_speed = 0.3;
				if (obj_amadix.facing == index_facing.up){
					depth = obj_amadix.depth + 1;	
				}else{
					depth = obj_amadix.depth - 1;	
				}
			}
			repeat(irandom_range(4,6)){
				var smoke = instance_create_layer(fx_xx, fx_yy, "Instances", obj_smoke_fx);
				with (smoke){
					type = 3;
					_sprite = spr_gun_smoke_spiked;
					rot = obj_amadix.shootdir + random_range(-10, 10);
					_anim = true;
					_anim_frames = 4;
					_anim_speed = random_range(0.2, 0.6);
					spd = random_range(0.8, 3);
					alpha = random_range(0.35, 0.6);
					if (obj_amadix.facing == index_facing.up){
						depth = obj_amadix.depth + 1;	
					}else{
						depth = obj_amadix.depth - 1;	
					}
					
				
				}
			}
		
			#endregion

			state = gunState.shooting;
			canShoot = false;
			alarm[0] = shootingTime;
			ammoLoaded--;
		}
	}
	
	if (!smokeflag){
			var heat_x = obj_amadix.x + lengthdir_x(16, obj_amadix.shootdir);
			var heat_y = obj_amadix.y + 16 + lengthdir_y(16, obj_amadix.shootdir);
			var heatsmoke = instance_create_layer(heat_x, heat_y, "Instances", obj_smoke_fx);
			with (heatsmoke){
				type = 4;
				_sprite = spr_gun_smoke;
				rot = 0;
				_anim = true;
				_anim_frames = 9;
				_anim_speed = 0.2;
				if (obj_amadix.facing == index_facing.up){
					depth = obj_amadix.depth + 1;	
				}else{
					depth = obj_amadix.depth - 1;	
				}
			}
			smokeflag = true;
	}
}
if (canReload){
	if (input_check_pressed("reload")){
		
		canShoot = false;
		canReload = false;
		
		obj_amadix.anim_frame_action = 0;
		
		if (ammoLoaded == 0){
			state = gunState.reloading_empty;	
			alarm[1] = reloadTimeEmpty;
		}else{
			state = gunState.reloading;
			alarm[1] = reloadTime;
		}
	}
}
with (obj_amadix){
	switch(itemeaten){
		case item.m1911:
		if (obj_gun_logic.state == gunState.reloading)
		|| (obj_gun_logic.state == gunState.reloading_empty){
			if (floor(anim_frame_action) == 1){
				if (!audio_is_playing(obj_gun_logic.soundMAGOUT))
				audio_play_sound(obj_gun_logic.soundMAGOUT, 10, false);
				}
			if (floor(anim_frame_action) == 6){
				if (!audio_is_playing(obj_gun_logic.soundMAGIN))
				audio_play_sound(obj_gun_logic.soundMAGIN, 10, false);}
		}
			if (obj_gun_logic.state == gunState.reloading_empty){
				if (floor(anim_frame_action) == 11){
				if (!audio_is_playing(obj_gun_logic.soundBOLT))
				audio_play_sound(obj_gun_logic.soundBOLT, 10, false);}
			}
		break;
		
		case item.sawedoff:
		if (obj_gun_logic.state == gunState.reloading)
		|| (obj_gun_logic.state == gunState.reloading_empty){
			if (floor(anim_frame_action) == 3){
				if (!audio_is_playing(obj_gun_logic.soundMAGOUT))
				audio_play_sound(obj_gun_logic.soundMAGOUT, 10, false);
				
				
				if (obj_gun_logic.shellfix){
					with (obj_gun_logic){
						repeat(ammoCap - ammoLoaded){
							var shell_xx = obj_amadix.x + lengthdir_x(7, obj_amadix.shootdir);
							var shell_yy = obj_amadix.y + 32 + lengthdir_y(10, obj_amadix.shootdir);
							var shell = instance_create_layer(shell_xx, shell_yy, "Instances", obj_particle);
							with(shell){
								_sprite = spr_gun_shell;
								_anim_frame = choose(0, 1);
								spd = random_range(1, 1.5);
								height = 20;
								direction = irandom_range(45, 135);
								if (obj_amadix.facing == index_facing.up){
									depth = obj_amadix.depth + 1;	
								}else{
									depth = obj_amadix.depth - 1;
								}
							}
						}
					}
					obj_gun_logic.shellfix = false;
				}
				
				
				}
			if (floor(anim_frame_action) == 8){
				if (!audio_is_playing(obj_gun_logic.soundMAGIN))
				audio_play_sound(obj_gun_logic.soundMAGIN, 10, false);}
		}
			if (obj_gun_logic.state == gunState.reloading_empty){
				if (floor(anim_frame_action) == 11){
				if (!audio_is_playing(obj_gun_logic.soundBOLT))
				audio_play_sound(obj_gun_logic.soundBOLT, 10, false);}
			}
		break;
	}
}

if (state == gunState.shooting){
	heat += 0.1;	
}else{
	heat = lerp(heat, 0, 0.005);
}
