
currentSequenceElementID = 0;
currentSequenceInstance	 = 0;


_cutsceneID = 0;

_cutsceneX = 0;
_cutsceneY = 0;

_invisArray[0] = id;

_amadixStayInPlace = false;

stop = false;

global.inCutscene = false;

#macro SEQTRACK_STRING_SEPERATOR ";"
#macro SEQTRACK_VARIABLE_SEPERATOR "$"

enum e_SeqTrackVars{
	// Parameter Tracks
	NAME,
	POSITION,
	ORIGIN,
	SCALE,
	ROTATION,
	SPRITE_INDEX,
	IMAGE_SPEED,
	IMAGE_INDEX,
	IMAGE_ANGLE,
	BLEND_MULTIPLY,
	IMAGE_BLEND,
	
	// Sequence Parameters
	FALLOFF,
	GAIN,
	PITCH,
	HEIGHT,
	WIDTH,
	ENABLE,
	MATRIX,
	
	
	// Can't set, only get
	INSTANCE_ID,
	OBJECT_INDEX
}

enum e_SeqVars{
	SEQ_LENGTH,
	SEQ_LOOPMODE,
	SEQ_NAME,
	SEQ_PLAYBACKSPEED,
	SEQ_PLAYBACKSPEEDTYPE,
	SEQ_VOLUME,
	SEQ_XORIGIN,
	SEQ_YORIGIN
} 