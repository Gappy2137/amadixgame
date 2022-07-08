if (global.inCutscene){
	if (layer_sequence_is_finished(currentSequenceElementID)){
		layer_sequence_destroy(currentSequenceElementID);
		global.inCutscene = false;
	}
}