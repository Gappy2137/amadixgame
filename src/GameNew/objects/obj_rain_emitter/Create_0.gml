
intensity = 10;

rain = part_system_create();
part_system_depth(rain, -1000000);

part_rain = part_type_create();

part_type_sprite(part_rain, spr_rain_particle, false, false, false);
part_type_alpha3(part_rain, .1, .75, .75);
part_type_size(part_rain, .5, 1, 0, 0);
part_type_scale(part_rain, 1, random_range(1, 2));
//part_type_direction(part_rain, 270, 270, 0, 0);
//part_type_orientation(part_rain, 0, 0, 0, 0, 0);
part_type_speed(part_rain, 5, 8, 0, 0);
part_type_life(part_rain, GAMESPEED / 4, GAMESPEED);

emitter_rain = part_emitter_create(rain);

alarm[0] = 1;