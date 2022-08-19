if (flag) && (itemRegTime != -1){
	if (timer == 0){
		pickedup = false;
		canclick = true;
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