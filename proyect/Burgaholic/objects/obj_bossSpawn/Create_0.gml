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
	
	default: 
		var_boss = en_bossFor;
	break;
}