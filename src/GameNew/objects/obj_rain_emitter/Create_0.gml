
intensity = 10;

rainSprite = spr_rain_particle;
rainDropSprite = spr_raindrop;
sizeMin = 0.5;
sizeMax = 1;
scaleMin = 1;
scaleMax = 2;
speedMin = 5;
speedMax = 8;

rainDrop = part_system_create();
part_system_depth(rainDrop, -1000000);

part_rainDrop = part_type_create();
part_type_sprite(part_rainDrop, rainDropSprite, true, true, false);
part_type_alpha3(part_rainDrop, .5, .4, .1);
part_type_size(part_rainDrop, 0.5, 1, 0, 0);
part_type_life(part_rainDrop, GAMESPEED / 6, GAMESPEED / 4);


rain = part_system_create();
part_system_depth(rain, -1000000);

part_rain = part_type_create();

part_type_sprite(part_rain, rainSprite, false, false, false);
part_type_alpha3(part_rain, .1, .75, .75);
part_type_size(part_rain, sizeMin, sizeMax, 0, 0);
part_type_scale(part_rain, 1, random_range(scaleMin, scaleMax));
part_type_speed(part_rain, speedMin, speedMax, 0, 0);
part_type_life(part_rain, GAMESPEED / 4, GAMESPEED);


emitter_rain = part_emitter_create(rain);
emitter_rainDrop = part_emitter_create(rainDrop);

alarm[0] = 2;
alarm[1] = 5;