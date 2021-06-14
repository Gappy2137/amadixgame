switch (global.language){
	case lang.english:
		language_update(lang.english);
		langfix = false;
	break;
	case lang.polish:
		language_update(lang.polish);
		langfix = false;
	break;
	case lang.custom:
		//language_update_custom();
		langfix = false;
	break;
}