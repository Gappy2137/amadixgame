function approach_fixed(start, target, rate){
	var _rate = rate / 60;

	if start > target {
	    return max(start - _rate, target);
	}
	else if start < target {
	    return min(start + _rate, target);
	}
	else return target;
}