if (instance_exists(obj_amadix)){
	if (obj_amadix.running == 2){
		if (ammoLoadedInv == 0){
			state = gunState.empty;	
		}else{
			state = gunState.standby;
			canShoot = true;
		}
		exit;
	}
}
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
	
	if (obj_gun_logic.type == 0){
		if (obj_gun_logic.ammoLoadedInv >= 1){
		
			//Usuniecie magazynku z ekwipunku i podanie jego pojemnosci
	
			ammo = item_mag_remove(obj_gun_logic.mag);
	
			//Zwrocenie magazynku z broni do ekwipunku
	
			//item_mag_add(obj_gun_logic.mag, obj_gun_logic.ammoLoaded - 1, 0);
			item_add(-1, obj_gun_logic.mag, 1, 0, obj_gun_logic.ammoLoadedInv - 1);

			obj_inventory.ds_inventory[# INVCAP, obj_inventory.mouse_slotx_second] = ammo + 1;
		
		
		}else{
	
			//Usuniecie magazynku z ekwipunku i podanie jego pojemnosci
	
			ammo = item_mag_remove(obj_gun_logic.mag);
	
			//Zwrocenie magazynku z broni do ekwipunku
	
			//item_mag_add(obj_gun_logic.mag, obj_gun_logic.ammoLoaded, 0);
			item_add(-1, obj_gun_logic.mag, 1, 0, obj_gun_logic.ammoLoadedInv);
			
			obj_inventory.ds_inventory[# INVCAP, obj_inventory.mouse_slotx_second] = ammo;
		}
	}else if (obj_gun_logic.type == 1){
		if (obj_gun_logic.ammoLoadedInv == 0){
			if (obj_gun_logic.ammoExtra >= 2){
				obj_gun_logic.ammoLoadedInv = 2;
				obj_inventory.ds_inventory[# INVCAP, obj_inventory.mouse_slotx_second] = 2;
				item_remove(obj_gun_logic.mag, 2, false);	
			}else if (obj_gun_logic.ammoExtra == 1){
				obj_gun_logic.ammoLoadedInv = 1;
				obj_inventory.ds_inventory[# INVHP, obj_inventory.mouse_slotx_second] = 1;
				item_remove(obj_gun_logic.mag, 1, false);
			}

		}else if (obj_gun_logic.ammoLoadedInv == 1){
			if (obj_gun_logic.ammoExtra >= 1){
				obj_gun_logic.ammoLoadedInv = 2;
				obj_inventory.ds_inventory[# INVCAP, obj_inventory.mouse_slotx_second] = 2;
				item_remove(obj_gun_logic.mag, 1, false);	
			}
		}
		
		
		
	}
	

}



canShoot = true;
inChamber = true;
state = gunState.standby;



shellfix = true;
