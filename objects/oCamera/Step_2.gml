/// @description Insert description here
// You can write your code in this editor

if(instance_exists(follow)){
	xTo = follow.x + ((viewWidth / follow.flightSpeed) * behindLook) * follow.hsp;
	
	
	x += (xTo - x) / 20;
	camera_set_view_pos(cam,min(max(x - viewWidth/2,0),RoomControl.roomWidth - viewWidth), y);
}



