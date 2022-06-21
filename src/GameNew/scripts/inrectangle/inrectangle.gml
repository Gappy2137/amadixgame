function inRectangle(variable, left, top, right, bottom){
	if (((variable >= left) && (variable <= right)) && ((variable >= top) && (variable <= bottom))){
		return true;
	}else{
		return false;	
	}
}