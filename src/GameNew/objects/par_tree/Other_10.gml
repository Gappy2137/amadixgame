if (isanim){
		if (anim == 0){
			canclick = false;
			angle = approach(angle, -3, acc);
			if (angle <= -3){
				anim = 1;	
			}
		}
		if (anim == 1){
			angle = approach(angle, 3, acc);
			if (angle >= 3){
				anim = 2;	
			}
		}
		if (anim == 2){
			angle = approach(angle, 0, acc);
			if (angle == 0){
				anim = 0;	
				canclick = true;
				isanim = false;
			}
		}	
}