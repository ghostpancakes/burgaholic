//grounded in a one way wall
var _waterEffect = place_meeting(x, y, obj_water) and (var_effect != 1)
if(place_meeting(x, y+1, obj_oneWay)) and (!place_meeting(x, y, obj_oneWay)) //one way platform ground
{
	var_oneWayGrounded = true;
}
else
{
	var_oneWayGrounded = false;
};

//Ground Check (Either One Way or Normal)
if((place_meeting(x, y+1, obj_wall)) or (var_oneWayGrounded))
{
	var_grounded = true;
	var_canPunch = true;
};
else
{
	var_grounded = false;
};

//STATE MACHINE
if(hp > 0)
{
	switch(var_state)
	{
		case STATE_MACHINE.normal:
			state_normal();
		break;
	
		case STATE_MACHINE.wallrun:
			state_walkingWall();
		break;
	
		case STATE_MACHINE.hit:
			state_hit();
		break;
	
		case STATE_MACHINE.pound:
			state_pound();
		break;
		
		case STATE_MACHINE.preBounce:
			state_preBounce();
		break;
		
		case STATE_MACHINE.bounce:
			state_bounce();
		break;
	
		case STATE_MACHINE.roll:
			state_roll();
		break;
		
		case STATE_MACHINE.bump:
			state_bump();
		break;
	
		case STATE_MACHINE.dash:
			state_dash();
		break;
		
		case STATE_MACHINE.punch:
			state_punch();
		break;
		
		case STATE_MACHINE.tubeIn:
			state_tube();
		break;
		
		case STATE_MACHINE.tubeOut:
			state_tubeOut();
		break;
		
		case STATE_MACHINE.still:
			state_still();
		break;
		
		case STATE_MACHINE.submarine:
			state_submarine();
		break;
		
		case STATE_MACHINE.submarineDash:
			state_submarineDash();
		break;
	}
}
else //DEAD
{
	if(var_state != STATE_MACHINE.dead)
	{
		var_state = STATE_MACHINE.dead
		var_vspd = -6;
		repeat(4)
		{
			instance_create_depth(x, y, depth-1, obj_cloudSFX);
		};
	};
	else
	{
		state_dead();
	};
}

var _halfSprite = 12;

//Get hurt with spike
if(place_meeting(x, y, obj_spike)) and 
(var_state != STATE_MACHINE.hit) and
(var_state != STATE_MACHINE.dead) and
(!invincibleFrames)
{
		hp --;
		var_spd = var_mspd * -image_xscale;
		var_vspd = -var_jspd/2;
		var_state = STATE_MACHINE.hit
		audio_play_sound(sfx_hit, 0, 0);
		y -= 2;
};

if(x > room_width -_halfSprite+1)
{
	if(global.nextRoom != -1) and (!roomCooldown)//IF THERE'S OTHER ROOM
	{
		room_goto(global.nextRoom)
		x = _halfSprite+1;
		y -=2;
		roomCooldown = true;
		
		if(instance_exists(obj_pickle))
		{
			with(obj_pickle)
			{
				if(var_touched)
				{
					x = (_halfSprite -15) *pickleNumber;
				};
			};
		}
		
		if(instance_exists(obj_key))
		{
			with(obj_key)
			{
				if(var_touched)
				{
					x = (_halfSprite -15) *pickleNumber;
				};
			};
		}
	}
	else //IF THERE'S NO ROOM
	{
		x = room_width -_halfSprite+1;
	};
};
else if((x < _halfSprite))
{
	if(global.prevRoom != -1) and (!roomCooldown)
	{
		room_goto(global.prevRoom)
		alarm[11] = 1;
		roomCooldown = true;
	}
	else
	{
		x = _halfSprite;
	};
}

if(roomCooldown and (alarm[10] = -1))
{
	alarm[10] = 15;
}

//Start countdown to stop invincibility
if(invincibleFrames)
{
	//Flickering
	if(alarm[4]= -1){alarm[4] = 5};
	
	//Disable
	if(alarm[3] = -1){alarm[3] = 90};
}
else
{
	visible = true;
}

//Water makes you float
if(place_meeting(x, y, obj_water))
{
	if(var_effect != 1)
	{
		var_grav = -.45;
		var_vspd = clamp(var_vspd, -var_jspd*1.5, var_jspd)
	}
	else
	{
		var_grav = .35;
	}
	var_fric = .15;
	var_mspd = con_mspd/2;
	var_jspd = 6.25;
	
	var_wasUnderwater = true;
};
else if(place_meeting(x, y+1, obj_ice))
{
	var_grav = .45;
	var_fric = .05;
	var_jspd = 6.25;
	var_mspd = var_mspd*1.5;
}
else //Normal Stats
{
	var_fric = .15;
	var_grav = .45;
	var_mspd = con_mspd;
	var_jspd = 6.25;
};

switch (var_effect)
{
	case 0:
		var_spriteMod = "";
	break;
	
	case 1:
		var_spriteMod = "_crab";
	break;
	
	case 2:
		var_spriteMod = "_pepper";
	break;
	
	default:
		var_spriteMod = "";
	break;
}
//DIE INSTANTLY WHEN FALLING TO A PIT
if(y > room_height + sprite_height){hp = 0};

if(keyboard_check_pressed(ord("R")))
{
	game_restart();
};

if(place_meeting(x, y+1, obj_wall))
{
	var_combo = 0;
};