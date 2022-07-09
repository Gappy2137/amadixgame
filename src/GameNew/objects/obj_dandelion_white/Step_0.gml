// Inherit the parent event
event_inherited();

if (intact){
	if (abs(angle) > 10) && (abs(angle) < 15){
		if (chance(30)){
			sprite_index = spr_dandelion_noflower;
			repeat(irandom_range(4, 8)){
				var ID = instance_create_layer(x - round(finalangle/8), y - 9 + random_range(-2, 2), "Instances", obj_smoke_fx);
				with (ID){
						_anim = false;
						_sprite = spr_dandelion_parts;
						_anim_frame = choose(2, 3, 4);
						_anim_frames = 3;
						type = 1;
						rot = random(360);
						angle = random(360);
						rotSpeed = 2;
						fadeoutSpeed = 0.005;
						spd = 0.1;
						yorigin = 8;
				}
			}
			intact = false;
		}
	}
}