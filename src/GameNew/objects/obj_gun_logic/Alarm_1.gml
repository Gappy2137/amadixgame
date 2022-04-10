
var ammo = ammoCap - ammoLoaded;

if (ammoExtra < ammo){
	ammoLoaded += ammoExtra;
	ammoExtra = 0;
}else{
	ammoExtra -= ammo;
	ammoLoaded = ammoCap;

}

reloading = false;
canShoot = true;
