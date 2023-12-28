/// @description Insert description here
// You can write your code in this editor

if(isFalling){
	vsp += RoomControl.grv;
	if(place_meeting(x,y+vsp,oGround))
	{
		if(vsp >0)
		{
			while(!place_meeting(x,y+sign(vsp),oGround)){
				y += sign(vsp);	
			}
			vsp = 0;
			isFalling = false;
		}
	}
	y += vsp;
}



function pecked()
{
	//var carryable = sGrassCarry;
	//if(sprite_index == sGrassYellow) carryable = sGrassCarry;
	with(instance_create_layer(x,y,"Hunters",oCarryable))
	{
			//sprite_index = carryable;
			x = other.x;
			y = other.y;
			
	}
	instance_destroy(self);
}


