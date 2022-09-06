function instance_place_3d(_x, _y, _z, obj){
	var _height = zheight;
	
	var xyMeeting = instance_place(_x, _y, obj);
	
	var zMeeting = false;
	
	if (xyMeeting){
		zMeeting = rectangle_in_rectangle(
		0,
		xyMeeting.zaxis,
		1,
		xyMeeting.zaxis - xyMeeting.zheight,
		0,
		_z,
		1,
		_z - zheight
		);
	}
	
	if (xyMeeting && zMeeting){
		return obj.id;	
	}else{
		return noone;	
	}
}