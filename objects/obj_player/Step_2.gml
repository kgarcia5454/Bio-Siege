/// @desc Tile Collision & Movement

//stop entity speed on collision with tile
EntityCollisionTileCheck_stop();

//move entity by speed
EntityMove(spdx,spdy);

//updates the entity invulnerabilty state
EntityInvulnerabilityUpdate();