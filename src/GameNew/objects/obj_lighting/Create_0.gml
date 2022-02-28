renderer = new BulbRenderer(
	light_ambient,
	BULB_MODE.SOFT_BM_ADD,
	true);
	
function setAmbientColor(_color){
	obj_lighting.light_ambient = _color;
}