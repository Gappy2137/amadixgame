function container_stack(iitem, amount, level, capacity){

	var i = 0;
	var _maxslots = containerSlots;
	var _inv = ds_container;
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
				
				container_stack(iitem, reminder, level, capacity);
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
						//_a = 0;
						return 0;
						break;
					}else{
						// Jezeli nie ma wolnych slotow
						j++;
						if (j > _maxslots - 1){
							_a = am;
							return 0;
							break;
						}
					}
				}
			}
		}
	}
}