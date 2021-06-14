event_inherited();

if (invisframe){
	invistime--;
	if (invistime <= 0){
		invisframe = false;	
	}
}

if (dropMove){
	//Wyrzucony item porusza porusza sie w losowa strone z malejaca predkoscia
	
	x = lerp(x, goal_x, 0.1);
	y = lerp(y, goal_y, 0.1);
	if (abs(x - goal_x) < 1 && abs(y - goal_y) < 1){dropMove = false;}
}else{
	if (timesinceground <= 0){
		var px = obj_amadix.x;
		var py = obj_amadix.y;
		var r = 12;
	
		//Jezeli nie jestesmy w srodku kolizji z przedmiotem niech porusza sie w nasza strone
		if (!point_in_rectangle(px, py, x-r, y-r, x+r, y+r)){
			if (distance_to_point(px, py) < 32){
				x = lerp(x, px, 0.1);
				y = lerp(y, py, 0.1);
			}
		}else{
			var in = item_num;
			var in_amount = item_num_amount;
		
			with(obj_inventory){
				var picked_up = false;
			
				//Podnies przedmiot kiedy istnieje juz taki w ekwipunku
				//item_stack(in, in_amount);
				/*
				var yy = 0; repeat(inv_slots){
					if (ds_inv[# 0, yy] == in){
						ds_inv[# 1, yy] += in_amount;
						ds_inv[# 2, yy] = in_type;
						ds_inv[# 3, yy] = in_maxstack;
						ds_inv[# 4, yy] = in_hp;
						ds_inv[# 5, yy] = in_stamina;
						picked_up = true;
						break;
					}else{
						yy += 1;
					}
				}*/
			
				//Jezeli nie przypisz go do pierwszego wolnego slotu
			
				if (!picked_up){
					item_stack(in, in_amount);
					picked_up = true;
					/*
					yy = 0; repeat(inv_slots){
						if (ds_inv[# 0, yy] == item.none){
							ds_inv[# 0, yy] = in;
							ds_inv[# 1, yy] += in_amount;
							ds_inv[# 2, yy] = in_type;
							ds_inv[# 3, yy] = in_maxstack;
							ds_inv[# 4, yy] = in_hp;
							ds_inv[# 5, yy] = in_stamina;
							picked_up = true;
							break;
						}else{
							yy += 1;	
						}
					}
					*/
				}
			}
		
			if (picked_up){
				instance_destroy();	
			}
		}
	
	}
}

if (bounceCount != 0){
	if (grounded){
		bounce += (pi * bounceSpeed);
		if (bounce > pi){
			bounce -= pi;
			bounceHeight *= 0.6;
			bounceCount--;
		}
		z = sin(bounce) * bounceHeight;
	}
}else{
	z = 0;	
}
if (height <= 0){
	height = 0;
	acceleration = 0;
}else{
	acceleration += 0.1;
	height -= acceleration;
}
if (acceleration > 9){
	acceleration = 9;
}
if (height == 0){
	grounded = true;	
	timesinceground--;
	if (timesinceground <= 0){timesinceground = 0;} 
}else{
	grounded = false	
}

frict = 0.05;
if (z == 0){
	frict = .1;
}

x += lengthdir_x(spd, direction);
y += lengthdir_y(spd, direction);
if (instance_place(x, y, par_collision)){
	spd = 0;
}
spd = max(spd - frict, 0);