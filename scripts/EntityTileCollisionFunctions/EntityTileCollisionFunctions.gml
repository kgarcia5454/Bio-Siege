/*
TILE COLLISION FUNCTIONS

I created these functions to handle object collisions with tiles.

The first function (TileMeeting) is the function for checking an object's collison box 
for a collsion with a tile.  This function is used in the other functions below it.

The rest of the functions are for determining what an entity object does when 
a tile collision is detected. These should be compatiable with any object in the 
entity group, as they should all have the following variables in the create event:

my_speed -->move speed of the entity
spdx -->the current horizontal speed of the entity
spdy -->the current vertical speed of the entity

Run these functions in the end step event of the entity.

-Sean ;) 

*/



/// @TileMeeting(xx,yy,tilemap);
/// @desc Checks a position for collision with a tile within the tilemap
/// @param {real} xx x position of the object
/// @param {real} yy y position of the object
/// @param {index} tilemap Collsion tilemap ID of the Object
function TileMeeting(xx,yy,tilemap){

var xp,yp, meeting;

//save our current position
xp = x;
yp = y;

//move to the position to check for a tile collison
x = xx;
y = yy;

///check for a collision on all four corners of the collision mask
meeting =  tilemap_get_at_pixel(tilemap, bbox_right, bbox_top)
		|| tilemap_get_at_pixel(tilemap, bbox_right, bbox_bottom)
		|| tilemap_get_at_pixel(tilemap, bbox_left, bbox_top)
		|| tilemap_get_at_pixel(tilemap, bbox_left, bbox_bottom)
		
//move back to the original position
x = xp;
y = yp;

//return if there was a collision or not
return(meeting);

}


/// @EntityCollisionTileCheck_stop();
/// @desc Checks for entity collision with a collision tile and stops the entity at the point of contact
function EntityCollisionTileCheck_stop(){
	
		//if there is a tile collision at our current position plus our horizontal speed
	if (TileMeeting(x + spdx, y, collision_tilemap))
	{
		//while there is no collision, gradually move us to meet the tile and then reset horizontal speed
		while (!TileMeeting(x + sign(spdx), y, collision_tilemap))
		{
			x += sign(spdx);
		}
		spdx = 0;
	}

	//if there is a collision at our current position plus our vertical speed
	if (TileMeeting(x, y + spdy, collision_tilemap))
	{
		//while there is no collision, gradually move us to meet the tile and then reset vertical speed
		while (!TileMeeting(x, y + sign(spdy), collision_tilemap))
		{
			y += sign(spdy);
		}
		spdy = 0;
	}

	
}

/// @EntityCollisionTileCheck_bounce();
/// @desc Checks for entity collision with a collision tile and bounces the entity off the point of contact
function EntityCollisionTileCheck_bounce(){
	
		//if there is a tile collision at our current position plus our horizontal speed
	if (TileMeeting(x + spdx, y, collision_tilemap))
	{
		//while there is no collision, gradually move us to meet the tile and then reset horizontal speed
		while (!TileMeeting(x + sign(spdx), y, collision_tilemap))
		{
			x += sign(spdx);
		}
		spdx = -spdx;
	}

	//if there is a collision at our current position plus our vertical speed
	if (TileMeeting(x, y + spdy, collision_tilemap))
	{
		//while there is no collision, gradually move us to meet the tile and then reset vertical speed
		while (!TileMeeting(x, y + sign(spdy), collision_tilemap))
		{
			y += sign(spdy);
		}
		spdy = -spdy;
	}
	
}