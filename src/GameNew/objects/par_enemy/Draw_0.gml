// Inherit the parent event
event_inherited();

var myxCoord = bbox_left + ((bbox_right - bbox_left) / 2);
var myyCoord = bbox_top + ((bbox_bottom - bbox_top) / 2);

draw_line(myxCoord, myyCoord, testx, testy);