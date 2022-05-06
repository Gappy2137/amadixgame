
/*
draw_text(obj_amadix.x + 48, obj_amadix.y + 16, ammoLoaded);

draw_text(obj_amadix.x + 64, obj_amadix.y + 16, ammoExtra);

draw_text(obj_amadix.x + 48, obj_amadix.y + 32, inChamber);
*/

if (instance_exists(obj_amadix)){
	if (obj_amadix.actionstate != player_state_action.handgun){
		exit;	
	}
}

var topColor = make_color_rgb(66, 56, 11);
var bottomColor = make_color_rgb(54, 48, 14);

var bulletColor = make_color_rgb(233, 204, 72);
var emptyColor = make_color_rgb(99, 88, 22);

var bullets = obj_inventory.ds_item_all[# INVLEVEL, mag];
var bulletsLoaded = 0;



if (ammoLoaded == ammoCap + 1){
	bulletsLoaded = ammoLoaded - 1;	
}else{
	bulletsLoaded = ammoLoaded;
}

var bgWidth = (bullets * 2);

var bgX = 16;
var bgY = 254;

draw_rectangle_color(bgX, bgY, bgX + bgWidth, bgY + 3, topColor, topColor, topColor, topColor, false);
draw_rectangle_color(bgX, bgY + 3, bgX + bgWidth, bgY + 3 + 2, bottomColor, bottomColor, bottomColor, bottomColor, false);

var i = 0;

repeat(bullets * 2){
	if (i % 2 == 1){
		draw_rectangle_color(bgX + i, bgY + 1, bgX + i, bgY + 4, emptyColor, emptyColor, emptyColor, emptyColor, false);
	}
	i++;
}

i = 0;
repeat(bulletsLoaded * 2){
	if (i % 2 == 1){
		draw_rectangle_color(bgX + i, bgY + 1, bgX + i, bgY + 4, bulletColor, bulletColor, bulletColor, bulletColor, false);
	}
	i++;
}

if (ammoLoaded == ammoCap + 1){
	draw_sprite(spr_extrabullet, 0, (bgX + bgWidth/2), bgY - 4);
}

