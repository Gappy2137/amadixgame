if (canBeHurtByPlayer){
	if (instance_exists(obj_damage)){
		var damageSource = instance_place(x, y, obj_damage);

		if (damageSource){
			if (damageSource.source == obj_amadix)
			&& (damageSource.damageType == damageTypeE.melee){
				var amadixFacing = obj_amadix.facing;
				
				//event_user(10);
				
				switch (amadixFacing){
					case index_facing.down:
						hitangle = approach(hitangle, 25 + randomWindPattern, acc*2);
					break;
					case index_facing.left:
						hitangle = approach(hitangle, 25 + randomWindPattern, acc*2);
					break;
					case index_facing.right:
						hitangle = approach(hitangle, -25 - randomWindPattern, acc*2);
					break;
					case index_facing.up:
						hitangle = approach(hitangle, -25 - randomWindPattern, acc*2);
					break;
				}
			}
		}
	}
}

alarm[5] = 5;