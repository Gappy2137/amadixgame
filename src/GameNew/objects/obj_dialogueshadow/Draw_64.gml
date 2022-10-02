if (instance_exists(obj_chatterbox)) {
	if (global.inDialogue) {
		draw_sprite_ext(spr_dialoguebox_shadow, 0, 0, dialShadowY, GAMEWIDTH, 1, 0, c_white, 1);
	}
}