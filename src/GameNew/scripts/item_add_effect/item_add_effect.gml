function item_add_effect(iitem){
	
	if (obj_inventory.ds_item_all[# INVEFFECTS, iitem] != 0){
		effect_add(obj_inventory.ds_item_all[# INVEFFECTS, iitem][# EF_EFFECT, 0],
				   obj_inventory.ds_item_all[# INVEFFECTS, iitem][# EF_DURATION, 0],
				   obj_inventory.ds_item_all[# INVEFFECTS, iitem][# EF_AMPLIFIER, 0]
				   )
		if (obj_inventory.ds_item_all[# INVEFFECTS, iitem][# EF_EFFECT, 1] != undefined){
		effect_add(obj_inventory.ds_item_all[# INVEFFECTS, iitem][# EF_EFFECT, 1],
				   obj_inventory.ds_item_all[# INVEFFECTS, iitem][# EF_DURATION, 1],
				   obj_inventory.ds_item_all[# INVEFFECTS, iitem][# EF_AMPLIFIER, 1]
				   )
		}
		if (obj_inventory.ds_item_all[# INVEFFECTS, iitem][# EF_EFFECT, 2] != undefined){
		effect_add(obj_inventory.ds_item_all[# INVEFFECTS, iitem][# EF_EFFECT, 2],
				   obj_inventory.ds_item_all[# INVEFFECTS, iitem][# EF_DURATION, 2],
				   obj_inventory.ds_item_all[# INVEFFECTS, iitem][# EF_AMPLIFIER, 2]
				   )
		}
	}
}