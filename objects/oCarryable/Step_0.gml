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
	if(place_meeting(x+hsp,y,oGround)){
	while(!place_meeting(x+sign(hsp),y,oGround)){
		x += sign(hsp);	
	}
	
}



	x += hsp;
	y += vsp;
}


