application_surface_draw_enable(false);

shader = shader_daycycle;

u_col = shader_get_uniform(shader, "col");
u_con_sat_brt = shader_get_uniform(shader, "con_sat_brt");

color_mix = -1;
color[0][0] = undefined;

s_lights		= shader_get_sampler_index(shader, "lights");
tex_lights		= -1;
srf_lights		= -1;

con_sat_brt_mix = -1;

key_previous = -1;
key_next = -1;

// KEY TIMES:
// ----------------------------------------------------------------------------
// arguments:		R		G		B		con		sat		brt		popS	popT
/*
scr_add_key_time(030,	100,	230,	0.30,	0.90,  -0.45,	0.70,	0.65);	// 00h
scr_add_key_time(030,	100,	230,	0.30,	0.90,  -0.45,	0.70,	0.65);	// 01h
scr_add_key_time(040,	125,	215,	0.40,	0.90,  -0.45,	0.70,	0.65);	// 02h
scr_add_key_time(040,	125,	215,	0.40,	0.90,  -0.45,	0.70,	0.65);	// 03h
scr_add_key_time(085,	100,	150,	0.40,	0.70,  -0.40,	0.20,	0.60);	// 04h
scr_add_key_time(085,	100,	150,	0.40,	0.70,  -0.35,	0.20,	0.60);	// 05h
scr_add_key_time(125,	100,	125,	1.00,	0.75,  -0.10,   0.20,	0.60);	// 06h
scr_add_key_time(125,	100,	125,	1.00,	0.75,  -0.05,   0.20,	0.60);	// 07h
scr_add_key_time(128,	128,	128,	1.00,	1.00,	0.00,	0.00,	1.00);	// 08h
scr_add_key_time(128,	128,	128,	1.00,	1.00,	0.00,	0.00,	1.00);	// 09h
scr_add_key_time(128,	128,	128,	1.00,	1.00,	0.00,	0.00,	1.00);	// 10h
scr_add_key_time(128,	128,	128,	1.00,	1.00,	0.00,	0.00,	1.00);	// 11h
scr_add_key_time(130,	130,	130,	1.02,	0.98,	0.02,	0.00,	1.00);	// 12h
scr_add_key_time(128,	128,	128,	1.00,	1.00,	0.00,	0.00,	1.00);	// 13h
scr_add_key_time(128,	128,	128,	1.00,	1.00,	0.00,	0.00,	1.00);	// 14h
scr_add_key_time(128,	128,	128,	1.00,	1.00,	0.00,	0.00,	1.00);	// 15h
scr_add_key_time(120,	120,	120,	1.10,	0.80,	0.00,	0.00,	1.00);	// 16h
scr_add_key_time(120,	120,	120,	1.10,	0.80,	0.00,	0.00,	1.00);	// 17h
scr_add_key_time(145,	120,	090,	1.10,	0.75,	0.00,	0.00,	1.00);	// 18h
scr_add_key_time(145,	120,	090,	1.10,	0.75,	0.00,	0.00,	1.00);	// 19h
scr_add_key_time(160,	110,	100,	1.25,	0.70,  -0.02,  -0.50,	0.60);	// 20h
scr_add_key_time(160,	110,	100,	1.25,	0.70,  -0.05,  -0.50,	0.60);	// 21h
scr_add_key_time(060,	060,	120,	0.80,	0.70,  -0.12,	0.20,	0.60);	// 22h
scr_add_key_time(030,	100,	230,	0.30,	0.92,  -0.35,	0.70,	0.65);	// 23h
*/
/*
scr_add_key_time(128,	128,	128,	1.00,	1.00,	0.00,	0.00,	1.00);	// Sun
scr_add_key_time(118,	100,	165,	0.92,	0.93,  -0.15,	0.08,	0.80);	// Rain
*/

number_of_key_times = 24;

var reflection = layer_get_id("WaterRef");
layer_script_begin(reflection, scr_set_alpha);
layer_script_end(reflection, scr_reset_alpha);

u_alpha = shader_get_uniform(shader_alpha, "alpha");
alpha = 0;
/*
					color[8,0] = 030/255;
					color[8,1] = 100/255;
					color[8,2] = 230/255;

					con_sat_brt[8,0] = 0.30;
					con_sat_brt[8,1] = 0.90;
					con_sat_brt[8,2] = -0.45;

					con_sat_brt[8,3] = 0.70;
					con_sat_brt[8,4] = 0.65;
*/
#region Fix
					color[0,0] = 030/255;
					color[0,1] = 100/255;
					color[0,2] = 230/255;

					con_sat_brt[0,0] = 0.30;
					con_sat_brt[0,1] = 0.90;
					con_sat_brt[0,2] = -0.45;

					con_sat_brt[0,3] = 0.70;
					con_sat_brt[0,4] = 0.65;
					
					color[1,0] = 030/255;
					color[1,1] = 100/255;
					color[1,2] = 230/255;

					con_sat_brt[1,0] = 0.30;
					con_sat_brt[1,1] = 0.90;
					con_sat_brt[1,2] = -0.45;

					con_sat_brt[1,3] = 0.70;
					con_sat_brt[1,4] = 0.65;
#endregion

alarm[0] = 1;
