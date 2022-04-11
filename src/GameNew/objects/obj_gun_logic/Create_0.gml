
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
reloadTime = 1.8 * room_speed;
reloadTimeEmpty = 2 * room_speed;

heat = 0;

enum gunState{
	standby = 0,
	shooting = 1,
	reloading = 2,
	empty = 3,
	reloading_empty = 4
}

state = gunState.standby;
