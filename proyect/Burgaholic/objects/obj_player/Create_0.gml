image_speed = IMAGE_SPEED;
//depth = -1;
//STATES
enum STATE_MACHINE
{
	normal,
	wallrun,
	hit,
	pound,
	roll,
	bump,
	dash,
	punch,
	dead,
	
	tubeIn,
	tubeOut
};

var_state = STATE_MACHINE.normal
//SPEED
//Horizontal
var_spd = 0;
var_mspd = 2;

var_spdCarry = 0;
var_vspdCarry = 0;

var_fric = .15;

//Vertical
var_vspd = 0;
var_jspd = 6.25;
var_grav = .45;

var_oneWayGrounded = false; //Grounded in a One Way Wall
var_grounded = false;
var_groundCheck = 0;
var_coyoteTime = 6; //Time before you can't jump on air anymore

//MISC
roomCooldown = false; //Cooldown for the transitions between rooms
invincibleFrames = false;
var_picklesFollowing = 0;
var_canDMG = false;
var_canPunch = true;

k_dirCap = 0;
k_jumpCap = 0;
mask_index = spr_playerIdle;

maxHp = 3;
hp = maxHp;

var_checkpoint = rm_forest;
var_checkpointX = 136;
var_checkpointY = 208 -64;

var_effect = 0; //Carrying a crab/exploding baby, etc
var_spriteMod = "";

var_combo = 0; //ammount of enemies you've hit
t = 0; //for oscilation in the hearts

var_redAlpha = 0; //The opacity for the red when you step on magma