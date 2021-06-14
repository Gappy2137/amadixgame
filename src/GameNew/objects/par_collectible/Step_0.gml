
if (ami_clicked()){
	if (canclick){
			switch(type){
				case 0:
						if (rotate){isanim = true;}
						if (itemDrop != -1) && (itemDrop != 0) && (itemNum != 0){
							item_add(-1, itemDrop, amount);
							itemNum--;
							flag = true;
						}
				break;
				case 1:
						if (rotate){isanim = true;}
						if (itemDrop != -1) && (itemDrop != 0) && (itemNum != 0){
							item_add(-1, itemDrop, amount);
							itemNum--;
							flag = true;
						}
				break;
				case 2:
						if (rotate){isanim = true;}
						if (itemDrop != -1) && (itemDrop != 0) && (itemNum == itemNumMax){
							item_add(-1, itemDrop, amount);
							itemNum = 0;
							flag = true;
						}
				break;
				case 3:
						if (rotate){isanim = true;}
						if (itemDrop != -1) && (itemDrop != 0) && (itemNum != 0){
							item_add(-1, itemDrop, amount);
							itemNum--;
							flag = true;
						}
				break;
				case 4:
						if (rotate){isanim = true;}
						if (itemDrop != -1) && (itemDrop != 0) && (itemNum == itemNumMax){
							item_add(-1, itemDrop, amount);
							itemNum = 0;
							flag = true;
						}
				break;
				case 5:
					item_add(-1, itemDrop, amount);
					instance_destroy();
				break;
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
	if (itemNum <= itemNumMax){
		itemOverlayState = itemNum;	
	}else{
		itemOverlayState = itemNumMax;
	}
}

itemNum = clamp(itemNum, 0, itemNumMax);

switch (type){
	case 0:
			cancollide = true;
			alarm[0] = 5;
	break;
	case 1:
			cancollide = true;
			alarm[0] = 5;
	break;
	case 2:
			cancollide = true;
			alarm[0] = 5;
	break;
	case 3:
			cancollide = false;
			alarm[0] = 5;
	break;
	case 4:
			cancollide = false;
			alarm[0] = 5;
	break;
	case 5:
			cancollide = true;
			alarm[0] = 5;
	break;
}

en = instance_place(x, y, par_entity);
if (en){
	collision = true;
}else{
	collision = false;	
}
	
if (rotoncol){
	if (collision){
		var left_collision = collision_rectangle(bbox_left, bbox_top, bbox_right - 8, bbox_bottom, en, true, true);
		var right_collision = collision_rectangle(bbox_left + 8, bbox_top, bbox_right, bbox_bottom, en, true, true);
	
		if (left_collision){
			angle = approach(angle, -25, acc);	
		}else if (right_collision){
			angle = approach(angle, 25, acc);
		}else{
			angle = approach(angle, 0, acc);	
		}
	
	}else{
		angle = approach(angle, 0, acc);
	}
}
if (rotate){
	event_user(0);	
}
if (shake){
	if (ami_clicked()){
		if (canclick){
			shakex = random_range(-2, 2);
			shakeflag = true;
		}
	}
	if (shakeflag){
		shaketimer--;	
	}
	if (shaketimer <= 0){
		shaketimer = 15;
		shakex = 0;
		shakeflag = false;
	}
}