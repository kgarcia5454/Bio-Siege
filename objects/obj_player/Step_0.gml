/// @description Get Input & Speed / shoot bullet

//get xy input from WASD keyboard presses
var _xinput = keyboard_check(ord("D")) - keyboard_check(ord("A"));
var _yinput = keyboard_check(ord("S")) - keyboard_check(ord("W"));

//set current speed based on xy input
spdx = _xinput * my_speed;
spdy = _yinput * my_speed;


//if left mouse button is pressed create bullet
if mouse_check_button_pressed(mb_left)
{
	instance_create_layer(x, y, layer, obj_bullet);
}

