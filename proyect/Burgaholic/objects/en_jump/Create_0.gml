// Inherit the parent event
event_inherited();
var_hitSprite = spr_enJumpHIT;
var_idleSprite = spr_enJumpIdle;

mask_index = var_idleSprite;
t = 0;

action = function(){with(obj_player){var_vspd = -var_jspd*1.3; /*k_dirCap = sign(var_spd)*/}};