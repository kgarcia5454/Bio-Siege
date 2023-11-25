/// @desc Tile Collision & Movement

//bounce entity speed on collision with tile
EntityCollisionTileCheck_bounce();

//move entity by speed
EntityMove(spdx,spdy);

//updates the entity invulnerabilty state
EntityInvulnerabilityUpdate();