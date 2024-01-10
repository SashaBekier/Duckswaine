/// @description Insert description here
// You can write your code in this editor

if((isFalling || activeMotion) && myBody != pointer_null)
{
	with(myBody)
	{
		other.vsp += RoomControl.grv * other.gravMultiplier;
		var yMod = other.vsp + other.baseOffset;
		if(place_meeting(x-sprite_width/2,y+yMod,oGround) && place_meeting(x+sprite_width/2,y+yMod,oGround))
		{
			if(other.vsp >0)
			{
				while(!place_meeting(x,y+sign(other.vsp)+other.baseOffset,oGround))
				{
					y += sign(other.vsp);	
				}
				other.vsp *= -1 * other.bounce * oGround.bounceY;
				if(abs(other.vsp) < 0.2) other.isFalling = false;
			}
		} 
		else
		{
			y += other.vsp;
		}
		
		if(place_meeting(x+other.hsp,y-other.maxUpStep+other.baseOffset,oGround)) other.hsp = 0;
		//else if(place_meeting(x+other.hsp,y,oGround))
		//{
		//	while(!place_meeting(x+sign(other.hsp),y,oGround)) x += sign(other.hsp);
		//	y--;
	//		other.hsp *= oGround.resistX;
		//} 
		//else 
		//{
			x += other.hsp;	
		//}
		if(y > 1200)
		{
			instance_destroy();
			instance_destroy(other);
		}
	}
	
	 
}


	






