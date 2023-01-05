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

detected = false;
detectionRange = 128;
detectionFOV = 30;
detectionSpeed = 1;
detectionSpeedMultiplier = 1;
detectionMeter = 0;
detectionMeterMax = 20;