// Inherit the parent event
event_inherited();
var_hitSprite = spr_enSlimeTinyHIT;
var_idleSprite = spr_enSlimeTinyIdle;
action = function(){with(obj_player){var_spd = -sign(var_spd)*var_mspd*2; var_vspd = -var_jspd; k_dirCap = sign(var_spd); image_xscale = sign(var_spd)}};