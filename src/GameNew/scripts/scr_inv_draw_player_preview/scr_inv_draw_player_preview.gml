function scr_inv_draw_player_preview(amx, amy){
	
	var head_index = spr_amadix_head_d;
	
	var hands_index = spr_amadix_hands_d;
	
	
	var hat_index = spr_none;
	var torso_index = spr_none;
	var legs_index = spr_none;
	var boots_index = spr_none;
	
	switch(global.playerHat){
		case item.none: hat_index = spr_none; break;
		case item.panama_hat: hat_index = spr_panama_hat; break;
		case item.cat_ears: hat_index = spr_catears_hat; break;
	}
	
	switch(global.playerTorso){
		case item.none: torso_index = spr_amadix_bareTC_d; break;
		case item.classic_jacket: torso_index = spr_amadix_newTC_d; break;
	}
	
	switch(global.playerLegs){
		case item.none: legs_index = spr_amadix_pantsL_d; break;
		case item.jeans: legs_index = spr_amadix_jeansL_d; break;
	}
	
	switch(global.playerBoots){
		case item.none: boots_index = spr_amadix_feetB_d; break;
		case item.sneakers: boots_index = spr_amadix_newB_d; break;
	}
	
	draw_sprite(head_index, 0, amx, amy);
	draw_sprite(hat_index, 0, amx, amy - 12);
	draw_sprite(hands_index, 0, amx, amy);
	draw_sprite(torso_index, 0, amx, amy);
	draw_sprite(legs_index, 0, amx, amy);
	draw_sprite(boots_index, 0, amx, amy);
	
	
}