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



canBeHurtByPlayer = false;

hp = 100;
maxhp = 100;

defence = 0;
maxdefence = 0;

state = entityState.idle;

hurt = false;

invisFrames = 15;
invisFrame = invisFrames;