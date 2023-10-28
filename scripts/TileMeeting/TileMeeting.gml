/// @TileMeeting(current X Position, current Y Position);
/// @param {index} object The Object to follow
/// @param {real}  speed  The speed to follow at
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