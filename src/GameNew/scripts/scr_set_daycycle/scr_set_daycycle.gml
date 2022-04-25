function scr_set_daycycle(hour, weath){
	switch weath{
		#region Sun
		case weather.sun:
			switch hour{
				case 0:
					color[hour,0] = 030/255;
					color[hour,1] = 100/255;
					color[hour,2] = 230/255;

					con_sat_brt[hour,0] = 0.20;
					con_sat_brt[hour,1] = 0.80;
					con_sat_brt[hour,2] = -0.00;

					con_sat_brt[hour,3] = 0.00;
					con_sat_brt[hour,4] = 0.80;
				break;
				case 1:
					color[hour,0] = 030/255;
					color[hour,1] = 100/255;
					color[hour,2] = 230/255;

					con_sat_brt[hour,0] = 0.30;
					con_sat_brt[hour,1] = 0.90;
					con_sat_brt[hour,2] = -0.45;

					con_sat_brt[hour,3] = 0.00;
					con_sat_brt[hour,4] = 0.80;
				break;
				case 2:
					color[hour,0] = 030/255;
					color[hour,1] = 100/255;
					color[hour,2] = 230/255;

					con_sat_brt[hour,0] = 0.30;
					con_sat_brt[hour,1] = 0.90;
					con_sat_brt[hour,2] = -0.45;

					con_sat_brt[hour,3] = 0.00;
					con_sat_brt[hour,4] = 0.80;
				break;
				case 3:
					color[hour,0] = 030/255;
					color[hour,1] = 100/255;
					color[hour,2] = 230/255;

					con_sat_brt[hour,0] = 0.30;
					con_sat_brt[hour,1] = 0.90;
					con_sat_brt[hour,2] = -0.45;

					con_sat_brt[hour,3] = 0.00;
					con_sat_brt[hour,4] = 0.80;
				break;
				case 4:
					color[hour,0] = 030/255;
					color[hour,1] = 100/255;
					color[hour,2] = 230/255;

					con_sat_brt[hour,0] = 0.30;
					con_sat_brt[hour,1] = 0.90;
					con_sat_brt[hour,2] = -0.45;

					con_sat_brt[hour,3] = 0.00;
					con_sat_brt[hour,4] = 0.80;
				break;
				case 5:
					color[hour,0] = 085/255;
					color[hour,1] = 100/255;
					color[hour,2] = 150/255;

					con_sat_brt[hour,0] = 0.50;
					con_sat_brt[hour,1] = 0.80;
					con_sat_brt[hour,2] = -0.40;

					con_sat_brt[hour,3] = 0.10;
					con_sat_brt[hour,4] = 0.60;
				break;
				case 6:
					color[hour,0] = 128/255;
					color[hour,1] = 100/255;
					color[hour,2] = 128/255;

					con_sat_brt[hour,0] = 0.95;
					con_sat_brt[hour,1] = 1.05;
					con_sat_brt[hour,2] = -0.05;

					con_sat_brt[hour,3] = 0.10;
					con_sat_brt[hour,4] = 0.60;
				break;
				case 7:
					color[hour,0] = 128/255;
					color[hour,1] = 100/255;
					color[hour,2] = 128/255;

					con_sat_brt[hour,0] = 1.00;
					con_sat_brt[hour,1] = 0.75;
					con_sat_brt[hour,2] = 0.00;

					con_sat_brt[hour,3] = 0.40;
					con_sat_brt[hour,4] = 0.60;
				break;
				case 8:
					color[hour,0] = 128/255;
					color[hour,1] = 128/255;
					color[hour,2] = 128/255;

					con_sat_brt[hour,0] = 1.00;
					con_sat_brt[hour,1] = 1.00;
					con_sat_brt[hour,2] = 0.00;

					con_sat_brt[hour,3] = 1.00;
					con_sat_brt[hour,4] = 1.00;
				break;
				case 9:
					color[hour,0] = 128/255;
					color[hour,1] = 128/255;
					color[hour,2] = 128/255;

					con_sat_brt[hour,0] = 1.00;
					con_sat_brt[hour,1] = 1.00;
					con_sat_brt[hour,2] = 0.00;

					con_sat_brt[hour,3] = 1.00;
					con_sat_brt[hour,4] = 1.00;
				break;
				case 10:
					color[hour,0] = 128/255;
					color[hour,1] = 128/255;
					color[hour,2] = 128/255;

					con_sat_brt[hour,0] = 1.00;
					con_sat_brt[hour,1] = 1.00;
					con_sat_brt[hour,2] = 0.00;

					con_sat_brt[hour,3] = 1.00;
					con_sat_brt[hour,4] = 1.00;
				break;
				case 11:
					color[hour,0] = 128/255;
					color[hour,1] = 128/255;
					color[hour,2] = 128/255;

					con_sat_brt[hour,0] = 1.00;
					con_sat_brt[hour,1] = 1.00;
					con_sat_brt[hour,2] = 0.00;

					con_sat_brt[hour,3] = 1.00;
					con_sat_brt[hour,4] = 1.00;
				break;
				case 12:
					color[hour,0] = 130/255;
					color[hour,1] = 130/255;
					color[hour,2] = 120/255;

					con_sat_brt[hour,0] = 1.02;
					con_sat_brt[hour,1] = 0.98;
					con_sat_brt[hour,2] = 0.02;

					con_sat_brt[hour,3] = 1.00;
					con_sat_brt[hour,4] = 0.70;
				break;
				case 13:
					color[hour,0] = 128/255;
					color[hour,1] = 128/255;
					color[hour,2] = 128/255;

					con_sat_brt[hour,0] = 1.00;
					con_sat_brt[hour,1] = 1.00;
					con_sat_brt[hour,2] = 0.00;

					con_sat_brt[hour,3] = 1.00;
					con_sat_brt[hour,4] = 1.00;
				break;
				case 14:
					color[hour,0] = 128/255;
					color[hour,1] = 128/255;
					color[hour,2] = 128/255;

					con_sat_brt[hour,0] = 1.00;
					con_sat_brt[hour,1] = 1.00;
					con_sat_brt[hour,2] = 0.00;

					con_sat_brt[hour,3] = 1.00;
					con_sat_brt[hour,4] = 1.00;
				break;
				case 15:
					color[hour,0] = 128/255;
					color[hour,1] = 128/255;
					color[hour,2] = 128/255;

					con_sat_brt[hour,0] = 1.00;
					con_sat_brt[hour,1] = 1.00;
					con_sat_brt[hour,2] = 0.00;

					con_sat_brt[hour,3] = 1.00;
					con_sat_brt[hour,4] = 1.00;
				break;
				case 16:
					color[hour,0] = 120/255;
					color[hour,1] = 120/255;
					color[hour,2] = 120/255;

					con_sat_brt[hour,0] = 1.00;
					con_sat_brt[hour,1] = 1.00;
					con_sat_brt[hour,2] = 0.00;

					con_sat_brt[hour,3] = 1.00;
					con_sat_brt[hour,4] = 1.00;
				break;
				case 17:
					color[hour,0] = 120/255;
					color[hour,1] = 120/255;
					color[hour,2] = 120/255;

					con_sat_brt[hour,0] = 1.00;
					con_sat_brt[hour,1] = 1.00;
					con_sat_brt[hour,2] = 0.00;

					con_sat_brt[hour,3] = 1.00;
					con_sat_brt[hour,4] = 1.00;
				break;
				case 18:
					color[hour,0] = 125/255;
					color[hour,1] = 120/255;
					color[hour,2] = 100/255;

					con_sat_brt[hour,0] = 1.00;
					con_sat_brt[hour,1] = 0.95;
					con_sat_brt[hour,2] = 0.00;

					con_sat_brt[hour,3] = 1.00;
					con_sat_brt[hour,4] = 1.00;
				break;
				case 19:
					color[hour,0] = 125/255;
					color[hour,1] = 120/255;
					color[hour,2] = 100/255;

					con_sat_brt[hour,0] = 1.00;
					con_sat_brt[hour,1] = 0.85;
					con_sat_brt[hour,2] = 0.00;

					con_sat_brt[hour,3] = 1.00;
					con_sat_brt[hour,4] = 1.00;
				break;
				case 20:
					color[hour,0] = 125/255;
					color[hour,1] = 110/255;
					color[hour,2] = 110/255;

					con_sat_brt[hour,0] = 1.00;
					con_sat_brt[hour,1] = 0.75;
					con_sat_brt[hour,2] = -0.02;

					con_sat_brt[hour,3] = 0.80;
					con_sat_brt[hour,4] = 0.80;
				break;
				case 21:
					color[hour,0] = 132/255;
					color[hour,1] = 100/255;
					color[hour,2] = 132/255;

					con_sat_brt[hour,0] = 1.00;
					con_sat_brt[hour,1] = 0.90;
					con_sat_brt[hour,2] = -0.10;

					con_sat_brt[hour,3] = 0.10;
					con_sat_brt[hour,4] = 0.60;
				break;
				case 22:
					color[hour,0] = 090/255;
					color[hour,1] = 090/255;
					color[hour,2] = 120/255;

					con_sat_brt[hour,0] = 0.70;
					con_sat_brt[hour,1] = 0.70;
					con_sat_brt[hour,2] = -0.25;

					con_sat_brt[hour,3] = 0.00;
					con_sat_brt[hour,4] = 0.80;
				break;
				case 23:
					color[hour,0] = 030/255;
					color[hour,1] = 100/255;
					color[hour,2] = 230/255;

					con_sat_brt[hour,0] = 0.30;
					con_sat_brt[hour,1] = 0.90;
					con_sat_brt[hour,2] = -0.45;

					con_sat_brt[hour,3] = 0.00;
					con_sat_brt[hour,4] = 0.80;
				break;
			}
		break;
		#endregion
		#region Few Clouds
		case weather.few_clouds:
			switch hour{
				case 0:
					color[hour,0] = 035/255;
					color[hour,1] = 105/255;
					color[hour,2] = 250/255;

					con_sat_brt[hour,0] = 0.30;
					con_sat_brt[hour,1] = 0.90;
					con_sat_brt[hour,2] = -0.65;

					con_sat_brt[hour,3] = 0.70;
					con_sat_brt[hour,4] = 0.65;
				break;
				case 1:
					color[hour,0] = 030/255;
					color[hour,1] = 100/255;
					color[hour,2] = 230/255;

					con_sat_brt[hour,0] = 0.30;
					con_sat_brt[hour,1] = 0.90;
					con_sat_brt[hour,2] = -0.45;

					con_sat_brt[hour,3] = 0.70;
					con_sat_brt[hour,4] = 0.65;
				break;
				case 2:
					color[hour,0] = 040/255;
					color[hour,1] = 125/255;
					color[hour,2] = 215/255;

					con_sat_brt[hour,0] = 0.40;
					con_sat_brt[hour,1] = 0.90;
					con_sat_brt[hour,2] = -0.45;

					con_sat_brt[hour,3] = 0.70;
					con_sat_brt[hour,4] = 0.65;
				break;
				case 3:
					color[hour,0] = 040/255;
					color[hour,1] = 125/255;
					color[hour,2] = 215/255;

					con_sat_brt[hour,0] = 0.40;
					con_sat_brt[hour,1] = 0.90;
					con_sat_brt[hour,2] = -0.45;

					con_sat_brt[hour,3] = 0.70;
					con_sat_brt[hour,4] = 0.65;
				break;
				case 4:
					color[hour,0] = 085/255;
					color[hour,1] = 100/255;
					color[hour,2] = 150/255;

					con_sat_brt[hour,0] = 0.40;
					con_sat_brt[hour,1] = 0.70;
					con_sat_brt[hour,2] = -0.40;

					con_sat_brt[hour,3] = 0.20;
					con_sat_brt[hour,4] = 0.60;
				break;
				case 5:
					color[hour,0] = 085/255;
					color[hour,1] = 100/255;
					color[hour,2] = 150/255;

					con_sat_brt[hour,0] = 0.40;
					con_sat_brt[hour,1] = 0.70;
					con_sat_brt[hour,2] = -0.35;

					con_sat_brt[hour,3] = 0.20;
					con_sat_brt[hour,4] = 0.60;
				break;
				case 6:
					color[hour,0] = 125/255;
					color[hour,1] = 100/255;
					color[hour,2] = 125/255;

					con_sat_brt[hour,0] = 1.00;
					con_sat_brt[hour,1] = 0.75;
					con_sat_brt[hour,2] = -0.10;

					con_sat_brt[hour,3] = 0.20;
					con_sat_brt[hour,4] = 0.60;
				break;
				case 7:
					color[hour,0] = 125/255;
					color[hour,1] = 100/255;
					color[hour,2] = 125/255;

					con_sat_brt[hour,0] = 1.00;
					con_sat_brt[hour,1] = 0.75;
					con_sat_brt[hour,2] = -0.05;

					con_sat_brt[hour,3] = 0.20;
					con_sat_brt[hour,4] = 0.60;
				break;
				case 8:
					color[hour,0] = 128/255;
					color[hour,1] = 128/255;
					color[hour,2] = 128/255;

					con_sat_brt[hour,0] = 1.00;
					con_sat_brt[hour,1] = 1.00;
					con_sat_brt[hour,2] = 0.00;

					con_sat_brt[hour,3] = 0.00;
					con_sat_brt[hour,4] = 1.00;
				break;
				case 9:
					color[hour,0] = 128/255;
					color[hour,1] = 128/255;
					color[hour,2] = 128/255;

					con_sat_brt[hour,0] = 1.00;
					con_sat_brt[hour,1] = 1.00;
					con_sat_brt[hour,2] = 0.00;

					con_sat_brt[hour,3] = 0.00;
					con_sat_brt[hour,4] = 1.00;
				break;
				case 10:
					color[hour,0] = 128/255;
					color[hour,1] = 128/255;
					color[hour,2] = 128/255;

					con_sat_brt[hour,0] = 1.00;
					con_sat_brt[hour,1] = 1.00;
					con_sat_brt[hour,2] = 0.00;

					con_sat_brt[hour,3] = 0.00;
					con_sat_brt[hour,4] = 1.00;
				break;
				case 11:
					color[hour,0] = 128/255;
					color[hour,1] = 128/255;
					color[hour,2] = 128/255;

					con_sat_brt[hour,0] = 1.00;
					con_sat_brt[hour,1] = 1.00;
					con_sat_brt[hour,2] = 0.00;

					con_sat_brt[hour,3] = 0.00;
					con_sat_brt[hour,4] = 1.00;
				break;
				case 12:
					color[hour,0] = 130/255;
					color[hour,1] = 130/255;
					color[hour,2] = 130/255;

					con_sat_brt[hour,0] = 1.02;
					con_sat_brt[hour,1] = 0.98;
					con_sat_brt[hour,2] = 0.02;

					con_sat_brt[hour,3] = 0.02;
					con_sat_brt[hour,4] = 1.02;
				break;
				case 13:
					color[hour,0] = 128/255;
					color[hour,1] = 128/255;
					color[hour,2] = 128/255;

					con_sat_brt[hour,0] = 1.00;
					con_sat_brt[hour,1] = 1.00;
					con_sat_brt[hour,2] = 0.00;

					con_sat_brt[hour,3] = 0.00;
					con_sat_brt[hour,4] = 1.00;
				break;
				case 14:
					color[hour,0] = 128/255;
					color[hour,1] = 128/255;
					color[hour,2] = 128/255;

					con_sat_brt[hour,0] = 1.00;
					con_sat_brt[hour,1] = 1.00;
					con_sat_brt[hour,2] = 0.00;

					con_sat_brt[hour,3] = 0.00;
					con_sat_brt[hour,4] = 1.00;
				break;
				case 15:
					color[hour,0] = 128/255;
					color[hour,1] = 128/255;
					color[hour,2] = 128/255;

					con_sat_brt[hour,0] = 1.00;
					con_sat_brt[hour,1] = 1.00;
					con_sat_brt[hour,2] = 0.00;

					con_sat_brt[hour,3] = 0.00;
					con_sat_brt[hour,4] = 1.00;
				break;
				case 16:
					color[hour,0] = 120/255;
					color[hour,1] = 120/255;
					color[hour,2] = 120/255;

					con_sat_brt[hour,0] = 1.10;
					con_sat_brt[hour,1] = 0.80;
					con_sat_brt[hour,2] = 0.00;

					con_sat_brt[hour,3] = 0.00;
					con_sat_brt[hour,4] = 1.00;
				break;
				case 17:
					color[hour,0] = 120/255;
					color[hour,1] = 120/255;
					color[hour,2] = 120/255;

					con_sat_brt[hour,0] = 1.10;
					con_sat_brt[hour,1] = 0.80;
					con_sat_brt[hour,2] = 0.00;

					con_sat_brt[hour,3] = 0.00;
					con_sat_brt[hour,4] = 1.00;
				break;
				case 18:
					color[hour,0] = 125/255;
					color[hour,1] = 120/255;
					color[hour,2] = 100/255;

					con_sat_brt[hour,0] = 1.10;
					con_sat_brt[hour,1] = 0.75;
					con_sat_brt[hour,2] = 0.00;

					con_sat_brt[hour,3] = 0.00;
					con_sat_brt[hour,4] = 1.00;
				break;
				case 19:
					color[hour,0] = 125/255;
					color[hour,1] = 120/255;
					color[hour,2] = 100/255;

					con_sat_brt[hour,0] = 1.10;
					con_sat_brt[hour,1] = 0.75;
					con_sat_brt[hour,2] = 0.00;

					con_sat_brt[hour,3] = 0.00;
					con_sat_brt[hour,4] = 1.00;
				break;
				case 20:
					color[hour,0] = 125/255;
					color[hour,1] = 115/255;
					color[hour,2] = 100/255;

					con_sat_brt[hour,0] = 1.10;
					con_sat_brt[hour,1] = 0.75;
					con_sat_brt[hour,2] = -0.02;

					con_sat_brt[hour,3] = 0.00;
					con_sat_brt[hour,4] = 1.00;
				break;
				case 21:
					color[hour,0] = 125/255;
					color[hour,1] = 115/255;
					color[hour,2] = 100/255;

					con_sat_brt[hour,0] = 1.10;
					con_sat_brt[hour,1] = 0.75;
					con_sat_brt[hour,2] = -0.05;

					con_sat_brt[hour,3] = 0.30;
					con_sat_brt[hour,4] = 0.90;
				break;
				case 22:
					color[hour,0] = 100/255;
					color[hour,1] = 100/255;
					color[hour,2] = 130/255;

					con_sat_brt[hour,0] = 0.80;
					con_sat_brt[hour,1] = 0.70;
					con_sat_brt[hour,2] = -0.20;

					con_sat_brt[hour,3] = 0.40;
					con_sat_brt[hour,4] = 0.80;
				break;
				case 23:
					color[hour,0] = 040/255;
					color[hour,1] = 100/255;
					color[hour,2] = 200/255;

					con_sat_brt[hour,0] = 0.80;
					con_sat_brt[hour,1] = 0.70;
					con_sat_brt[hour,2] = -0.35;

					con_sat_brt[hour,3] = 0.70;
					con_sat_brt[hour,4] = 0.65;
				break;
			}
			#endregion
		break;
	}
}