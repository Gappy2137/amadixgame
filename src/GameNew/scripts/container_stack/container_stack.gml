function container_stack(iitem, amount, level, capacity, _con, _maxslots){
		var itemall = obj_inventory.ds_item_all;
		var am = amount;
		var i = 0;
		
		i = 0;
		
		repeat(_maxslots){
			// Jezeli zostal znaleziony ten sam przedmiot ktory nie ma pelnego stacka
			if (_con[# INVITEM, i] == iitem) && (_con[# INVAMOUNT, i] != itemall[# MAXSTACK, iitem]){
				// Jezeli dodajemy przedmiot ktorego ilosc bedzie przekraczac maxstack
				if (_con[# INVAMOUNT, i] + am > itemall[# MAXSTACK, iitem]){
					
					// Pozostala wartosc
					am = (_con[# INVAMOUNT, i] + amount) - itemall[# MAXSTACK, iitem];
					
					// Zmien ilosc na slocie na maxstack
					_con[# INVAMOUNT, i] = itemall[# MAXSTACK, iitem];
					
					container_stack(iitem, am, level, capacity, _con, _maxslots);
				}else{
					// Jezeli nie przekracza dodajemy normalnie
					_con[# INVAMOUNT, i] += amount;
					return 0;
					break;
				}
			}else{
				if (i >= _maxslots - 1){
					return am;
					break;
				}
				i++;
			}
		}
		
		// Jezeli istnieje wolne miejsce...
		repeat(_maxslots){
			if (_con[# INVITEM, i] == item.none){
				// ...dodaj tam przedmiot
				_con[# INVITEM, i] = iitem;
				_con[# INVAMOUNT, i] = amount;
				_con[# INVTYPE, i] = itemall[# INVTYPE, iitem];
				_con[# MAXSTACK, i] = itemall[# MAXSTACK, iitem];
				_con[# INVHP, i] = itemall[# INVHP, iitem];
				_con[# INVSTAMINA, i] = itemall[# INVSTAMINA, iitem];
				_con[# INVLEVEL, i] = level;
				_con[# INVDAMAGE, i] = itemall[# INVDAMAGE, iitem];
				_con[# INVDEFENCE, i] = itemall[# INVDEFENCE, iitem];
				_con[# INVEFFECTS, i] = itemall[# INVEFFECTS, iitem];
				_con[# INVTEMPERATURE, i] = itemall[# INVTEMPERATURE, iitem];
				_con[# INVCAP, i] = capacity;
				_con[# MAXCAP, i] = itemall[# MAXCAP, iitem];
				return 0;
				break;
			}else{
				i++;	
			}	
		}
}