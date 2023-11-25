/// @desc Decrease transparency

//if transparency is greater than 0
if (image_alpha > 0){
	//decrease transparency
	image_alpha -= 0.01;
}
//if transparency is 0
else{
	//destroy the gas
	instance_destroy();
}




