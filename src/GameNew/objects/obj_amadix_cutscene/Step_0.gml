event_inherited();

var _track = sequence_track_get(obj_cutscene_controller.currentSequenceInstance.activeTracks, "Amadix");
var _index = sequence_track_variable_get(_track, e_SeqTrackVars.IMAGE_INDEX);

switch(_index){
	case 0:
		facing = index_facing.down;
		anim_frame = 0;
	break;
	case 1:
		facing = index_facing.down;
		anim_frame = 1;
	break;
	case 2:
		facing = index_facing.down;
		anim_frame = 3;
	break;
	case 3:
		facing = index_facing.left;
		anim_frame = 0;
	break;
	case 4:
		facing = index_facing.left;
		anim_frame = 1;
	break;
	case 5:
		facing = index_facing.left;
		anim_frame = 3;
	break;
	case 6:
		facing = index_facing.right;
		anim_frame = 0;
	break;
	case 7:
		facing = index_facing.right;
		anim_frame = 1;
	break;
	case 8:
		facing = index_facing.right;
		anim_frame = 3;
	break;
	case 9:
		facing = index_facing.up;
		anim_frame = 0;
	break;
	case 10:
		facing = index_facing.up;
		anim_frame = 1;
	break;
	case 11:
		facing = index_facing.up;
		anim_frame = 3;
	break;
}

scr_setPlayerFacingAnim(facing);