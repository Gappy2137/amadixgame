// Inherit the parent event
event_inherited();

spd = 0;
hsp = 0;
vsp = 0;
zsp = 0;
running = 0;
zfloor = 0;
gravSpeed = 1;
jumpSpeed = 10;
speedChange = 0;

groundFxTimer = 15;

knockbackHsp = 0;
knockbackVsp = 0;


canBeHurtByPlayer = false;

hp = 100;
maxhp = 100;

defence = 0;
maxdefence = 0;

state = entityState.idle;

hurt = false;

aiType = entityAiType.disabled;

invisFrames = 25;
invisFrame = invisFrames;
knockbackFrames = 10;
knockbackFrame = knockbackFrames;

hurtColor = #FA363F;
baseColor = #FFFFFF;
colorBlend = baseColor;

alarm[0] = 1;