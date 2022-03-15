containerSlotWidth = 3;
containerSlotHeight = 3;

containter_additem(item.stick, 10, 0);
containter_additem(item.log, 8, 5);

containerSlots = containerSlotWidth * containerSlotHeight;
	
invUI_width = containerSlotWidth * cell_size;
invUI_height = containerSlotHeight * cell_size;
	
xUI = (obj_display.ideal_width/2) - (containerSlotWidth * cell_size/2);
yUI = 72 - (containerSlotHeight * cell_size/2);
	
slots_x = xUI;
slots_y = yUI;
	
ds_grid_resize(ds_container, 11, containerSlots);