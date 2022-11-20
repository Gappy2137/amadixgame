i += val;	
if (i > cap){
	i = -cap;	
}

if (fade){
	if (alpha <= 0){
		instance_destroy();	
	}else{
		alpha -= 0.05;	
	}
}