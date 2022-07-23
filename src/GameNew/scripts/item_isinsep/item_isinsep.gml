function item_isinsep(_itemtype){
	
	if (_itemtype == itemtype.drink)
	|| (_itemtype == itemtype.magazine)
	|| (_itemtype == itemtype.alcohol){
		return true;
	}else{
		return false;
	}
}