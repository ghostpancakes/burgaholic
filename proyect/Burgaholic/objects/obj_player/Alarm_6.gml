/// @description DIE
room_goto(var_checkpoint)
x = var_checkpointX
y = var_checkpointY

hp = maxHp;

var_state = STATE_MACHINE.normal;
var_spd = 0;
var_vspd = 0;
var_picklesFollowing = 0;
var_effect = 0; 
if(instance_exists(obj_pickle))
{
	instance_destroy(obj_pickle)
};

if(instance_exists(obj_key))
{
	instance_destroy(obj_key)
};