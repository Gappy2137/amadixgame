function effect_exists(effectID){
	var yy = 0;
	var temp = false;
	repeat(obj_hud.maxeffects){
		if (obj_hud.effect_grid[# EF_EFFECT, yy] == effectID){
			if (!temp){
				return true;
				temp = true;	
			}	
		}else{
			yy++;	
		}
	}
}