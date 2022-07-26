event_inherited();
head_index = spr_none;
torso_index = spr_none;
hands_index = spr_none;
hands2_index = spr_none;
arms_index = spr_none;
arms2_index = spr_none;
legs_index = spr_none;
boots_index = spr_none;
hat_index = spr_none;

anim_frame = 0;
facing = 0;
running = 0;
actionstate = player_state_action.none;
state = player_state.moving;
itemeaten = -1;

yorigin = 31;

shadowOriginY = 34;
shadowStyle = spr_shadow_player;
shadowAlpha = 0.5;
customSpr = false;
shadowEnable = true;

max_spd = 0;
timeToRun = 20;
runningTimer = timeToRun;

timeSinceRunning = 0;

moving = false;
running = 0;
skid = false;
skidTime = 15;
skidTimer = skidTime;