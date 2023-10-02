/// @description Handles Movement and Collision

//Basic Controls
var _xinput = keyboard_check(ord("D")) - keyboard_check(ord("A"));
var _yinput = keyboard_check(ord("S")) - keyboard_check(ord("W"));
move_and_collide(_xinput * my_speed, _yinput * my_speed, obj_wall);

if mouse_check_button_pressed(mb_left)
{
	instance_create_layer(x, y, layer, obj_bullet);
}

