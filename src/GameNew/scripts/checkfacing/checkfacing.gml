function checkFacing(obj){
		var angle = point_direction(x, y, obj.x, obj.y);
		if (angle > 45) && (angle <= 135){
			return index_facing.up;
		}else
		if (angle > 135) && (angle <= 240){
			return index_facing.left;
		}else
		if (angle > 240) && (angle <= 300){
			return index_facing.down;
		}else{
			return index_facing.right;
		}
}