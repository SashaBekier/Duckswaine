/// @description Insert description here
// You can write your code in this editor

if(isFalling && myBody != pointer_null){
	with(myBody)
	{
		other.vsp += RoomControl.grv * other.gravMultiplier;
		var yMod = other.vsp + other.baseOffset;
		if(place_meeting(x-sprite_width/2,y+yMod,oGround) && place_meeting(x+sprite_width/2,y+yMod,oGround))
		{
			if(other.vsp >0)
			{
				while(!place_meeting(x,y+sign(other.vsp)+other.baseOffset,oGround)){
					y += sign(other.vsp);	
				}
				other.vsp = 0;
				other.isFalling = false;
			}
		} 
		else
		{
			y += other.vsp;
		}
	}
}








