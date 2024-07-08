xx = room_width/4;
yy = room_height-16;

switch(global.stage)
{
	case stage.forest: 
		var_boss = en_bossFor;
	break;
	
	case stage.volcano: 
		var_boss = en_bossVol;
	break;
	
	case stage.beach: 
		var_boss = en_bossBea;
		
		xx = room_width/4;
		yy = 111;
	break;
	
	default: 
		var_boss = en_bossFor;
	break;
}