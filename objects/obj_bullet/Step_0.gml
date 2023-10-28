/// @description Destruction Collision
// You can write your code in this editor

///if collision with enemy, destroy self
if(place_meeting(x,y,obj_enemy)){
	instance_destroy(id)
}


//check for a collision with a tile
var meeting =  tilemap_get_at_pixel(collision_tilemap, bbox_right, bbox_top)
		|| tilemap_get_at_pixel(collision_tilemap, bbox_right, bbox_bottom)
		|| tilemap_get_at_pixel(collision_tilemap, bbox_left, bbox_top)
		|| tilemap_get_at_pixel(collision_tilemap, bbox_left, bbox_bottom)

//if there was a collision, destroy self
if (meeting)
	{
		instance_destroy();
	}