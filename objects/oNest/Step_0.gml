/// @description Insert description here
// You can write your code in this editor


if(isFalling){
	vsp += RoomControl.grv;
	if(place_meeting(x,y+vsp-5,oGround))
	{
		if(vsp >0)
		{
			while(!place_meeting(x,y+sign(vsp)-5,oGround)){
				y += sign(vsp);	
			}
			vsp = 0;
			isFalling = false;
		}
	}
	y += vsp;
}

sinceKicked++;


