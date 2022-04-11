function isLooking(face){
		if (shootdir > 45) && (shootdir <= 135){
			if (face == index_facing.up) return true;
		}else
		if (shootdir > 135) && (shootdir <= 240){
			if (face == index_facing.left) return true;
		}else
		if (shootdir > 240) && (shootdir <= 300){
			if (face == index_facing.down) return true;
		}else{
			if (face == index_facing.right) return true;
		}
}