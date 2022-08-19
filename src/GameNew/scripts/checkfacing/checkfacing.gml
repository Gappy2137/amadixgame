function checkFacing(obj){
	
		var xCoord = obj.bbox_left + ((obj.bbox_right - obj.bbox_left) / 2);
		var yCoord = obj.bbox_top + ((obj.bbox_bottom - obj.bbox_top) / 2);
					
		var myxCoord = bbox_left + ((bbox_right - bbox_left) / 2);
		var myyCoord = bbox_top + ((bbox_bottom - bbox_top) / 2);
	
		var angle = point_direction(myxCoord, myyCoord, xCoord, yCoord);
		if (angle > 45) && (angle <= 135){
			return index_facing.up;
		}else
		if (angle > 135) && (angle <= 225){
			return index_facing.left;
		}else
		if (angle > 225) && (angle <= 315){
			return index_facing.down;
		}else{
			return index_facing.right;
		}
}