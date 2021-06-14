/// @function approach(a, b, amount)
/// @description Przyblizanie a do b o wartosc amount
/// @param a  wartosc ktora chcemy przyblizyc
/// @param b  wartosc do ktorej przyblizamy
/// @param amount  wartosc o ktora chcemy przyblizyc a do b
function approach(argument0, argument1, argument2) {

	if (argument0 < argument1)
	{
	    argument0 += argument2;
	    if (argument0 > argument1)
	        return argument1;
	}
	else
	{
	    argument0 -= argument2;
	    if (argument0 < argument1)
	        return argument1;
	}
	return argument0;



}
