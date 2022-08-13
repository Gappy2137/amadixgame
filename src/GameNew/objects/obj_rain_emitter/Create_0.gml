
intensity = 10;

rain = part_system_create();
part_system_depth(rain, -1000000);

part_rain = part_type_create();

part_type_sprite(part_rain, spr_rain_particle, false, false, false);
part_type_alpha3(part_rain, .1, .75, .75);
part_type_size(part_rain, .5, 1, 0, 0);
part_type_scale(part_rain, 1, random(2));
//part_type_direction(part_rain, 270, 270, 0, 0);
//part_type_orientation(part_rain, 0, 0, 0, 0, 0);
part_type_speed(part_rain, 5, 8, 0, 0);
part_type_life(part_rain, GAMESPEED / 4, GAMESPEED);

emitter_rain = part_emitter_create(rain);

alarm[0] = 1;

/*

rain = new advanced_part_system();

var cam_x = camera_get_view_x(view_camera[0]);
var cam_y = camera_get_view_y(view_camera[0]);

var view_width = camera_get_view_width(view_camera[0]);
var view_height = camera_get_view_height(view_camera[0]);

part_emitter = new advanced_part_emitter(rain, x, y, x + view_width, y + view_height, aps_shape.rectangle, aps_distr.linear);

rain_drops = new advanced_part_type();
with (rain_drops){
	part_gravity(0.1, 270);
	part_life(10, 100);
	//part_size(1, 1, 0, 0);
	part_scale(1, 1);
	part_image(spr_testr, 0, c_aqua, false, false, false);
	//part_alpha3(.5, .5, .5);
	//part_step_function(
	
	//	function(){
	//		if (chance(1)){
	//			//life = 0;	
	//		}
	//	}
	
	//);
}

*/