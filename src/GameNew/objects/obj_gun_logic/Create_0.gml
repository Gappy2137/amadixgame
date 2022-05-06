
ammoCap = 0;
ammoLoaded = 0;
ammoExtra = 0;

isLoaded = true;
canShoot = true;
canReload = true;
isEmpty = false;

reloading = false;
shooting = false;
standby = true;

shootingTime = 0;
reloadTime = 0;
reloadTimeEmpty = 0;

inChamber = false;
chamberedRound = 0;
chambered1 = false;

heat = 0;
smokeflag = false;

soundSHOOT = -1;
soundMAGOUT = -1;
soundMAGIN = -1;
soundBOLT = -1;

type = 0;

mag = 0;

animFramesShooting = 0;
animFramesShootingLast = 0;
animFramesReload = 0;
animFramesReloadEmpty = 0;

//type
//0 - semi-auto handgun
//1 - sawed off

enum gunState{
	standby = 0,
	shooting = 1,
	reloading = 2,
	empty = 3,
	reloading_empty = 4
}

state = gunState.standby;
