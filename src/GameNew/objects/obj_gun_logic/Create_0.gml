
ammoCap = 7;
ammoLoaded = 7;
ammoExtra = 13;

isLoaded = true;
canShoot = true;
canReload = true;
isEmpty = false;

reloading = false;
shooting = false;
standby = true;

type = 0;

shootingTime = 10;
reloadTime = 2 * room_speed;
reloadTimeEmpty = 2.1;

enum gunState{
	standby = 0,
	shooting = 1,
	reloading = 2,
	empty = 3
}

state = gunState.standby;
