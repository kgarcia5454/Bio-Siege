/// @description Speed and Angle

direction = point_direction(x,y,mouse_x,mouse_y);
direction = direction + random_range(-4, 4);
speed = 12;
image_angle = direction;