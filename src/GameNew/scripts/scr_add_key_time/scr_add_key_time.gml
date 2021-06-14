function scr_add_key_time(r, g, b, con, sat, brt, str, tres){

if (is_undefined(color[0,0])) {
	var i = 0;
} else {
	var i = array_height_2d(color);
}

color[i,0] = r/255;
color[i,1] = g/255;
color[i,2] = b/255;

con_sat_brt[i,0] = con;
con_sat_brt[i,1] = sat;
con_sat_brt[i,2] = brt;

con_sat_brt[i,3] = str;
con_sat_brt[i,4] = tres;
}