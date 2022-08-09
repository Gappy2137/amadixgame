global.cursorSpr = spr_cursor_default;
depth = -1000;

window_set_cursor(cr_none);

mouseInWindow = true;

enum cursorState{
	normal,
	pickup,
	dialogue
}

_x = 0;
_y = 0;