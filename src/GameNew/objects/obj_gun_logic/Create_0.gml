
ammoCap = 7;
ammoLoaded = 7;
ammoExtra = 7 * 8;

isLoaded = true;
canShoot = true;
canReload = true;
isEmpty = false;

reloading = false;
shooting = false;
standby = true;

type = 0;

shootingTime = 8;
reloadTime = 1.5 * room_speed;
reloadTimeEmpty = 1.8 * room_speed;

heat = 0;

soundSHOOT = snd_m1911_shoot;
soundMAGOUT = snd_m1911_magout;
soundMAGIN = snd_m1911_magin;
soundBOLT = snd_m1911_bolt;



enum gunState{
	standby = 0,
	shooting = 1,
	reloading = 2,
	empty = 3,
	reloading_empty = 4
}

state = gunState.standby;
