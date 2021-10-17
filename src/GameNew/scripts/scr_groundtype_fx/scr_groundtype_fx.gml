function scr_groundtype_fx(){
	
	//Definicja kolizji z typem podloza
	var dirt_light = collision_rectangle(bbox_left, bbox_bottom, bbox_right, bbox_bottom, obj_groundtype_dirt_light16, true, true);
	
	var treshold = 0;
	treshold++;
	if (treshold > 10){
		treshold = 0;	
	}
	
		if (dirt_light){
			var FX = instance_create_layer(x, y + bbox_bottom, "Instances", obj_rock_plain);
			with (FX){
				//_sprite = spr_rocks_plains;
				//_anim = 0;
				//type = 2;	
				//spd = 0.2;
			}
		}else{
		
		}
	
}