/// @description Insert description here
// You can write your code in this editor


if(isFalling){
	y += 5;
	if(place_meeting(x-sprite_width/2,y-5,oGround)&&place_meeting(x+sprite_width/2,y-5,oGround))
	{
		isFalling = false;
	
	}
		
}











