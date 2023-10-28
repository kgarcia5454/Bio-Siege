my_speed = 4 //move speed of the entity

//the current horizontal speed of the entity
spdx = 0;

//the current vertical speed of the entity
spdy = 0;

//size of the tiles in the room
tile_size = 32;

//references the tilemap layer used to check for collsions
collision_tilemap = layer_tilemap_get_id("Tile_collision");