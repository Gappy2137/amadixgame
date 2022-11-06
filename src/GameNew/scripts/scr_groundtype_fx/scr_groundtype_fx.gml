function scr_groundtype_fx(){
	
	//Definicja kolizji z typem podloza
	var dirt_light = collision_rectangle(bbox_left + 4, bbox_bottom - 1, bbox_right - 4, bbox_bottom, obj_groundtype_dirt_light16, true, true);
	var dirt_dark = collision_rectangle(bbox_left + 4, bbox_bottom - 1, bbox_right - 4, bbox_bottom, obj_groundtype_dirt_dark16, true, true);
	
	var myID = id;
	var flag = false;
	
	if (groundFxTimer == 0){
		flag = true;
	}else{
		flag = false;	
	}
	
	
	if (flag) && !( (hsp == 0) && (vsp == 0) ){
		
		if (dirt_light){
			
			var FX = instance_create_layer(x + random_range(-6, 6), y + yorigin + 2 + random_range(-4, 2), "Instances", obj_smoke_fx);
			
			with (FX){
				entity = myID;
				_sprite = spr_basicdirt_smoke;
				_anim = true;
				_anim_frames = 3;
				type = 2;
				spd = random_range(0.2, 0.5);
				xscale = random_range(0.5, 1);
				alpha = random_range(0.4, 1);
			}
			
		}else
		if (dirt_dark){
			
			var FX = instance_create_layer(x + random_range(-6, 6), y + yorigin + 2 + random_range(-4, 2), "Instances", obj_smoke_fx);
			
			with (FX){
				entity = myID;
				_sprite = spr_darkdirt_smoke;
				_anim = true;
				_anim_frames = 3;
				type = 2;
				spd = random_range(0.2, 0.5);
				xscale = random_range(0.5, 1);
				alpha = random_range(0.4, 1);
			}
			
		}
	}
	
}