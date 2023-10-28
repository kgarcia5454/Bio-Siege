/// @description Speed and Angle

//set intital direction based on mouse cursor position
direction = point_direction(x,y,mouse_x,mouse_y);
//add random bullet spray to the currrent direciton
direction = direction + random_range(-4, 4);
//set speed
speed = 12;
//set the image angle of the sprite based on direction
image_angle = direction;

//references the tilemap layer used to check for collsions
collision_tilemap = layer_tilemap_get_id("Tile_collision");