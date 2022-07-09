function chance(percentage) {
	//<0,1> - szansa w ulamku na zajscie akcji
	return percentage/100 > random(1);
}
