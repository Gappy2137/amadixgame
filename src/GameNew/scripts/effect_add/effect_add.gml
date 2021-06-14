function effect_add(effectID, duration, amplifier, time){
	var yy = 0;
	var temp = false;
	if (!temp){
		repeat(obj_hud.maxeffects){
			if (obj_hud.effect_grid[# EFFECT, yy] == effect.none){
				if (!temp){
					obj_hud.effect_grid[# EFFECT, yy] = effectID;
					obj_hud.effect_grid[# DURATION, yy] = (duration * room_speed);
					obj_hud.effect_grid[# AMPLIFIER, yy] = amplifier;
					obj_hud.effect_grid[# TIMER, yy] = time;
					effect_at(effectID, amplifier);
					temp = true;
				}
			}else{
				if (obj_hud.effect_grid[# EFFECT, yy] == effectID){
					if (amplifier >= obj_hud.effect_grid[# AMPLIFIER, yy]){
						if (!temp){
							obj_hud.effect_grid[# AMPLIFIER, yy] = amplifier;
							obj_hud.effect_grid[# DURATION, yy] = (duration * room_speed);
							obj_hud.effect_grid[# TIMER, yy] = time;
							effect_at(effectID, amplifier);
							temp = true;
						}
					}else{
						if (!temp){
							var temp_dur = obj_hud.effect_grid[# DURATION, yy];
							var temp_amp = obj_hud.effect_grid[# AMPLIFIER, yy];
							obj_hud.effect_grid[# DURATION, yy] = temp_dur;
							obj_hud.effect_grid[# TIMER, yy] = time;
							effect_at(effectID, temp_amp);
							temp = true;
						}
						yy++;	
					}
				}
				yy++;	
			}
		}
	}
}