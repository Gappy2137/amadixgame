event_inherited();

tenalarm++;
if (tenalarm > 10){
	tenalarm = 0;
}

//Fizyka i poruszanie
scr_player_movement();

//HP i energia
scr_player_stats();
global.stamina += (stamina_drain * -1);

//Animacja jedzenia i picia
scr_player_action_animation();

//Przejscie do innego pokoju
var rm_trans = instance_place(x, y, obj_room_transition);
if (rm_trans != noone){
	with (obj_gamecontrol){
		if (!doTransition){
			newRoom = rm_trans.targetRoom;	
			newX = rm_trans.targetX;
			newY = rm_trans.targetY;
			doTransition = true;
			oldfacing = obj_amadix.facing;
		}
	}
}

if (keyboard_check_pressed(vk_space)){
	item_add(-1, item.bull_energy_drink, 1);
	item_add(-1, item.lemon, 4);
	item_add(-1, item.orange, 1);
	item_add(-1, item.strawberry, 1);
}
if (keyboard_check_pressed(vk_enter)){
	item_add(-1, item.sword, 1);
	item_add(-1, item.classic_jacket, 1);
	item_add(-1, item.jeans, 1);
	item_add(-1, item.sneakers, 1);
	item_add(-1, item.panama_hat, 1);
}
if (keyboard_check_pressed(ord("X"))){
	room_speed = 5;	
}
if (keyboard_check_pressed(ord("C"))){
	room_speed = 60;	
}
if (keyboard_check(ord("O"))){
	global.stamina -= 0.1;
}
if (keyboard_check(ord("P"))){
	global.stamina += 0.1;
}

depth = -(bbox_bottom - (sprite_height - yorigin));