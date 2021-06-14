if (isanim){
		if (anim == 0){
			canclick = false;
			angle2 = approach(angle2, -5, acc2);
			if (angle2 == -5){
				anim = 1;	
			}
		}
		if (anim == 1){
			angle2 = approach(angle2, 5, acc2);
			if (angle2 == 5){
				anim = 2;	
			}
		}
		if (anim == 2){
			angle2 = approach(angle2, 0, acc2);
			if (angle2 == 0){
				anim = 0;	
				canclick = true;
				isanim = false;
			}
		}	
}