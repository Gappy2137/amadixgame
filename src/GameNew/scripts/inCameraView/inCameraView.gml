function inCameraView(){
		var pad = 4;
	
		var _left = x - sprite_xoffset - pad;
		var _top = y - sprite_yoffset - pad;
		var _right = _left + sprite_width + (pad * 2);
		var _bottom = _top + sprite_height + (pad * 2);
		
		var _camLeft = obj_camera.camLeft;
		var _camTop = obj_camera.camTop;
		var _camRight = obj_camera.camRight;
		var _camBottom = obj_camera.camBottom;
		
		return   ((_left < _camRight)
			   && (_top < _camBottom)
			   && (_right > _camLeft)
			   && (_bottom > _camTop));
}