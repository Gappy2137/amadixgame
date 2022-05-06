if (instance_exists(obj_amadix)){
	switch(obj_amadix.itemeaten){
		case item.m1911:
			//type
				type = 0;
				mag = item.m1911mag;
			//bullets
				ammoCap = 7 + chamberedRound;
				ammoExtra = item_mag_find(mag);
			//reload times
				shootingTime = 8;
				reloadTime = 1.5 * room_speed;
				reloadTimeEmpty = 1.8 * room_speed;
			//sounds
				soundSHOOT = snd_m1911_shoot;
				soundMAGOUT = snd_m1911_magout;
				soundMAGIN = snd_m1911_magin;
				soundBOLT = snd_m1911_bolt;
			//frames
				animFramesShooting = 3;
				animFramesShootingLast = 1.2;
				animFramesReload = 11;
				animFramesReloadEmpty = 12;
		break;
		case item.sawedoff:
			//type
				type = 1;
				mag = item.bullet45acp;
			//bullets
				ammoCap = 2;
				ammoExtra = item_find_amount(mag);
			//reload times
				shootingTime = 11;
				reloadTime = 2.2 * room_speed;
				reloadTimeEmpty = 2.2 * room_speed;
			//sounds
				soundSHOOT = snd_m1911_shoot;
				soundMAGOUT = snd_m1911_magout;
				soundMAGIN = snd_m1911_magin;
				soundBOLT = snd_m1911_bolt;
			//frames
				animFramesShooting = 5;
				animFramesShootingLast = 5;
				animFramesReload = 13;
				animFramesReloadEmpty = 13;
		break;
	}
}
