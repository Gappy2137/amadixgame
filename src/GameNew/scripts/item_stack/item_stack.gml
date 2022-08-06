function item_stack(iitem, amount, level, capacity){

	var i = 0;
	var _maxslots = obj_inventory.inv_slots - 4;
	var _inv = obj_inventory.ds_inventory;
	var itemall = obj_inventory.ds_item_all;
	var am = amount;

	
	
	repeat(_maxslots){
		// Sprawdz czy istnieje przedmiot i czy ilosc na slocie != maxstack
		if (_inv[# INVITEM, i] == iitem) && (_inv[# INVAMOUNT, i] != itemall[# MAXSTACK, iitem]){
			// Czy ilosc dodawana i ilosc na slocie > maxstack slotu
			if (_inv[# INVAMOUNT, i] + am > itemall[# MAXSTACK, iitem]){
				
				// Reszta
				var reminder = (_inv[# INVAMOUNT, i] + am) - itemall[# MAXSTACK, iitem];
				
				// Na slocie zmieniamy ilosc na maxstack
				_inv[# INVAMOUNT, i] = itemall[# MAXSTACK, iitem];
				
				item_stack(iitem, reminder, level, capacity);
				return 0;
				break;
			}else{
				// Dodaj przedmiot
				_inv[# INVAMOUNT, i] += amount;
				return 0;
				break;
			}
		}else{
			i++;
			// Jezeli nie znaleziono przedmiotu w calym ekwipunku
			if (i > _maxslots - 1){
				var j = 0;
				repeat(_maxslots){
					if (_inv[# INVITEM, j] == item.none){
						// Jezeli istnieje pusty slot dodaj przedmiot
						_inv[# INVITEM, j] = iitem;
						_inv[# INVAMOUNT, j] = amount;
						_inv[# INVTYPE, j] = itemall[# INVTYPE, iitem];
						_inv[# MAXSTACK, j] = itemall[# MAXSTACK, iitem];
						_inv[# INVHP, j] = itemall[# INVHP, iitem];
						_inv[# INVSTAMINA, j] = itemall[# INVSTAMINA, iitem];
						_inv[# INVLEVEL, j] = level;
						_inv[# INVDAMAGE, j] = itemall[# INVDAMAGE, iitem];
						_inv[# INVDEFENCE, j] = itemall[# INVDEFENCE, iitem];
						_inv[# INVEFFECTS, j] = itemall[# INVEFFECTS, iitem];
						_inv[# INVTEMPERATURE, j] = itemall[# INVTEMPERATURE, iitem];
						_inv[# INVCAP, j] = capacity;
						_inv[# MAXCAP, j] = itemall[# MAXCAP, iitem];
						return 0;
						break;
					}else{
						// Jezeli nie ma wolnych slotow upusc przedmiot
						j++;
						if (j > _maxslots - 1){
							item_drop(iitem, am, level, capacity, true, obj_amadix.x, obj_amadix.y, 5);
							return 0;
							break;
						}
					}
				}
			}
		}
	}
	
	
	/*
		var i = 0;
		var flag = false;
		repeat(slots){
			if (!flag){
				if (ready){
					if (_inv[# INVITEM, i] == item.none){
						_inv[# INVITEM, i] = iitem;
						_inv[# INVAMOUNT, i] = amount;
						_inv[# INVTYPE, i] = itemall[# INVTYPE, iitem];
						_inv[# MAXSTACK, i] = itemall[# MAXSTACK, iitem];
						_inv[# INVHP, i] = itemall[# INVHP, iitem];
						_inv[# INVSTAMINA, i] = itemall[# INVSTAMINA, iitem];
						_inv[# INVLEVEL, i] = level;
						_inv[# INVDAMAGE, i] = itemall[# INVDAMAGE, iitem];
						_inv[# INVDEFENCE, i] = itemall[# INVDEFENCE, iitem];
						_inv[# INVEFFECTS, i] = itemall[# INVEFFECTS, iitem];
						_inv[# INVTEMPERATURE, i] = itemall[# INVTEMPERATURE, iitem];
						_inv[# INVCAP, i] = capacity;
						_inv[# MAXCAP, i] = itemall[# MAXCAP, iitem];
						flag = true;
					}else{
						i++;	
					}
				}else{
					if (_inv[# INVITEM, i] == iitem) && !(_inv[# INVAMOUNT, i] == itemall[# MAXSTACK, iitem]){
						if (_inv[# INVAMOUNT, i] + am > itemall[# MAXSTACK, iitem]){
							am = (_inv[# INVAMOUNT, i] + amount) - itemall[# MAXSTACK, iitem];
							_inv[# INVAMOUNT, i] = itemall[# MAXSTACK, iitem];
							item_stack(iitem, am, 0, false, level, capacity);
							flag = true;
						}else{
							_inv[# INVAMOUNT, i]+=amount;
							flag = true;
						}
					}else{
						i++;
						if (i >= slots){
							item_stack(iitem, am, 0, true, level, capacity);
						}
					}
				}
			}
		}
	*/
}