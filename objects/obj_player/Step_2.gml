/// @description Movement & Tile Collision
 
 
 
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

//move our current position relative to our horizonal and vertical speed
x += spdx;
y += spdy;