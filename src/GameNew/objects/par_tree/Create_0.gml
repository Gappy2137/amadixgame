event_inherited();

image_speed = 0;

alpha = 1;

itemDrop = -1;

itemNum = 0;
itemNumMax = 0;

itemRegTime = -1;

itemOverlay = -1;

timer = itemRegTime;

flag = false;

canclick = true;

angle = 0;

windangle = 0;

finalangle = 0;

treeSize = 1;

itemOverlayState = 0;

isanim = false;
anim = 0;

acc = .75;

randomWindPattern = irandom_range(0, 9);

lightCover = true;

lightOccluder = instance_create_layer(x, y, "Lights", obj_lightcover);
lightOccluder.sprite_index = sprite_index;
lightOccluder.image_index = 1;
lightOccluder.alpha = 0;

enableWindDisplacement = false;