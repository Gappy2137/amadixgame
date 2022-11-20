function inrange(n, a, b, sharp){
	
	var left = min(a, b);
	var right = max(a, b);
	
	if (sharp){
		return ( ( left <= n ) && ( n <= right ) );
	}else{
		return ( ( left < n ) && ( n < right ) );
	}
	
	
	
}