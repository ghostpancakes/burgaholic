instance_deactivate_all(true);
instance_activate_object(obj_control);
enum menu
{
	pause,
	options,
	burgers
};
var_selected = 0;

//For making a lerping VFX
var_selectedDisplace = 0;
var_burgDisplace = 128;

var_state = menu.pause //0 = normal menu, 1 = options menu