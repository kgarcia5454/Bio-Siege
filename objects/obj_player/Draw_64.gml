/// @desc Draw Player HUD

//draw black background rectangle
draw_rectangle_color(0,0,160,30,c_black,c_black,c_black,c_black,0);

//allign the text to the left
draw_set_halign(fa_left);
//draw the players health
draw_text_color(5,5,"health: " + string(hp ) + " / " + string(hp_max),c_white,c_white,c_white,c_white,1);




