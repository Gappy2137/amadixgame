/// @description instance_place_slope(x, y)
function instance_place_slope(argument0, argument1) {

	var collision = par_slope;
	if (collision.cancollide == true){
		instance_place(argument0, argument1, collision);
	}


}
