/*

These are functions I've created to determine entity object behaviour.  
They will only work with entity objects who have the following variables in the create event:

my_speed -->move speed of the entity
spdx -->the current horizontal speed of the entity
spdy -->the current vertical speed of the entity

-Sean ;)

*/

/// @EntityBasicInitialize(entity_health,entity_speed,Entity_invulnerableTime);
/// @desc Intialize entity basic variables 
/// @param {real} entity_health Health of Entity
/// @param {real} entity_speed movement speed of entity
/// @param {real} entity_invulnerableTime time the entity will be invulnerable after damage
function EntityBasicInitialize(entity_health,entity_speed,Entity_invulnerableTime){
	
	hp_max = entity_health;  // the maximum number of hit points the entity can have

	hp = hp_max; //the number of hit points the entity has

	invulnerability = 0;  //if the entity is invulnerable

	invulnerable_duration = Entity_invulnerableTime; //the duration entity will be invulnerable

	invulnerable_time = invulnerable_duration; //the time left the entity is vulnarable
	
	blink = 0;  //if we are 'blinking' the sprite is invisible
	
	blink_frame_duration = 2; //the duration of the blink in frames
	
	blink_frame = blink_frame_duration; //the frames left in blink

	my_speed = entity_speed; //move speed of the entity

	//the current horizontal speed of the entity
	spdx = 0;
	
	//the current vertical speed of the entity
	spdy = 0;

	//references the tilemap layer used to check for collsions
	collision_tilemap = layer_tilemap_get_id("Tile_collision");	

}

/// @EntityMove(speed_x,speed_y);
/// @desc Moves the entity on the x/y axis by their x/y spd
/// @param {real} speed_x x speed of the object
/// @param {real} speed_y y speed of the object
function EntityMove(speed_x,speed_y){

	//move our current position relative to our horizonal and vertical speed
	x += speed_x;
	y += speed_y;
	
}

/// @EntityDraw(sprite,frame);
/// @desc Draws the sprite of the entity with FX
/// @param {index} sprite entity sprite index
/// @param {index} image frame of the sprite
/// @param {real} xx x position of the object
/// @param {real} yy y position of the object
function EntityDraw(sprite,frame,xx,yy){

	//if we are invulnerable and not blinking, draw sprite
	if (invulnerability){
		if (!blink){
			draw_sprite(sprite,frame,xx,yy);
		}
	}
	//if we are not invulnerable, draw sprite
	else{
		draw_sprite(sprite,frame,xx,yy);
	}
	
}

/// @EntityInvulnerabityUpdate();
/// @desc Updates the entity invulnerabilty variables
function EntityInvulnerabilityUpdate(){

	//if we are invulnerable from damage
	if (invulnerability){
		//if the invulnerabilty countdown has NOT ended
		if (invulnerable_time >= 0){
			//if there no are frames left in the blink
			if (blink_frame <= 0){
				//toggle blink
				if (blink) blink = 0;
				else blink = 1;
				//reset blink frame
				blink_frame = blink_frame_duration;
			}
			//if there are frames left in the blink
			else{
				//decrease blink frame
				blink_frame --;
			}
			//decrease invulnerabilty time
			invulnerable_time --;
		}
		//if the invulnerabilty countdown has ended
		else{
			//reset invulnerability
			invulnerability = 0;
			//reset blink
			blink = 0;
			//reset invulnerable time
			invulnerable_time = invulnerable_duration;
			//reset blink frames
			blink_frame = blink_frame_duration
			
		}
	}
	
}

/// @EntityTakeDamage(entity,damage);
/// @desc Damages the entity and triggers invulnerability
/// @param {index} entity ID of the entity taking damage
/// @param {real} damage damage the entity will take
function EntityTakeDamage(entity,damage){

	//Apply the following to this entity ID
	with (entity){
		//if the entity is NOT currently invulnerable
		if (!invulnerability){
			//decrease hp by damage
			hp -= damage;
		
			//if entity has NO hp left
			if (hp <= 0){
				//if entity is the player
				if (entity.object_index == obj_player){
					//restart the current room
					room_restart();
				}
				//if entity is NOT the player
				else{
					//destory the entity
					instance_destroy();
				}
			}
			//if entity has hp left
			else{
				invulnerability = 1;
			}
		}
	}
}