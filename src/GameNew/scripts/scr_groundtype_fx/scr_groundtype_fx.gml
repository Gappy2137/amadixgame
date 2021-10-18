function scr_groundtype_fx(){
	
	//Definicja kolizji z typem podloza
	var dirt_light = collision_rectangle(bbox_left + 4, bbox_bottom - 1, bbox_right - 4, bbox_bottom, obj_groundtype_dirt_light16, true, true);
	
	var flag = false;
	
	if (tenalarm == 10){
		flag = true;
	}else{
		flag = false;	
	}
	
		if (dirt_light){
			if (flag) && (scr_playerPressingKeys()){
				var FX = instance_create_layer(x + random_range(-4, 4), y + yorigin + 2, "Instances", obj_smoke_fx);
				with (FX){
					_sprite = spr_basicdirt_smoke;
					_anim = true;
					_anim_frames = 3;
					type = 2;
					spd = 0.2;
				}
			}
		}else{
		
		}
	
}