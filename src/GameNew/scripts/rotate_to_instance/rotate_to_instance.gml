function rotate_to_instance(instance, amount){
	var targetDirection = point_direction(x, y, instance, instance);      
	var angleDifference = angle_difference(image_angle, targetDirection);      
	var angleIncrement = amount;      
      
	image_angle -= (min(abs(angleDifference), angleIncrement) * sign(angleDifference));    
}