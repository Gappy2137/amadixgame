// Inherit the parent event
event_inherited();

yorigin = 0;
shadowAlpha = 0.25;
shadowHeight = 12;
shadowOriginY = 0;
shadowOriginX = 0;
shadowSizeX = 0;
shadowSizeY = 0;
customSpr = false;
shadowStyle = spr_shadow_player;
shadowEnable = false;

aiType = entityAiType.followSimple;

lookingFor = obj_amadix;

facing = index_facing.down;

eyeHeight = 16;

detected = false;
detectionRange = 96;
detectionLines = 6;
detectionSpacing = 3;
detectionSpeed = 1;
detectionSpeedMultiplier = 0.25;
detectionMeter = 0;
detectionMeterMax = 20;


var i = 0;
repeat((detectionLines * 2) + 1){
	
	testx[i] = 0;
	testy[i] = 0;
	
	i++;
}