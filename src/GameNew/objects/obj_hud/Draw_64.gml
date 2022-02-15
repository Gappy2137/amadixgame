depth = -1;
//Rysuj maks rdzen zdrowia
draw_circle_segment(hp_x + 16, hp_y + 16, global.maxhp, global.maxhp, hpCoreColor, 18, 0.5);

//Rysuj rdzen zdrowia
draw_circle_segment(hp_x + 16, hp_y + 16, global.hp, global.maxhp, hpCoreColor, 18, 1);


//Rysuj GUI zdrowia
draw_sprite_ext(spr_health_hud_2, 0, hp_x + 16, hp_y + 16, .25, .25, 0, c_white, 1);

draw_sprite_ext(spr_health_hud_2, 1, hp_x + 16, hp_y + 16, .25, .25, 0, c_white, 1);

//Rysuj maks rdzen energii
draw_circle_segment(stamina_x + 16, stamina_y + 16, global.maxstamina, global.maxstamina, staminaCoreColor, 18, 0.5);

//Rysuj rdzen energii
draw_circle_segment(stamina_x + 16, stamina_y + 16, global.stamina, global.maxstamina, staminaCoreColor, 18, 1);


//Rysuj GUI energii
draw_sprite_ext(spr_health_hud_2, 0, stamina_x + 16, stamina_y + 16, .25, .25, 0, c_white, 1);

draw_sprite_ext(spr_health_hud_2, 2, stamina_x + 16, stamina_y + 16, .25, .25, 0, c_white, 1);

//Rysuj efekty
var i = 0;
repeat(maxeffects){
	var ef = -1;
	var amp = 0;
	if (effect_grid[# EF_AMPLIFIER, i] == 1){amp = c_green;}
	if (effect_grid[# EF_AMPLIFIER, i] == 2){amp = c_yellow;}
	if (effect_grid[# EF_AMPLIFIER, i] == 3){amp = c_red;}
	if (effect_grid[# EF_EFFECT, i] == effect.speed_ef){ef = 1;}
	if (effect_grid[# EF_EFFECT, i] == effect.stuffed){ef = 2;}
	if (effect_grid[# EF_EFFECT, i] == effect.regeneration){ef = 3;}
	
	if (effect_grid[# EF_DURATION, i] - effect_grid[# EF_TIMER, i]){
		draw_sprite_ext(spr_health_hud_2, 0, effect_x, effect_y + (24 * i), .177, .177, 0, c_white, .5);
		draw_circle_segment(effect_x, effect_y + (24 * i), effect_grid[# EF_DURATION, i] - effect_grid[# EF_TIMER, i], effect_grid[# EF_DURATION, i], amp, 10, .5);
		draw_sprite_ext(spr_hud_effects, ef, effect_x, effect_y + (24 * i), .5, .5, 0, c_white, 1);
	}
	i++;
}
////////////////////////
//Rysuj menu ekwipunku
if (obj_inventory.show_inventory) && (!obj_inventory.show_slots){
	draw_set_alpha(0.5);
	draw_rectangle_color(-8, -8, obj_display.ideal_width + 8, obj_display.ideal_height + 8, c_black, c_black, c_black, c_black, false);
	draw_set_alpha(1);
	draw_sprite_ext(obj_inventory.spr_eq_back, 1, obj_inventory.backUI_x, obj_inventory.backUI_y, obj_inventory.scale, obj_inventory.scale, 0, c_white, 1);
}


if (show_hud == hud.inv) || (show_hud == hud.crafting) || (show_hud == hud.player) || (show_hud == hud.map) || (show_hud == hud.journal) || (show_hud == hud.options){
	draw_sprite(spr_eq_menu, 0, hud_slot_x, hud_slot_y + hud_slot_y_active[0]);
	draw_sprite(spr_eq_menu, 1, hud_slot_x + 24 + 12, hud_slot_y + hud_slot_y_active[1]);
}

if (obj_inventory.show_inventory) && (!obj_inventory.show_slots){
	draw_sprite_ext(obj_inventory.spr_eq_back, 0, obj_inventory.backUI_x, obj_inventory.backUI_y, obj_inventory.scale, obj_inventory.scale, 0, c_white, 1);
	draw_sprite_ext(obj_inventory.spr_eq_back, 2, obj_inventory.backUI_x, obj_inventory.backUI_y, obj_inventory.scale, obj_inventory.scale, 0, c_white, 1);
}
////////////////////////