/// @description Insert description here
// You can write your code in this editor


if instance_exists(obj_player) and debug
{
	draw_set_color(c_white);
	draw_arrow(obj_player.x,obj_player.y,mouse_x,mouse_y,10);
	
	draw_set_color(c_fuchsia);
	draw_arrow(obj_player.x,obj_player.y,mouse_x + 10,mouse_y + 10,10);
}









