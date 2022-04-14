if !(instance_exists(obj_fighter) && instance_exists(obj_enemy)){exit;}


switch(phase){
	case 0:
	break;
	
	case 1:
		player_canfight = false;
		enemy_canfight = false;
		
		obj_fighter.canmove = false;
		obj_fighter.canjump = false;
		
	break;
}