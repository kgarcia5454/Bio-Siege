/// @desc Draw Entity

//draw the entity with applicable FX
EntityDraw(sprite_index,image_index,x,y);


if obj_Game_Mode.debug_collision 
{
    draw_set_color(c_lime)
	draw_ellipse(bbox_left, bbox_top, bbox_right, bbox_bottom,false);
}





