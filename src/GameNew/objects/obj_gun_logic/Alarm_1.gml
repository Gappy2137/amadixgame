
var ammo = ammoCap - ammoLoaded;

if (ammoExtra < ammo){
	ammoLoaded += ammoExtra;
	ammoExtra = 0;
}else{
	ammoExtra -= ammo;
	ammoLoaded = ammoCap;

}

canShoot = true;
state = gunState.standby;
