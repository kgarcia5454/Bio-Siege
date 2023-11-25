/// @description Initialize Variables 


//initialize basic entity variables
EntityBasicInitialize(10,1,10);

//the current horizontal speed of the entity, randomly set to left, right, or neither 
spdx = choose(-my_speed,0,my_speed);

//the current vertical speed of the entity, randomly set to up, down, or neither 
spdy = choose(-my_speed,0,my_speed);


