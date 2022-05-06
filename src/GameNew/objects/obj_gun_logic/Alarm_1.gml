
//var ammo = ammoCap - ammoLoaded;



/*
if (ammoExtra < ammo){
	ammoLoaded += ammoExtra;
	ammo = ammoExtra;
	ammoExtra = 0;
}else{
	ammoExtra -= ammo;
	ammoLoaded = ammoCap;
	
	if (ammoLoaded == 1){
		chamberedRound = 1;
		chambered1 = true;
		ammoLoaded = ammoCap + 1;
	}
	
}
*/

with(obj_inventory){
	
	var ammo = 0;
	
	if (type == 0){
		if (obj_gun_logic.ammoLoaded >= 1){
		
			//Usuniecie magazynku z ekwipunku i podanie jego pojemnosci
	
			ammo = item_mag_remove(obj_gun_logic.mag);
	
			//Zwrocenie magazynku z broni do ekwipunku
	
			item_mag_add(obj_gun_logic.mag, obj_gun_logic.ammoLoaded - 1);

			obj_gun_logic.ammoLoaded = ammo + 1;
		
		
		}else{
	
			//Usuniecie magazynku z ekwipunku i podanie jego pojemnosci
	
			ammo = item_mag_remove(obj_gun_logic.mag);
	
			//Zwrocenie magazynku z broni do ekwipunku
	
			item_mag_add(obj_gun_logic.mag, obj_gun_logic.ammoLoaded);

			obj_gun_logic.ammoLoaded = ammo;
		}
	}else if (type == 1){
		if (ammoLoaded == 0){
			if (ammoExtra >= 2){
				obj_gun_logic.ammoLoaded = 2;
				item_remove(obj_gun_logic.mag, 2, false);	
			}else if (ammoExtra == 1){
				obj_gun_logic.ammoLoaded = 1;
				item_remove(obj_gun_logic.mag, 1, false);		
			}

		}else if (ammoLoaded == 1){
			if (ammoExtra >= 1){
				obj_gun_logic.ammoLoaded = 2;
				item_remove(obj_gun_logic.mag, 1, false);	
			}
		}
	}
	

}



canShoot = true;
inChamber = true;
state = gunState.standby;
