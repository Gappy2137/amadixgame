function effect_add(effectID, duration, amplifier){
	var yy = 0;
	var temp = false;
	var time = 0;
	if (!temp){
		repeat(obj_hud.maxeffects){
			if (obj_hud.effect_grid[# EF_EFFECT, yy] == effect.none){
				if (!temp){
					obj_hud.effect_grid[# EF_EFFECT, yy] = effectID;
					obj_hud.effect_grid[# EF_DURATION, yy] = (duration * room_speed);
					obj_hud.effect_grid[# EF_AMPLIFIER, yy] = amplifier;
					obj_hud.effect_grid[# EF_TIMER, yy] = time;
					effect_at(effectID, amplifier);
					temp = true;
				}
			}else{
				if (obj_hud.effect_grid[# EF_EFFECT, yy] == effectID){
					if (amplifier >= obj_hud.effect_grid[# EF_AMPLIFIER, yy]){
						if (!temp){
							obj_hud.effect_grid[# EF_AMPLIFIER, yy] = amplifier;
							obj_hud.effect_grid[# EF_DURATION, yy] = (duration * room_speed);
							obj_hud.effect_grid[# EF_TIMER, yy] = time;
							effect_at(effectID, amplifier);
							temp = true;
						}
					}else{
						if (!temp){
							var temp_dur = obj_hud.effect_grid[# EF_DURATION, yy];
							var temp_amp = obj_hud.effect_grid[# EF_AMPLIFIER, yy];
							obj_hud.effect_grid[# EF_DURATION, yy] = temp_dur;
							obj_hud.effect_grid[# EF_TIMER, yy] = time;
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