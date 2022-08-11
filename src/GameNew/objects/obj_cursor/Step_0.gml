/*
var col = instance_place(x, y, par_collectible);
var npc = instance_place(x, y, par_npc)

if (col){
	with (col){
		if (cursorChange){
			global.cursorSpr = cursorState.pickup;	
		}else{
			global.cursorSpr = cursorState.normal;	
		}
	}
}else
if (npc){
	with (npc){
		if (cursorChange){
			global.cursorSpr = cursorState.dialogue;	
		}else{
			global.cursorSpr = cursorState.normal;		
		}
	}
}else{
	global.cursorSpr = cursorState.normal;	
}
*/
switch (global.cursorSpr){
	case cursorState.normal:
		cursor_sprite = spr_cursor_default;
	break;
	case cursorState.pickup:
		cursor_sprite = spr_cursor_pickup;
	break;
	case cursorState.dialogue:
		cursor_sprite = spr_cursor_dialogue;
	break;
}
