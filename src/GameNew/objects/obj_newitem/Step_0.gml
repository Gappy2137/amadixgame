x_frame = newItemID mod (spr_width/24);

y_frame = newItemID div (spr_width/24);

newItemY = lerp(newItemY, newItemYdst, 0.01);

alpha -= 0.01;

if (alpha <= 0){
	instance_destroy();
}