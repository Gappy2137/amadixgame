#macro ENEMY_START_TURN_TIMER 50;

stage = 0;
enemy_stage = 0;

phase = 1;

//0 - gracz, 1 - przeciwnik
turn = 0;

player_canfight = true;
enemy_canfight = false;

endturn = false;

enemyStartTurnTimer = ENEMY_START_TURN_TIMER;