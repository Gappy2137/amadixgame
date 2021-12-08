event_inherited();

if (ami_clicked()){
	if (canclick){
		isanim = true;
		if (itemDrop != -1) && (itemDrop != 0) && (itemNum != 0){
			item_drop(itemDrop, 1, false, x + choose(-16, 16, 8, -8), y - 32 + choose(4, -4, 8, 0), 40 + choose(4, -4, 8, 0));
			itemNum--;
			flag = true;
		}
	}
}

if (flag) && (itemRegTime != -1){
	timer--;
	if (timer == 0){
		itemNum++;
		timer = itemRegTime;
		if (itemNum == 0){
			flag = false;
		}
		if (itemNum > itemNumMax){
			itemNum = itemNumMax;	
			flag = false;	
		}
	}
}

if (itemOverlay != -1){
	if (itemNum <= 3){
		itemOverlayState = itemNum;	
	}else{
		itemOverlayState = 3;
	}
}

if (itemNum > itemNumMax){
	itemNum = itemNumMax;	
}

event_user(0);