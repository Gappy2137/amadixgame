function effect_at(effectID, amplifier){
	if instance_exists(obj_amadix){
		if (effectID == effect.speed_ef){
			if (amplifier == 1){obj_amadix.speedEffect = 0.45;}
			if (amplifier == 2){obj_amadix.speedEffect = 0.6;}
			if (amplifier == 3){obj_amadix.speedEffect = 0.75;}
		}
	}
}