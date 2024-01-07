/// @description Insert description here
// You can write your code in this editor
var camX = 0;
if(instance_exists(follow)){
	
	xTo = follow.x + ((viewWidth / follow.flightSpeed) * behindLook) * follow.hsp;
	
	
	x += (xTo - x) / 20;
	camX = min(max(x - viewWidth/2,0),RoomControl.roomWidth - viewWidth);
	camera_set_view_pos(cam,camX, y);
}

if(bg1 == pointer_null && layer_exists("BackgroundTreesFront")) bg1 = layer_get_id("BackgroundTreesFront")	;

if(bg2 == pointer_null && layer_exists("BackgroundTreesBack")) bg2 = layer_get_id("BackgroundTreesBack")	;


if(bg1 != pointer_null )
{
	layer_x(bg1, camX/4);	
}
if(bg2 != pointer_null)
{
	layer_x(bg2, camX/7);	
}