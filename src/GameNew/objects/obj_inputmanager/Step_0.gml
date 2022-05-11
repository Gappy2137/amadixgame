// Input priority

if (obj_shell.isOpen){
	inputPriority = 3;	
	obj_hud.close();
	obj_hud.close_slots();
}else
if (obj_inventory.show_inventory){
	inputPriority = 2;
	obj_hud.close();
}else{
	inputPriority = 1;	
}
